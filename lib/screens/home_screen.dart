import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/exercise_provider.dart';
import '../widgets/ring_chart_widget.dart';
import '../utils/date_helpers.dart';
import '../utils/constants.dart';
import '../database/database_helper.dart';
import '../models/hp_data.dart';
import 'settings_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _physicalPoints = 0;
  int _mentalPoints = 0;
  final String _selectedDate = DateHelpers.getToday();

  @override
  void initState() {
    super.initState();
    _loadTodayPoints();
  }

  Future<void> _loadTodayPoints() async {
    final db = DatabaseHelper.instance;
    final points = await db.getDailyPoints(_selectedDate);
    
    if (points != null && mounted) {
      setState(() {
        _physicalPoints = points['physical'] as int? ?? 0;
        _mentalPoints = points['mental'] as int? ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Energy Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: RingChartWidget(
                  physicalPoints: _physicalPoints,
                  mentalPoints: _mentalPoints,
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Points',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    
                    Row(
                      children: [
                        const SizedBox(width: 100, child: Text('Stamina:')),
                        Expanded(
                          child: Slider(
                            value: _physicalPoints.toDouble(),
                            min: 0,
                            max: 10,
                            divisions: 10,
                            label: _physicalPoints.toString(),
                            onChanged: (value) {
                              setState(() => _physicalPoints = value.toInt());
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Text(
                            _physicalPoints.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      children: [
                        const SizedBox(width: 100, child: Text('Mana:')),
                        Expanded(
                          child: Slider(
                            value: _mentalPoints.toDouble(),
                            min: 0,
                            max: 10,
                            divisions: 10,
                            label: _mentalPoints.toString(),
                            onChanged: (value) {
                              setState(() => _mentalPoints = value.toInt());
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Text(
                            _mentalPoints.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _savePoints,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Save Points',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Exercises",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    
                    ref.watch(todayExerciseLogsProvider).when(
                          data: (logs) {
                            if (logs.isEmpty) {
                              return const Center(child: Text('No exercises today'));
                            }
                            
                            return Column(
                              children: logs.map((log) {
                                return CheckboxListTile(
                                  title: Text(log.exerciseName ?? 'Exercise'),
                                  subtitle: Text('${log.actualValue}/${log.targetValue} ${log.unit}'),
                                  value: log.completed,
                                  onChanged: (bool? value) {
                                    if (value != null) _updateExercise(log, value);
                                  },
                                );
                              }).toList(),
                            );
                          },
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (error, stack) => Center(child: Text('Error: $error')),
                        ),
                    
                    const SizedBox(height: 8),
                    
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Manage Exercises'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _savePoints() async {
    final hp = HPData.calculateHP(_physicalPoints, _mentalPoints);
    
    final db = DatabaseHelper.instance;
    await db.saveDailyPoints({
      'date': _selectedDate,
      'physical': _physicalPoints,
      'mental': _mentalPoints,
      'hp': hp,
    });
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Points saved! HP: $hp'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  Future<void> _updateExercise(dynamic log, bool completed) async {
    final updateProgress = ref.read(updateExerciseProgressProvider);
    
    await updateProgress(
      exerciseId: log.exerciseId,
      date: _selectedDate,
      actualValue: completed ? log.targetValue : 0,
      completed: completed,
    );
    
    ref.invalidate(todayExerciseLogsProvider);
  }
}
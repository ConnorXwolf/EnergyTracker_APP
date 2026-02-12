import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_screen.dart';
import 'database/database_helper.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化數據庫
  await DatabaseHelper.instance.database;
  
  // 初始化 SharedPreferences
  await SharedPreferences.getInstance();
  
  runApp(
    const ProviderScope(
      child: EnergyTrackerApp(),
    ),
  );
}

class EnergyTrackerApp extends StatelessWidget {
  const EnergyTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: AppColors.backgroundMain,
          surface: AppColors.backgroundWidget,
        ),
        scaffoldBackgroundColor: AppColors.backgroundMain,
        cardColor: AppColors.backgroundWidget,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textPrimary),
          bodyMedium: TextStyle(color: AppColors.textSecondary),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundWidget,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
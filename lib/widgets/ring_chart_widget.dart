import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../utils/constants.dart';
import '../models/hp_data.dart';

class RingChartWidget extends StatelessWidget {
  final int physicalPoints;
  final int mentalPoints;

  const RingChartWidget({
    super.key,
    required this.physicalPoints,
    required this.mentalPoints,
  });

  @override
  Widget build(BuildContext context) {
    final hp = HPData.calculateHP(physicalPoints, mentalPoints);
    
    return CustomPaint(
      painter: _RingChartPainter(
        physicalPoints: physicalPoints,
        mentalPoints: mentalPoints,
        hp: hp,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HP $hp',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Stamina: $physicalPoints pts',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.stamina,
              ),
            ),
            Text(
              'Mana: $mentalPoints pts',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mana,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RingChartPainter extends CustomPainter {
  final int physicalPoints;
  final int mentalPoints;
  final int hp;

  _RingChartPainter({
    required this.physicalPoints,
    required this.mentalPoints,
    required this.hp,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;
    
    const ringWidth = 40.0;
    const ringGap = 20.0;
    
    final outerRingOuter = radius;
    final outerRingInner = radius - ringWidth;
    final innerRingOuter = outerRingInner - ringGap;
    final innerRingInner = innerRingOuter - ringWidth;
    
    _drawRingBackground(canvas, center, outerRingOuter, outerRingInner);
    _drawRingBackground(canvas, center, innerRingOuter, innerRingInner);
    
    if (physicalPoints > 0) {
      final angle = (physicalPoints / 10) * 360;
      _drawRingProgress(
        canvas,
        center,
        outerRingOuter,
        outerRingInner,
        angle,
        AppColors.stamina,
      );
    }
    
    if (mentalPoints > 0) {
      final angle = (mentalPoints / 10) * 360;
      _drawRingProgress(
        canvas,
        center,
        innerRingOuter,
        innerRingInner,
        angle,
        AppColors.mana,
      );
    }
  }

  void _drawRingBackground(
    Canvas canvas,
    Offset center,
    double outerRadius,
    double innerRadius,
  ) {
    final paint = Paint()
      ..color = AppColors.backgroundCard
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerRadius - innerRadius;
    
    canvas.drawCircle(center, (outerRadius + innerRadius) / 2, paint);
  }

  void _drawRingProgress(
    Canvas canvas,
    Offset center,
    double outerRadius,
    double innerRadius,
    double angleDegrees,
    Color color,
  ) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerRadius - innerRadius
      ..strokeCap = StrokeCap.round;
    
    final rect = Rect.fromCircle(
      center: center,
      radius: (outerRadius + innerRadius) / 2,
    );
    
    const startAngle = -math.pi / 2;
    final sweepAngle = (angleDegrees / 360) * 2 * math.pi;
    
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(_RingChartPainter oldDelegate) {
    return oldDelegate.physicalPoints != physicalPoints ||
        oldDelegate.mentalPoints != mentalPoints ||
        oldDelegate.hp != hp;
  }
}
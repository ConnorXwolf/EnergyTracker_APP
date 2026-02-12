import 'package:flutter/material.dart';

/// 應用常量定義
class AppConstants {
  static const String appName = 'Energy Tracker';
  static const String appVersion = '1.0.0';
  static const String databaseName = 'energy_tracker.db';
  static const int databaseVersion = 1;
}

/// 應用顏色定義（對應原專案的暗黑主題）
class AppColors {
  // 主色調
  static const Color primary = Color(0xFF4ECDC4);      // Cyan
  static const Color secondary = Color(0xFFFFD93D);    // Yellow
  
  // 背景色
  static const Color backgroundMain = Color(0xFF1E1E1E);
  static const Color backgroundWidget = Color(0xFF2D2D2D);
  static const Color backgroundCard = Color(0xFF3D3D3D);
  
  // 文字顏色
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFAAAAAA);
  
  // 邊框顏色
  static const Color border = Color(0xFF555555);
  
  // 狀態顏色
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
  
  // 運動類別顏色（對應原專案）
  static const Color cardio = Color(0xFF808080);      // Gray
  static const Color muscle = Color(0xFF808080);      // Gray
  static const Color stretch = Color(0xFF808080);     // Gray
  
  // HP 類別顏色
  static const Color stamina = Color(0xFFFFD93D);     // Yellow (Physical)
  static const Color mana = Color(0xFF4E6ECD);        // Blue (Mental)
}

/// 運動類別枚舉
enum ExerciseCategory {
  cardio('Cardio', AppColors.cardio),
  muscle('Muscle', AppColors.muscle),
  stretch('Stretch', AppColors.stretch);

  const ExerciseCategory(this.label, this.color);
  final String label;
  final Color color;
}

/// 測量單位枚舉
enum ExerciseUnit {
  reps('reps'),
  sets('sets'),
  minutes('minutes'),
  km('km'),
  hours('hours');

  const ExerciseUnit(this.label);
  final String label;
}

/// 任務優先級枚舉
enum TaskPriority {
  low(0, 'Low', Colors.grey),
  medium(1, 'Medium', Colors.orange),
  high(2, 'High', Colors.red);

  const TaskPriority(this.value, this.label, this.color);
  final int value;
  final String label;
  final Color color;
}

/// HP 分數範圍定義
class HPRanges {
  static const int minHP = 20;
  static const int maxHP = 100;
  static const int minPoints = 0;
  static const int maxPoints = 10;
  
  /// HP 分數到顏色的映射
  static Color getColorForHP(int hp) {
    if (hp <= 20) return const Color(0xFFB0B0B0);      // Light Gray (Default)
    if (hp <= 40) return const Color(0xFFFF6B6B);      // Red (Very Low)
    if (hp <= 55) return const Color(0xFFFFBE57);      // Orange (Low)
    if (hp <= 75) return const Color(0xFFB7E6B9);      // Light Green (Moderate)
    if (hp <= 83) return const Color(0xFF68CC6D);      // Green (High)
    return const Color(0xFF1FDE28);                    // Bright Green (Maximum)
  }
  
  /// HP 分數到類別的映射
  static String getCategoryForHP(int hp) {
    if (hp == 20) return 'None';
    if (hp <= 40) return 'Very Low';
    if (hp <= 55) return 'Low';
    if (hp <= 75) return 'Moderate';
    if (hp <= 83) return 'High';
    return 'Maximum';
  }
}
import 'package:intl/intl.dart';

/// 日期處理工具類
class DateHelpers {
  /// 獲取今天的日期字符串（ISO格式：YYYY-MM-DD）
  static String getToday() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }
  
  /// 格式化日期為顯示格式（例如：February 09, 2026）
  static String formatDateDisplay(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('MMMM dd, yyyy').format(date);
    } catch (e) {
      return dateStr;
    }
  }
  
  /// 獲取日期範圍內的所有日期
  static List<String> getDateRange(String startDate, String endDate) {
    final start = DateTime.parse(startDate);
    final end = DateTime.parse(endDate);
    
    final dates = <String>[];
    var current = start;
    
    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      dates.add(DateFormat('yyyy-MM-dd').format(current));
      current = current.add(const Duration(days: 1));
    }
    
    return dates;
  }
  
  /// 獲取本週的所有日期（週一到週日）
  static List<String> getWeekDates(String referenceDate) {
    final ref = DateTime.parse(referenceDate);
    final monday = ref.subtract(Duration(days: ref.weekday - 1));
    
    return List.generate(
      7,
      (i) => DateFormat('yyyy-MM-dd').format(
        monday.add(Duration(days: i)),
      ),
    );
  }
  
  /// 獲取指定月份的所有日期
  static List<DateTime> getMonthDates(int year, int month) {
    final firstDay = DateTime(year, month, 1);
    final lastDay = DateTime(year, month + 1, 0);
    
    final dates = <DateTime>[];
    var current = firstDay;
    
    while (current.isBefore(lastDay) || current.isAtSameMomentAs(lastDay)) {
      dates.add(current);
      current = current.add(const Duration(days: 1));
    }
    
    return dates;
  }
  
  /// 計算兩個日期之間的天數差
  static int daysBetween(String date1, String date2) {
    final d1 = DateTime.parse(date1);
    final d2 = DateTime.parse(date2);
    return (d2.difference(d1).inDays).abs();
  }
  
  /// 檢查是否為今天
  static bool isToday(String dateStr) {
    return dateStr == getToday();
  }
  
  /// 獲取昨天的日期
  static String getYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return DateFormat('yyyy-MM-dd').format(yesterday);
  }
  
  /// 獲取明天的日期
  static String getTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return DateFormat('yyyy-MM-dd').format(tomorrow);
  }
  
  /// 解析 ISO 日期字符串為 DateTime
  static DateTime? parseISODate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return null;
    try {
      return DateTime.parse(dateStr);
    } catch (e) {
      return null;
    }
  }
  
  /// 格式化 DateTime 為 ISO 字符串
  static String toISODate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
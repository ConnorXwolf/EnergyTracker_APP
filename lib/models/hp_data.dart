import 'package:freezed_annotation/freezed_annotation.dart';

part 'hp_data.freezed.dart';
part 'hp_data.g.dart';

@freezed
class HPData with _$HPData {
  const factory HPData({
    required String date,
    @Default(0) int physical,
    @Default(0) int mental,
    @Default(20) int hp,
    String? createdAt,
    String? updatedAt,
  }) = _HPData;

  const HPData._();

  factory HPData.fromJson(Map<String, dynamic> json) => _$HPDataFromJson(json);
  
  factory HPData.fromMap(Map<String, dynamic> map) {
    return HPData(
      date: map['date'] as String,
      physical: map['physical'] as int? ?? 0,
      mental: map['mental'] as int? ?? 0,
      hp: map['hp'] as int? ?? 20,
      createdAt: map['created_at'] as String?,
      updatedAt: map['updated_at'] as String?,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'physical': physical,
      'mental': mental,
      'hp': hp,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    };
  }
  
  static int calculateHP(int physical, int mental) {
    final rawHP = physical + mental;
    final hp = 20 + (rawHP * 4);
    return hp.clamp(20, 100);
  }
  
  int get rawHP => physical + mental;
  
  String getCategory() {
    if (hp == 20) return 'None';
    if (hp <= 40) return 'Very Low';
    if (hp <= 55) return 'Low';
    if (hp <= 75) return 'Moderate';
    if (hp <= 83) return 'High';
    return 'Maximum';
  }
}
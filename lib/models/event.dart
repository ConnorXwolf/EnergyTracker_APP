import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent({
    @Default(0) int id,
    required String title,
    required String eventDate,
    String? description,
    String? createdAt,
  }) = _CalendarEvent;

  const CalendarEvent._();

  factory CalendarEvent.fromJson(Map<String, dynamic> json) => _$CalendarEventFromJson(json);
  
  factory CalendarEvent.fromMap(Map<String, dynamic> map) {
    return CalendarEvent(
      id: map['id'] as int? ?? 0,
      title: map['title'] as String,
      eventDate: map['event_date'] as String,
      description: map['description'] as String?,
      createdAt: map['created_at'] as String?,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      if (id != 0) 'id': id,
      'title': title,
      'event_date': eventDate,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    };
  }
  
  bool isPastEvent(String currentDate) {
    return DateTime.parse(eventDate).isBefore(DateTime.parse(currentDate));
  }
  
  bool isToday(String currentDate) {
    return eventDate == currentDate;
  }
}
import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rupee_object_data_model.g.dart';

@Entity()
@JsonSerializable()
class RupeeObjectDataModel {
  int id = 0;
  String userId;
  String rupeeId;
  String title;
  String description;
  DateTime date;
  double amount;
  int day;
  int month;
  int year;
  String type;
  bool isSynced;

  RupeeObjectDataModel({
    required this.rupeeId,
    required this.userId,
    required this.title,
    required this.date,
    required this.description,
    required this.amount,
    required this.day,
    required this.month,
    required this.year,
    required this.type,
    this.isSynced = false,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'rupeeId': rupeeId,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'amount': amount,
      'day': day,
      'month': month,
      'year': year,
      'type': type,
      'isSynced': isSynced,
    };
  }

  // Create from JSON
  factory RupeeObjectDataModel.fromJson(Map<String, dynamic> json) {
    return RupeeObjectDataModel(
      rupeeId: json['rupeeId'] ?? '',
      userId: json['userId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      day: json['day'] ?? 1,
      month: json['month'] ?? 1,
      year: json['year'] ?? 1970,
      type: json['type'] ?? '',
      isSynced: json['isSynced'] ?? false,
    )..id = json['id'] ?? 0;
  }
}

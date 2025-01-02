// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rupee_object_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RupeeObjectDataModel _$RupeeObjectDataModelFromJson(
        Map<String, dynamic> json) =>
    RupeeObjectDataModel(
      rupeeId: json['rupeeId'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      day: (json['day'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      type: json['type'] as String,
      isSynced: json['isSynced'] as bool? ?? false,
    )..id = (json['id'] as num).toInt();

Map<String, dynamic> _$RupeeObjectDataModelToJson(
        RupeeObjectDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'rupeeId': instance.rupeeId,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'type': instance.type,
      'isSynced': instance.isSynced,
    };

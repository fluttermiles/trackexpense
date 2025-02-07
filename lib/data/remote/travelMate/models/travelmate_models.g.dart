// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travelmate_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelMateModelImpl _$$TravelMateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelMateModelImpl(
      userId: json['userId'] as String?,
      travelId: json['travelId'] as String?,
      id: json['id'] as String?,
      title: json['title'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      day: (json['day'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      type: json['type'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$TravelMateModelImplToJson(
        _$TravelMateModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'travelId': instance.travelId,
      'id': instance.id,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'amount': instance.amount,
      'type': instance.type,
      'description': instance.description,
    };

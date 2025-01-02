// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rupeemate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RupeeMateModelImpl _$$RupeeMateModelImplFromJson(Map<String, dynamic> json) =>
    _$RupeeMateModelImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      day: (json['day'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$RupeeMateModelImplToJson(
        _$RupeeMateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'amount': instance.amount,
      'date': instance.date?.toIso8601String(),
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'type': instance.type,
    };

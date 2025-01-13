// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelModelImpl _$$TravelModelImplFromJson(Map<String, dynamic> json) =>
    _$TravelModelImpl(
      creatorId: json['creatorId'] as String?,
      travelId: json['travelId'] as String?,
      currency: json['currency'] as String?,
      actualCost: (json['actualCost'] as num?)?.toDouble(),
      approxCost: (json['approxCost'] as num?)?.toDouble(),
      conversionCurrency: json['conversionCurrency'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      userList: (json['userList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      readerList: (json['readerList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      writerList: (json['writerList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      adminList: (json['adminList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      place: json['place'] as String?,
    );

Map<String, dynamic> _$$TravelModelImplToJson(_$TravelModelImpl instance) =>
    <String, dynamic>{
      'creatorId': instance.creatorId,
      'travelId': instance.travelId,
      'currency': instance.currency,
      'actualCost': instance.actualCost,
      'approxCost': instance.approxCost,
      'conversionCurrency': instance.conversionCurrency,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'date': instance.date?.toIso8601String(),
      'userList': instance.userList,
      'readerList': instance.readerList,
      'writerList': instance.writerList,
      'adminList': instance.adminList,
      'place': instance.place,
    };

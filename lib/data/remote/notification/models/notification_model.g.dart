// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      senderId: json['senderId'] as String?,
      recieverId: json['recieverId'] as String?,
      splitId: json['splitId'] as String?,
      id: json['id'] as String?,
      notificationTitle: json['notificationTitle'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      type: json['type'] as String?,
      status: json['status'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'recieverId': instance.recieverId,
      'splitId': instance.splitId,
      'id': instance.id,
      'notificationTitle': instance.notificationTitle,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'type': instance.type,
      'status': instance.status,
      'description': instance.description,
    };

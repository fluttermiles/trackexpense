// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_friend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SplitFriendModelImpl _$$SplitFriendModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SplitFriendModelImpl(
      creatorId: json['creatorId'] as String?,
      splitId: json['splitID'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      userList: (json['userList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      writerList: (json['writerList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      adminList: (json['adminList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      title: json['title'] as String?,
      currency: json['currency'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SplitFriendModelImplToJson(
        _$SplitFriendModelImpl instance) =>
    <String, dynamic>{
      'creatorId': instance.creatorId,
      'splitID': instance.splitId,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'userList': instance.userList,
      'writerList': instance.writerList,
      'adminList': instance.adminList,
      'title': instance.title,
      'currency': instance.currency,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_friend_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SplitFriendDetailModelImpl _$$SplitFriendDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SplitFriendDetailModelImpl(
      creatorId: json['creatorId'] as String?,
      splitId: json['splitID'] as String?,
      userContribution: (json['userContribution'] as List<dynamic>?)
          ?.map((e) => UserContribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      currency: json['currency'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as String?,
      day: (json['day'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SplitFriendDetailModelImplToJson(
        _$SplitFriendDetailModelImpl instance) =>
    <String, dynamic>{
      'creatorId': instance.creatorId,
      'splitID': instance.splitId,
      'userContribution': instance.userContribution
          ?.map((e) => e.toJson())
          .toList(),
      'title': instance.title,
      'currency': instance.currency,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'amount': instance.amount,
      'description': instance.description,
    };

_$UserContributionImpl _$$UserContributionImplFromJson(
        Map<String, dynamic> json) =>
    _$UserContributionImpl(
      userId: json['userId'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      name: json['name'] as String?,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$$UserContributionImplToJson(
        _$UserContributionImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'amount': instance.amount,
      'name': instance.name,
      'isSelected': instance.isSelected,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      age: (json['age'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      countryCode: json['countryCode'] as String?,
      userId: json['userId'] as String?,
      emailId: json['emailId'] as String?,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'age': instance.age,
      'phoneNumber': instance.phoneNumber,
      'countryCode': instance.countryCode,
      'userId': instance.userId,
      'emailId': instance.emailId,
    };

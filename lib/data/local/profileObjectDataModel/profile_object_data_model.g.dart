// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_object_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileObjectModel _$ProfileObjectModelFromJson(Map<String, dynamic> json) =>
    ProfileObjectModel(
      userId: json['userId'] as String,
      name: json['name'] as String,
      emailId: json['emailId'] as String,
      imageUrl: json['imageUrl'] as String,
      phoneNumber: json['phoneNumber'] as String,
      countryCode: json['countryCode'] as String,
      age: json['age'] as String,
      isSynced: json['isSynced'] as bool? ?? false,
    )..id = (json['id'] as num).toInt();

Map<String, dynamic> _$ProfileObjectModelToJson(ProfileObjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'emailId': instance.emailId,
      'phoneNumber': instance.phoneNumber,
      'imageUrl': instance.imageUrl,
      'countryCode': instance.countryCode,
      'age': instance.age,
      'isSynced': instance.isSynced,
    };

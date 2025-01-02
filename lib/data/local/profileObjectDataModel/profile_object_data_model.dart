import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_object_data_model.g.dart';

@Entity()
@JsonSerializable()
class ProfileObjectModel {
  int id = 0;
  String userId;
  String name;
  String emailId;
  String phoneNumber;
  String imageUrl;
  String countryCode;
  String age;
  bool isSynced;

  ProfileObjectModel({
    required this.userId,
    required this.name,
    required this.emailId,
    required this.imageUrl,
    required this.phoneNumber,
    required this.countryCode,
    required this.age,
    this.isSynced = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'emailId': emailId,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
      'countryCode': countryCode,
      'age': age,
      'isSynced': isSynced,
    };
  }

  factory ProfileObjectModel.fromJson(Map<String, dynamic> json) {
    return ProfileObjectModel(
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      emailId: json['emailId'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      countryCode: json['countryCode'] ?? '',
      age: json['age'] ?? '',
      isSynced: json['isSynced'] ?? false,
    )..id = json['id'] ?? 0;
  }
}

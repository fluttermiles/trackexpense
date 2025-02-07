import 'package:objectbox/objectbox.dart';

@Entity()
class ProfileObjectModel {
  @Id()
  int id = 0;
  String? userId;
  String? name;
  String? emailId;
  String? phoneNumber;
  String? imageUrl;
  String? countryCode;
  String? age;
  bool? isSynced;

  ProfileObjectModel({
    this.userId,
    this.name,
    this.emailId,
    this.imageUrl,
    this.phoneNumber,
    this.countryCode,
    this.age,
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

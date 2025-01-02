// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

@freezed
class ProfileModel with _$ProfileModel {
    const factory ProfileModel({
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "imageUrl")
        String? imageUrl,
        @JsonKey(name: "age")
        int? age,
        @JsonKey(name: "phoneNumber")
        String? phoneNumber,
        @JsonKey(name: "countryCode")
        String? countryCode,
        @JsonKey(name: "userId")
        String? userId,
        @JsonKey(name: "emailId")
        String? emailId,
    }) = _ProfileModel;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
}

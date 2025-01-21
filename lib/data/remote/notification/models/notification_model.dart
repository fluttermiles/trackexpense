import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

@freezed
class NotificationModel with _$NotificationModel {
    const factory NotificationModel({
        @JsonKey(name: "senderId")
        String? senderId,
        @JsonKey(name: "recieverId")
        String? recieverId,
        @JsonKey(name: "splitId")
        String? splitId,
        @JsonKey(name: "id")
        String? id,
        @JsonKey(name: "notificationTitle")
        String? notificationTitle,
        @JsonKey(name: "createdAt")
        DateTime? createdAt,
        @JsonKey(name: "updatedAt")
        DateTime? updatedAt,
        @JsonKey(name: "type")
        String? type,
        @JsonKey(name: "status")
        String? status,
        @JsonKey(name: "description")
        String? description,
    }) = _NotificationModel;

    factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}
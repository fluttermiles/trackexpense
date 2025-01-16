import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'split_friend_model.freezed.dart';
part 'split_friend_model.g.dart';

SplitFriendModel splitFriendModelFromJson(String str) => SplitFriendModel.fromJson(json.decode(str));

String splitFriendModelToJson(SplitFriendModel data) => json.encode(data.toJson());

@freezed
class SplitFriendModel with _$SplitFriendModel {
    const factory SplitFriendModel({
        @JsonKey(name: "creatorId")
        String? creatorId,
        @JsonKey(name: "splitID")
        String? splitId,
        @JsonKey(name: "startDate")
        DateTime? startDate,
        @JsonKey(name: "endDate")
        DateTime? endDate,
        @JsonKey(name: "userList")
        List<String>? userList,
        @JsonKey(name: "writerList")
        List<String>? writerList,
        @JsonKey(name: "adminList")
        List<String>? adminList,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "currency")
        String? currency,
        @JsonKey(name: "createdAt")
        DateTime? createdAt,
        @JsonKey(name: "updatedAt")
        DateTime? updatedAt,
    }) = _SplitFriendModel;

    factory SplitFriendModel.fromJson(Map<String, dynamic> json) => _$SplitFriendModelFromJson(json);
}

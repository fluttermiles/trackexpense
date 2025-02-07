import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'split_friend_detail_model.freezed.dart';
part 'split_friend_detail_model.g.dart';

SplitFriendDetailModel splitFriendDetailModelFromJson(String str) => SplitFriendDetailModel.fromJson(json.decode(str));

String splitFriendDetailModelToJson(SplitFriendDetailModel data) => json.encode(data.toJson());

@freezed
class SplitFriendDetailModel with _$SplitFriendDetailModel {
    const factory SplitFriendDetailModel({
        @JsonKey(name: "creatorId")
        String? creatorId,
        @JsonKey(name: "splitID")
        String? splitId,
        @JsonKey(name: "userContribution")
        List<UserContribution>? userContribution,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "currency")
        String? currency,
        @JsonKey(name: "createdAt")
        DateTime? createdAt,
        @JsonKey(name: "updatedAt")
        DateTime? updatedAt,
        @JsonKey(name: "id")
        String? id,
        @JsonKey(name: "day")
        int? day,
        @JsonKey(name: "month")
        int? month,
        @JsonKey(name: "year")
        int? year,
        @JsonKey(name: "amount")
        double? amount,
        @JsonKey(name: "description")
        String? description,
    }) = _SplitFriendDetailModel;

    factory SplitFriendDetailModel.fromJson(Map<String, dynamic> json) => _$SplitFriendDetailModelFromJson(json);
}

@freezed
class UserContribution with _$UserContribution {
    const factory UserContribution({
        @JsonKey(name: "userId")
        String? userId,
        @JsonKey(name: "amount")
        double? amount,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "isSelected")
        bool? isSelected,
    }) = _UserContribution;

    factory UserContribution.fromJson(Map<String, dynamic> json) => _$UserContributionFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'travelmate_models.freezed.dart';
part 'travelmate_models.g.dart';

TravelMateModel travelMateModelFromJson(String str) => TravelMateModel.fromJson(json.decode(str));

String travelMateModelToJson(TravelMateModel data) => json.encode(data.toJson());

@freezed
class TravelMateModel with _$TravelMateModel {
    const factory TravelMateModel({
        @JsonKey(name: "userId")
        String? userId,
        @JsonKey(name: "travelId")
        String? travelId,
        @JsonKey(name: "id")
        String? id,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "date")
        DateTime? date,
        @JsonKey(name: "day")
        int? day,
        @JsonKey(name: "month")
        int? month,
        @JsonKey(name: "year")
        int? year,
        @JsonKey(name: "amount")
        double? amount,
        @JsonKey(name: "type")
        String? type,
        @JsonKey(name: "description")
        String? description,
    }) = _TravelMateModel;

    factory TravelMateModel.fromJson(Map<String, dynamic> json) => _$TravelMateModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'rupeemate_model.freezed.dart';
part 'rupeemate_model.g.dart';

List<RupeeMateModel> rupeeMateModelFromJson(String str) => List<RupeeMateModel>.from(json.decode(str).map((x) => RupeeMateModel.fromJson(x)));

String rupeeMateModelToJson(List<RupeeMateModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class RupeeMateModel with _$RupeeMateModel {
    const factory RupeeMateModel({
        @JsonKey(name: "id")
        String? id,
        @JsonKey(name: "userId")
        String? userId,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "amount")
        double? amount,
        @JsonKey(name: "date")
        DateTime? date,
        @JsonKey(name: "day")
        int? day,
        @JsonKey(name: "month")
        int? month,
        @JsonKey(name: "year")
        int? year,
        @JsonKey(name: "type")
        String? type,
    }) = _RupeeMateModel;

    factory RupeeMateModel.fromJson(Map<String, dynamic> json) => _$RupeeMateModelFromJson(json);
}

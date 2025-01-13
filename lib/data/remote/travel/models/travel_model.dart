import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'travel_model.freezed.dart';
part 'travel_model.g.dart';

TravelModel travelModelFromJson(String str) => TravelModel.fromJson(json.decode(str));

String travelModelToJson(TravelModel data) => json.encode(data.toJson());

@freezed
class TravelModel with _$TravelModel {
    const factory TravelModel({
        @JsonKey(name: "creatorId")
        String? creatorId,
        @JsonKey(name: "travelId")
        String? travelId,
        @JsonKey(name: "currency")
        String? currency,
        @JsonKey(name: "actualCost")
        double? actualCost,
        @JsonKey(name: "approxCost")
        double? approxCost,
        @JsonKey(name: "conversionCurrency")
        String? conversionCurrency,
        @JsonKey(name: "startDate")
        DateTime? startDate,
        @JsonKey(name: "endDate")
        DateTime? endDate,
        @JsonKey(name: "date")
        DateTime? date,
        @JsonKey(name: "userList")
        List<String>? userList,
        @JsonKey(name: "readerList")
        List<String>? readerList,
        @JsonKey(name: "writerList")
        List<String>? writerList,
        @JsonKey(name: "adminList")
        List<String>? adminList,
        @JsonKey(name: "place")
        String? place,
    }) = _TravelModel;

    factory TravelModel.fromJson(Map<String, dynamic> json) => _$TravelModelFromJson(json);
}
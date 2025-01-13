// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelModel _$TravelModelFromJson(Map<String, dynamic> json) {
  return _TravelModel.fromJson(json);
}

/// @nodoc
mixin _$TravelModel {
  @JsonKey(name: "creatorId")
  String? get creatorId => throw _privateConstructorUsedError;
  @JsonKey(name: "travelId")
  String? get travelId => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "actualCost")
  double? get actualCost => throw _privateConstructorUsedError;
  @JsonKey(name: "approxCost")
  double? get approxCost => throw _privateConstructorUsedError;
  @JsonKey(name: "conversionCurrency")
  String? get conversionCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: "startDate")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "endDate")
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "userList")
  List<String>? get userList => throw _privateConstructorUsedError;
  @JsonKey(name: "readerList")
  List<String>? get readerList => throw _privateConstructorUsedError;
  @JsonKey(name: "writerList")
  List<String>? get writerList => throw _privateConstructorUsedError;
  @JsonKey(name: "adminList")
  List<String>? get adminList => throw _privateConstructorUsedError;
  @JsonKey(name: "place")
  String? get place => throw _privateConstructorUsedError;

  /// Serializes this TravelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelModelCopyWith<TravelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelModelCopyWith<$Res> {
  factory $TravelModelCopyWith(
          TravelModel value, $Res Function(TravelModel) then) =
      _$TravelModelCopyWithImpl<$Res, TravelModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "creatorId") String? creatorId,
      @JsonKey(name: "travelId") String? travelId,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "actualCost") double? actualCost,
      @JsonKey(name: "approxCost") double? approxCost,
      @JsonKey(name: "conversionCurrency") String? conversionCurrency,
      @JsonKey(name: "startDate") DateTime? startDate,
      @JsonKey(name: "endDate") DateTime? endDate,
      @JsonKey(name: "date") DateTime? date,
      @JsonKey(name: "userList") List<String>? userList,
      @JsonKey(name: "readerList") List<String>? readerList,
      @JsonKey(name: "writerList") List<String>? writerList,
      @JsonKey(name: "adminList") List<String>? adminList,
      @JsonKey(name: "place") String? place});
}

/// @nodoc
class _$TravelModelCopyWithImpl<$Res, $Val extends TravelModel>
    implements $TravelModelCopyWith<$Res> {
  _$TravelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = freezed,
    Object? travelId = freezed,
    Object? currency = freezed,
    Object? actualCost = freezed,
    Object? approxCost = freezed,
    Object? conversionCurrency = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? date = freezed,
    Object? userList = freezed,
    Object? readerList = freezed,
    Object? writerList = freezed,
    Object? adminList = freezed,
    Object? place = freezed,
  }) {
    return _then(_value.copyWith(
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      travelId: freezed == travelId
          ? _value.travelId
          : travelId // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      actualCost: freezed == actualCost
          ? _value.actualCost
          : actualCost // ignore: cast_nullable_to_non_nullable
              as double?,
      approxCost: freezed == approxCost
          ? _value.approxCost
          : approxCost // ignore: cast_nullable_to_non_nullable
              as double?,
      conversionCurrency: freezed == conversionCurrency
          ? _value.conversionCurrency
          : conversionCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userList: freezed == userList
          ? _value.userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      readerList: freezed == readerList
          ? _value.readerList
          : readerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      writerList: freezed == writerList
          ? _value.writerList
          : writerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      adminList: freezed == adminList
          ? _value.adminList
          : adminList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelModelImplCopyWith<$Res>
    implements $TravelModelCopyWith<$Res> {
  factory _$$TravelModelImplCopyWith(
          _$TravelModelImpl value, $Res Function(_$TravelModelImpl) then) =
      __$$TravelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "creatorId") String? creatorId,
      @JsonKey(name: "travelId") String? travelId,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "actualCost") double? actualCost,
      @JsonKey(name: "approxCost") double? approxCost,
      @JsonKey(name: "conversionCurrency") String? conversionCurrency,
      @JsonKey(name: "startDate") DateTime? startDate,
      @JsonKey(name: "endDate") DateTime? endDate,
      @JsonKey(name: "date") DateTime? date,
      @JsonKey(name: "userList") List<String>? userList,
      @JsonKey(name: "readerList") List<String>? readerList,
      @JsonKey(name: "writerList") List<String>? writerList,
      @JsonKey(name: "adminList") List<String>? adminList,
      @JsonKey(name: "place") String? place});
}

/// @nodoc
class __$$TravelModelImplCopyWithImpl<$Res>
    extends _$TravelModelCopyWithImpl<$Res, _$TravelModelImpl>
    implements _$$TravelModelImplCopyWith<$Res> {
  __$$TravelModelImplCopyWithImpl(
      _$TravelModelImpl _value, $Res Function(_$TravelModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = freezed,
    Object? travelId = freezed,
    Object? currency = freezed,
    Object? actualCost = freezed,
    Object? approxCost = freezed,
    Object? conversionCurrency = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? date = freezed,
    Object? userList = freezed,
    Object? readerList = freezed,
    Object? writerList = freezed,
    Object? adminList = freezed,
    Object? place = freezed,
  }) {
    return _then(_$TravelModelImpl(
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      travelId: freezed == travelId
          ? _value.travelId
          : travelId // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      actualCost: freezed == actualCost
          ? _value.actualCost
          : actualCost // ignore: cast_nullable_to_non_nullable
              as double?,
      approxCost: freezed == approxCost
          ? _value.approxCost
          : approxCost // ignore: cast_nullable_to_non_nullable
              as double?,
      conversionCurrency: freezed == conversionCurrency
          ? _value.conversionCurrency
          : conversionCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userList: freezed == userList
          ? _value._userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      readerList: freezed == readerList
          ? _value._readerList
          : readerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      writerList: freezed == writerList
          ? _value._writerList
          : writerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      adminList: freezed == adminList
          ? _value._adminList
          : adminList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelModelImpl implements _TravelModel {
  const _$TravelModelImpl(
      {@JsonKey(name: "creatorId") this.creatorId,
      @JsonKey(name: "travelId") this.travelId,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "actualCost") this.actualCost,
      @JsonKey(name: "approxCost") this.approxCost,
      @JsonKey(name: "conversionCurrency") this.conversionCurrency,
      @JsonKey(name: "startDate") this.startDate,
      @JsonKey(name: "endDate") this.endDate,
      @JsonKey(name: "date") this.date,
      @JsonKey(name: "userList") final List<String>? userList,
      @JsonKey(name: "readerList") final List<String>? readerList,
      @JsonKey(name: "writerList") final List<String>? writerList,
      @JsonKey(name: "adminList") final List<String>? adminList,
      @JsonKey(name: "place") this.place})
      : _userList = userList,
        _readerList = readerList,
        _writerList = writerList,
        _adminList = adminList;

  factory _$TravelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelModelImplFromJson(json);

  @override
  @JsonKey(name: "creatorId")
  final String? creatorId;
  @override
  @JsonKey(name: "travelId")
  final String? travelId;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "actualCost")
  final double? actualCost;
  @override
  @JsonKey(name: "approxCost")
  final double? approxCost;
  @override
  @JsonKey(name: "conversionCurrency")
  final String? conversionCurrency;
  @override
  @JsonKey(name: "startDate")
  final DateTime? startDate;
  @override
  @JsonKey(name: "endDate")
  final DateTime? endDate;
  @override
  @JsonKey(name: "date")
  final DateTime? date;
  final List<String>? _userList;
  @override
  @JsonKey(name: "userList")
  List<String>? get userList {
    final value = _userList;
    if (value == null) return null;
    if (_userList is EqualUnmodifiableListView) return _userList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _readerList;
  @override
  @JsonKey(name: "readerList")
  List<String>? get readerList {
    final value = _readerList;
    if (value == null) return null;
    if (_readerList is EqualUnmodifiableListView) return _readerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _writerList;
  @override
  @JsonKey(name: "writerList")
  List<String>? get writerList {
    final value = _writerList;
    if (value == null) return null;
    if (_writerList is EqualUnmodifiableListView) return _writerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _adminList;
  @override
  @JsonKey(name: "adminList")
  List<String>? get adminList {
    final value = _adminList;
    if (value == null) return null;
    if (_adminList is EqualUnmodifiableListView) return _adminList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "place")
  final String? place;

  @override
  String toString() {
    return 'TravelModel(creatorId: $creatorId, travelId: $travelId, currency: $currency, actualCost: $actualCost, approxCost: $approxCost, conversionCurrency: $conversionCurrency, startDate: $startDate, endDate: $endDate, date: $date, userList: $userList, readerList: $readerList, writerList: $writerList, adminList: $adminList, place: $place)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelModelImpl &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.travelId, travelId) ||
                other.travelId == travelId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.actualCost, actualCost) ||
                other.actualCost == actualCost) &&
            (identical(other.approxCost, approxCost) ||
                other.approxCost == approxCost) &&
            (identical(other.conversionCurrency, conversionCurrency) ||
                other.conversionCurrency == conversionCurrency) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._userList, _userList) &&
            const DeepCollectionEquality()
                .equals(other._readerList, _readerList) &&
            const DeepCollectionEquality()
                .equals(other._writerList, _writerList) &&
            const DeepCollectionEquality()
                .equals(other._adminList, _adminList) &&
            (identical(other.place, place) || other.place == place));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      creatorId,
      travelId,
      currency,
      actualCost,
      approxCost,
      conversionCurrency,
      startDate,
      endDate,
      date,
      const DeepCollectionEquality().hash(_userList),
      const DeepCollectionEquality().hash(_readerList),
      const DeepCollectionEquality().hash(_writerList),
      const DeepCollectionEquality().hash(_adminList),
      place);

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelModelImplCopyWith<_$TravelModelImpl> get copyWith =>
      __$$TravelModelImplCopyWithImpl<_$TravelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelModelImplToJson(
      this,
    );
  }
}

abstract class _TravelModel implements TravelModel {
  const factory _TravelModel(
      {@JsonKey(name: "creatorId") final String? creatorId,
      @JsonKey(name: "travelId") final String? travelId,
      @JsonKey(name: "currency") final String? currency,
      @JsonKey(name: "actualCost") final double? actualCost,
      @JsonKey(name: "approxCost") final double? approxCost,
      @JsonKey(name: "conversionCurrency") final String? conversionCurrency,
      @JsonKey(name: "startDate") final DateTime? startDate,
      @JsonKey(name: "endDate") final DateTime? endDate,
      @JsonKey(name: "date") final DateTime? date,
      @JsonKey(name: "userList") final List<String>? userList,
      @JsonKey(name: "readerList") final List<String>? readerList,
      @JsonKey(name: "writerList") final List<String>? writerList,
      @JsonKey(name: "adminList") final List<String>? adminList,
      @JsonKey(name: "place") final String? place}) = _$TravelModelImpl;

  factory _TravelModel.fromJson(Map<String, dynamic> json) =
      _$TravelModelImpl.fromJson;

  @override
  @JsonKey(name: "creatorId")
  String? get creatorId;
  @override
  @JsonKey(name: "travelId")
  String? get travelId;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "actualCost")
  double? get actualCost;
  @override
  @JsonKey(name: "approxCost")
  double? get approxCost;
  @override
  @JsonKey(name: "conversionCurrency")
  String? get conversionCurrency;
  @override
  @JsonKey(name: "startDate")
  DateTime? get startDate;
  @override
  @JsonKey(name: "endDate")
  DateTime? get endDate;
  @override
  @JsonKey(name: "date")
  DateTime? get date;
  @override
  @JsonKey(name: "userList")
  List<String>? get userList;
  @override
  @JsonKey(name: "readerList")
  List<String>? get readerList;
  @override
  @JsonKey(name: "writerList")
  List<String>? get writerList;
  @override
  @JsonKey(name: "adminList")
  List<String>? get adminList;
  @override
  @JsonKey(name: "place")
  String? get place;

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelModelImplCopyWith<_$TravelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

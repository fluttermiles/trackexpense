// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_friend_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SplitFriendDetailModel _$SplitFriendDetailModelFromJson(
    Map<String, dynamic> json) {
  return _SplitFriendDetailModel.fromJson(json);
}

/// @nodoc
mixin _$SplitFriendDetailModel {
  @JsonKey(name: "creatorId")
  String? get creatorId => throw _privateConstructorUsedError;
  @JsonKey(name: "splitID")
  String? get splitId => throw _privateConstructorUsedError;
  @JsonKey(name: "userContribution")
  List<UserContribution>? get userContribution =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "day")
  int? get day => throw _privateConstructorUsedError;
  @JsonKey(name: "month")
  int? get month => throw _privateConstructorUsedError;
  @JsonKey(name: "year")
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this SplitFriendDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplitFriendDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplitFriendDetailModelCopyWith<SplitFriendDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitFriendDetailModelCopyWith<$Res> {
  factory $SplitFriendDetailModelCopyWith(SplitFriendDetailModel value,
          $Res Function(SplitFriendDetailModel) then) =
      _$SplitFriendDetailModelCopyWithImpl<$Res, SplitFriendDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "creatorId") String? creatorId,
      @JsonKey(name: "splitID") String? splitId,
      @JsonKey(name: "userContribution")
      List<UserContribution>? userContribution,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "id") String? id,
      @JsonKey(name: "day") int? day,
      @JsonKey(name: "month") int? month,
      @JsonKey(name: "year") int? year,
      @JsonKey(name: "amount") double? amount,
      @JsonKey(name: "description") String? description});
}

/// @nodoc
class _$SplitFriendDetailModelCopyWithImpl<$Res,
        $Val extends SplitFriendDetailModel>
    implements $SplitFriendDetailModelCopyWith<$Res> {
  _$SplitFriendDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplitFriendDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = freezed,
    Object? splitId = freezed,
    Object? userContribution = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? id = freezed,
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? amount = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      splitId: freezed == splitId
          ? _value.splitId
          : splitId // ignore: cast_nullable_to_non_nullable
              as String?,
      userContribution: freezed == userContribution
          ? _value.userContribution
          : userContribution // ignore: cast_nullable_to_non_nullable
              as List<UserContribution>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplitFriendDetailModelImplCopyWith<$Res>
    implements $SplitFriendDetailModelCopyWith<$Res> {
  factory _$$SplitFriendDetailModelImplCopyWith(
          _$SplitFriendDetailModelImpl value,
          $Res Function(_$SplitFriendDetailModelImpl) then) =
      __$$SplitFriendDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "creatorId") String? creatorId,
      @JsonKey(name: "splitID") String? splitId,
      @JsonKey(name: "userContribution")
      List<UserContribution>? userContribution,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "id") String? id,
      @JsonKey(name: "day") int? day,
      @JsonKey(name: "month") int? month,
      @JsonKey(name: "year") int? year,
      @JsonKey(name: "amount") double? amount,
      @JsonKey(name: "description") String? description});
}

/// @nodoc
class __$$SplitFriendDetailModelImplCopyWithImpl<$Res>
    extends _$SplitFriendDetailModelCopyWithImpl<$Res,
        _$SplitFriendDetailModelImpl>
    implements _$$SplitFriendDetailModelImplCopyWith<$Res> {
  __$$SplitFriendDetailModelImplCopyWithImpl(
      _$SplitFriendDetailModelImpl _value,
      $Res Function(_$SplitFriendDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplitFriendDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = freezed,
    Object? splitId = freezed,
    Object? userContribution = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? id = freezed,
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? amount = freezed,
    Object? description = freezed,
  }) {
    return _then(_$SplitFriendDetailModelImpl(
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      splitId: freezed == splitId
          ? _value.splitId
          : splitId // ignore: cast_nullable_to_non_nullable
              as String?,
      userContribution: freezed == userContribution
          ? _value._userContribution
          : userContribution // ignore: cast_nullable_to_non_nullable
              as List<UserContribution>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplitFriendDetailModelImpl implements _SplitFriendDetailModel {
  const _$SplitFriendDetailModelImpl(
      {@JsonKey(name: "creatorId") this.creatorId,
      @JsonKey(name: "splitID") this.splitId,
      @JsonKey(name: "userContribution")
      final List<UserContribution>? userContribution,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "id") this.id,
      @JsonKey(name: "day") this.day,
      @JsonKey(name: "month") this.month,
      @JsonKey(name: "year") this.year,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "description") this.description})
      : _userContribution = userContribution;

  factory _$SplitFriendDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplitFriendDetailModelImplFromJson(json);

  @override
  @JsonKey(name: "creatorId")
  final String? creatorId;
  @override
  @JsonKey(name: "splitID")
  final String? splitId;
  final List<UserContribution>? _userContribution;
  @override
  @JsonKey(name: "userContribution")
  List<UserContribution>? get userContribution {
    final value = _userContribution;
    if (value == null) return null;
    if (_userContribution is EqualUnmodifiableListView)
      return _userContribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "day")
  final int? day;
  @override
  @JsonKey(name: "month")
  final int? month;
  @override
  @JsonKey(name: "year")
  final int? year;
  @override
  @JsonKey(name: "amount")
  final double? amount;
  @override
  @JsonKey(name: "description")
  final String? description;

  @override
  String toString() {
    return 'SplitFriendDetailModel(creatorId: $creatorId, splitId: $splitId, userContribution: $userContribution, title: $title, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt, id: $id, day: $day, month: $month, year: $year, amount: $amount, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplitFriendDetailModelImpl &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.splitId, splitId) || other.splitId == splitId) &&
            const DeepCollectionEquality()
                .equals(other._userContribution, _userContribution) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      creatorId,
      splitId,
      const DeepCollectionEquality().hash(_userContribution),
      title,
      currency,
      createdAt,
      updatedAt,
      id,
      day,
      month,
      year,
      amount,
      description);

  /// Create a copy of SplitFriendDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplitFriendDetailModelImplCopyWith<_$SplitFriendDetailModelImpl>
      get copyWith => __$$SplitFriendDetailModelImplCopyWithImpl<
          _$SplitFriendDetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplitFriendDetailModelImplToJson(
      this,
    );
  }
}

abstract class _SplitFriendDetailModel implements SplitFriendDetailModel {
  const factory _SplitFriendDetailModel(
          {@JsonKey(name: "creatorId") final String? creatorId,
          @JsonKey(name: "splitID") final String? splitId,
          @JsonKey(name: "userContribution")
          final List<UserContribution>? userContribution,
          @JsonKey(name: "title") final String? title,
          @JsonKey(name: "currency") final String? currency,
          @JsonKey(name: "createdAt") final DateTime? createdAt,
          @JsonKey(name: "updatedAt") final DateTime? updatedAt,
          @JsonKey(name: "id") final String? id,
          @JsonKey(name: "day") final int? day,
          @JsonKey(name: "month") final int? month,
          @JsonKey(name: "year") final int? year,
          @JsonKey(name: "amount") final double? amount,
          @JsonKey(name: "description") final String? description}) =
      _$SplitFriendDetailModelImpl;

  factory _SplitFriendDetailModel.fromJson(Map<String, dynamic> json) =
      _$SplitFriendDetailModelImpl.fromJson;

  @override
  @JsonKey(name: "creatorId")
  String? get creatorId;
  @override
  @JsonKey(name: "splitID")
  String? get splitId;
  @override
  @JsonKey(name: "userContribution")
  List<UserContribution>? get userContribution;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "currency")
  String? get currency;
  @override
  @JsonKey(name: "createdAt")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "day")
  int? get day;
  @override
  @JsonKey(name: "month")
  int? get month;
  @override
  @JsonKey(name: "year")
  int? get year;
  @override
  @JsonKey(name: "amount")
  double? get amount;
  @override
  @JsonKey(name: "description")
  String? get description;

  /// Create a copy of SplitFriendDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplitFriendDetailModelImplCopyWith<_$SplitFriendDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserContribution _$UserContributionFromJson(Map<String, dynamic> json) {
  return _UserContribution.fromJson(json);
}

/// @nodoc
mixin _$UserContribution {
  @JsonKey(name: "userId")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "isSelected")
  bool? get isSelected => throw _privateConstructorUsedError;

  /// Serializes this UserContribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserContribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserContributionCopyWith<UserContribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContributionCopyWith<$Res> {
  factory $UserContributionCopyWith(
          UserContribution value, $Res Function(UserContribution) then) =
      _$UserContributionCopyWithImpl<$Res, UserContribution>;
  @useResult
  $Res call(
      {@JsonKey(name: "userId") String? userId,
      @JsonKey(name: "amount") double? amount,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "isSelected") bool? isSelected});
}

/// @nodoc
class _$UserContributionCopyWithImpl<$Res, $Val extends UserContribution>
    implements $UserContributionCopyWith<$Res> {
  _$UserContributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserContribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? amount = freezed,
    Object? name = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserContributionImplCopyWith<$Res>
    implements $UserContributionCopyWith<$Res> {
  factory _$$UserContributionImplCopyWith(_$UserContributionImpl value,
          $Res Function(_$UserContributionImpl) then) =
      __$$UserContributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "userId") String? userId,
      @JsonKey(name: "amount") double? amount,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "isSelected") bool? isSelected});
}

/// @nodoc
class __$$UserContributionImplCopyWithImpl<$Res>
    extends _$UserContributionCopyWithImpl<$Res, _$UserContributionImpl>
    implements _$$UserContributionImplCopyWith<$Res> {
  __$$UserContributionImplCopyWithImpl(_$UserContributionImpl _value,
      $Res Function(_$UserContributionImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserContribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? amount = freezed,
    Object? name = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$UserContributionImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserContributionImpl implements _UserContribution {
  const _$UserContributionImpl(
      {@JsonKey(name: "userId") this.userId,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "isSelected") this.isSelected});

  factory _$UserContributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserContributionImplFromJson(json);

  @override
  @JsonKey(name: "userId")
  final String? userId;
  @override
  @JsonKey(name: "amount")
  final double? amount;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "isSelected")
  final bool? isSelected;

  @override
  String toString() {
    return 'UserContribution(userId: $userId, amount: $amount, name: $name, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserContributionImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, amount, name, isSelected);

  /// Create a copy of UserContribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserContributionImplCopyWith<_$UserContributionImpl> get copyWith =>
      __$$UserContributionImplCopyWithImpl<_$UserContributionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserContributionImplToJson(
      this,
    );
  }
}

abstract class _UserContribution implements UserContribution {
  const factory _UserContribution(
          {@JsonKey(name: "userId") final String? userId,
          @JsonKey(name: "amount") final double? amount,
          @JsonKey(name: "name") final String? name,
          @JsonKey(name: "isSelected") final bool? isSelected}) =
      _$UserContributionImpl;

  factory _UserContribution.fromJson(Map<String, dynamic> json) =
      _$UserContributionImpl.fromJson;

  @override
  @JsonKey(name: "userId")
  String? get userId;
  @override
  @JsonKey(name: "amount")
  double? get amount;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "isSelected")
  bool? get isSelected;

  /// Create a copy of UserContribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserContributionImplCopyWith<_$UserContributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

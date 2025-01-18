// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_friend_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SplitFriendModel _$SplitFriendModelFromJson(Map<String, dynamic> json) {
  return _SplitFriendModel.fromJson(json);
}

/// @nodoc
mixin _$SplitFriendModel {
  @JsonKey(name: "creatorId")
  String? get creatorId => throw _privateConstructorUsedError;
  @JsonKey(name: "splitID")
  String? get splitId => throw _privateConstructorUsedError;
  @JsonKey(name: "totalAmount")
  double? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "startDate")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "endDate")
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "userList")
  List<String>? get userList => throw _privateConstructorUsedError;
  @JsonKey(name: "userListDetail")
  List<UserList>? get userListDetail => throw _privateConstructorUsedError;
  @JsonKey(name: "writerList")
  List<String>? get writerList => throw _privateConstructorUsedError;
  @JsonKey(name: "adminList")
  List<String>? get adminList => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "currency")
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SplitFriendModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplitFriendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplitFriendModelCopyWith<SplitFriendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitFriendModelCopyWith<$Res> {
  factory $SplitFriendModelCopyWith(
          SplitFriendModel value, $Res Function(SplitFriendModel) then) =
      _$SplitFriendModelCopyWithImpl<$Res, SplitFriendModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "creatorId") String? creatorId,
      @JsonKey(name: "splitID") String? splitId,
      @JsonKey(name: "totalAmount") double? totalAmount,
      @JsonKey(name: "startDate") DateTime? startDate,
      @JsonKey(name: "endDate") DateTime? endDate,
      @JsonKey(name: "userList") List<String>? userList,
      @JsonKey(name: "userListDetail") List<UserList>? userListDetail,
      @JsonKey(name: "writerList") List<String>? writerList,
      @JsonKey(name: "adminList") List<String>? adminList,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt});
}

/// @nodoc
class _$SplitFriendModelCopyWithImpl<$Res, $Val extends SplitFriendModel>
    implements $SplitFriendModelCopyWith<$Res> {
  _$SplitFriendModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplitFriendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = freezed,
    Object? splitId = freezed,
    Object? totalAmount = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? userList = freezed,
    Object? userListDetail = freezed,
    Object? writerList = freezed,
    Object? adminList = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userList: freezed == userList
          ? _value.userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userListDetail: freezed == userListDetail
          ? _value.userListDetail
          : userListDetail // ignore: cast_nullable_to_non_nullable
              as List<UserList>?,
      writerList: freezed == writerList
          ? _value.writerList
          : writerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      adminList: freezed == adminList
          ? _value.adminList
          : adminList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplitFriendModelImplCopyWith<$Res>
    implements $SplitFriendModelCopyWith<$Res> {
  factory _$$SplitFriendModelImplCopyWith(_$SplitFriendModelImpl value,
          $Res Function(_$SplitFriendModelImpl) then) =
      __$$SplitFriendModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "creatorId") String? creatorId,
      @JsonKey(name: "splitID") String? splitId,
      @JsonKey(name: "totalAmount") double? totalAmount,
      @JsonKey(name: "startDate") DateTime? startDate,
      @JsonKey(name: "endDate") DateTime? endDate,
      @JsonKey(name: "userList") List<String>? userList,
      @JsonKey(name: "userListDetail") List<UserList>? userListDetail,
      @JsonKey(name: "writerList") List<String>? writerList,
      @JsonKey(name: "adminList") List<String>? adminList,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt});
}

/// @nodoc
class __$$SplitFriendModelImplCopyWithImpl<$Res>
    extends _$SplitFriendModelCopyWithImpl<$Res, _$SplitFriendModelImpl>
    implements _$$SplitFriendModelImplCopyWith<$Res> {
  __$$SplitFriendModelImplCopyWithImpl(_$SplitFriendModelImpl _value,
      $Res Function(_$SplitFriendModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplitFriendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creatorId = freezed,
    Object? splitId = freezed,
    Object? totalAmount = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? userList = freezed,
    Object? userListDetail = freezed,
    Object? writerList = freezed,
    Object? adminList = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SplitFriendModelImpl(
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      splitId: freezed == splitId
          ? _value.splitId
          : splitId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userList: freezed == userList
          ? _value._userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userListDetail: freezed == userListDetail
          ? _value._userListDetail
          : userListDetail // ignore: cast_nullable_to_non_nullable
              as List<UserList>?,
      writerList: freezed == writerList
          ? _value._writerList
          : writerList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      adminList: freezed == adminList
          ? _value._adminList
          : adminList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplitFriendModelImpl implements _SplitFriendModel {
  const _$SplitFriendModelImpl(
      {@JsonKey(name: "creatorId") this.creatorId,
      @JsonKey(name: "splitID") this.splitId,
      @JsonKey(name: "totalAmount") this.totalAmount,
      @JsonKey(name: "startDate") this.startDate,
      @JsonKey(name: "endDate") this.endDate,
      @JsonKey(name: "userList") final List<String>? userList,
      @JsonKey(name: "userListDetail") final List<UserList>? userListDetail,
      @JsonKey(name: "writerList") final List<String>? writerList,
      @JsonKey(name: "adminList") final List<String>? adminList,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt})
      : _userList = userList,
        _userListDetail = userListDetail,
        _writerList = writerList,
        _adminList = adminList;

  factory _$SplitFriendModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplitFriendModelImplFromJson(json);

  @override
  @JsonKey(name: "creatorId")
  final String? creatorId;
  @override
  @JsonKey(name: "splitID")
  final String? splitId;
  @override
  @JsonKey(name: "totalAmount")
  final double? totalAmount;
  @override
  @JsonKey(name: "startDate")
  final DateTime? startDate;
  @override
  @JsonKey(name: "endDate")
  final DateTime? endDate;
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

  final List<UserList>? _userListDetail;
  @override
  @JsonKey(name: "userListDetail")
  List<UserList>? get userListDetail {
    final value = _userListDetail;
    if (value == null) return null;
    if (_userListDetail is EqualUnmodifiableListView) return _userListDetail;
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
  String toString() {
    return 'SplitFriendModel(creatorId: $creatorId, splitId: $splitId, totalAmount: $totalAmount, startDate: $startDate, endDate: $endDate, userList: $userList, userListDetail: $userListDetail, writerList: $writerList, adminList: $adminList, title: $title, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplitFriendModelImpl &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.splitId, splitId) || other.splitId == splitId) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._userList, _userList) &&
            const DeepCollectionEquality()
                .equals(other._userListDetail, _userListDetail) &&
            const DeepCollectionEquality()
                .equals(other._writerList, _writerList) &&
            const DeepCollectionEquality()
                .equals(other._adminList, _adminList) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      creatorId,
      splitId,
      totalAmount,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_userList),
      const DeepCollectionEquality().hash(_userListDetail),
      const DeepCollectionEquality().hash(_writerList),
      const DeepCollectionEquality().hash(_adminList),
      title,
      currency,
      createdAt,
      updatedAt);

  /// Create a copy of SplitFriendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplitFriendModelImplCopyWith<_$SplitFriendModelImpl> get copyWith =>
      __$$SplitFriendModelImplCopyWithImpl<_$SplitFriendModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplitFriendModelImplToJson(
      this,
    );
  }
}

abstract class _SplitFriendModel implements SplitFriendModel {
  const factory _SplitFriendModel(
          {@JsonKey(name: "creatorId") final String? creatorId,
          @JsonKey(name: "splitID") final String? splitId,
          @JsonKey(name: "totalAmount") final double? totalAmount,
          @JsonKey(name: "startDate") final DateTime? startDate,
          @JsonKey(name: "endDate") final DateTime? endDate,
          @JsonKey(name: "userList") final List<String>? userList,
          @JsonKey(name: "userListDetail") final List<UserList>? userListDetail,
          @JsonKey(name: "writerList") final List<String>? writerList,
          @JsonKey(name: "adminList") final List<String>? adminList,
          @JsonKey(name: "title") final String? title,
          @JsonKey(name: "currency") final String? currency,
          @JsonKey(name: "createdAt") final DateTime? createdAt,
          @JsonKey(name: "updatedAt") final DateTime? updatedAt}) =
      _$SplitFriendModelImpl;

  factory _SplitFriendModel.fromJson(Map<String, dynamic> json) =
      _$SplitFriendModelImpl.fromJson;

  @override
  @JsonKey(name: "creatorId")
  String? get creatorId;
  @override
  @JsonKey(name: "splitID")
  String? get splitId;
  @override
  @JsonKey(name: "totalAmount")
  double? get totalAmount;
  @override
  @JsonKey(name: "startDate")
  DateTime? get startDate;
  @override
  @JsonKey(name: "endDate")
  DateTime? get endDate;
  @override
  @JsonKey(name: "userList")
  List<String>? get userList;
  @override
  @JsonKey(name: "userListDetail")
  List<UserList>? get userListDetail;
  @override
  @JsonKey(name: "writerList")
  List<String>? get writerList;
  @override
  @JsonKey(name: "adminList")
  List<String>? get adminList;
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

  /// Create a copy of SplitFriendModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplitFriendModelImplCopyWith<_$SplitFriendModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserList _$UserListFromJson(Map<String, dynamic> json) {
  return _UserList.fromJson(json);
}

/// @nodoc
mixin _$UserList {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "userId")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  double? get amount => throw _privateConstructorUsedError;

  /// Serializes this UserList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserListCopyWith<UserList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListCopyWith<$Res> {
  factory $UserListCopyWith(UserList value, $Res Function(UserList) then) =
      _$UserListCopyWithImpl<$Res, UserList>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "userId") String? userId,
      @JsonKey(name: "amount") double? amount});
}

/// @nodoc
class _$UserListCopyWithImpl<$Res, $Val extends UserList>
    implements $UserListCopyWith<$Res> {
  _$UserListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? userId = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserListImplCopyWith<$Res>
    implements $UserListCopyWith<$Res> {
  factory _$$UserListImplCopyWith(
          _$UserListImpl value, $Res Function(_$UserListImpl) then) =
      __$$UserListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "userId") String? userId,
      @JsonKey(name: "amount") double? amount});
}

/// @nodoc
class __$$UserListImplCopyWithImpl<$Res>
    extends _$UserListCopyWithImpl<$Res, _$UserListImpl>
    implements _$$UserListImplCopyWith<$Res> {
  __$$UserListImplCopyWithImpl(
      _$UserListImpl _value, $Res Function(_$UserListImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? userId = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$UserListImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserListImpl implements _UserList {
  const _$UserListImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "userId") this.userId,
      @JsonKey(name: "amount") this.amount});

  factory _$UserListImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserListImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "userId")
  final String? userId;
  @override
  @JsonKey(name: "amount")
  final double? amount;

  @override
  String toString() {
    return 'UserList(name: $name, userId: $userId, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserListImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, userId, amount);

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserListImplCopyWith<_$UserListImpl> get copyWith =>
      __$$UserListImplCopyWithImpl<_$UserListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserListImplToJson(
      this,
    );
  }
}

abstract class _UserList implements UserList {
  const factory _UserList(
      {@JsonKey(name: "name") final String? name,
      @JsonKey(name: "userId") final String? userId,
      @JsonKey(name: "amount") final double? amount}) = _$UserListImpl;

  factory _UserList.fromJson(Map<String, dynamic> json) =
      _$UserListImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "userId")
  String? get userId;
  @override
  @JsonKey(name: "amount")
  double? get amount;

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserListImplCopyWith<_$UserListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

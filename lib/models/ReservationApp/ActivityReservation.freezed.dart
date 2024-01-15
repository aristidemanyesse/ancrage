// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ActivityReservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActivityReservation _$ActivityReservationFromJson(Map<String, dynamic> json) {
  return _ActivityReservation.fromJson(json);
}

/// @nodoc
mixin _$ActivityReservation {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  Activity get activity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityReservationCopyWith<ActivityReservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityReservationCopyWith<$Res> {
  factory $ActivityReservationCopyWith(
          ActivityReservation value, $Res Function(ActivityReservation) then) =
      _$ActivityReservationCopyWithImpl<$Res, ActivityReservation>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      int price,
      bool isPublic,
      Activity activity});

  $ActivityCopyWith<$Res> get activity;
}

/// @nodoc
class _$ActivityReservationCopyWithImpl<$Res, $Val extends ActivityReservation>
    implements $ActivityReservationCopyWith<$Res> {
  _$ActivityReservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? price = null,
    Object? isPublic = null,
    Object? activity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ActivityCopyWith<$Res> get activity {
    return $ActivityCopyWith<$Res>(_value.activity, (value) {
      return _then(_value.copyWith(activity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityReservationImplCopyWith<$Res>
    implements $ActivityReservationCopyWith<$Res> {
  factory _$$ActivityReservationImplCopyWith(_$ActivityReservationImpl value,
          $Res Function(_$ActivityReservationImpl) then) =
      __$$ActivityReservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      int price,
      bool isPublic,
      Activity activity});

  @override
  $ActivityCopyWith<$Res> get activity;
}

/// @nodoc
class __$$ActivityReservationImplCopyWithImpl<$Res>
    extends _$ActivityReservationCopyWithImpl<$Res, _$ActivityReservationImpl>
    implements _$$ActivityReservationImplCopyWith<$Res> {
  __$$ActivityReservationImplCopyWithImpl(_$ActivityReservationImpl _value,
      $Res Function(_$ActivityReservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? price = null,
    Object? isPublic = null,
    Object? activity = null,
  }) {
    return _then(_$ActivityReservationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityReservationImpl implements _ActivityReservation {
  const _$ActivityReservationImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.price = 0,
      this.isPublic = true,
      this.activity = const Activity()});

  factory _$ActivityReservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityReservationImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updateAt;
  @override
  @JsonKey()
  final bool deleted;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final bool isPublic;
  @override
  @JsonKey()
  final Activity activity;

  @override
  String toString() {
    return 'ActivityReservation(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, price: $price, isPublic: $isPublic, activity: $activity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityReservationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.activity, activity) ||
                other.activity == activity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updateAt, deleted, price, isPublic, activity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityReservationImplCopyWith<_$ActivityReservationImpl> get copyWith =>
      __$$ActivityReservationImplCopyWithImpl<_$ActivityReservationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityReservationImplToJson(
      this,
    );
  }
}

abstract class _ActivityReservation implements ActivityReservation {
  const factory _ActivityReservation(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final int price,
      final bool isPublic,
      final Activity activity}) = _$ActivityReservationImpl;

  factory _ActivityReservation.fromJson(Map<String, dynamic> json) =
      _$ActivityReservationImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  int get price;
  @override
  bool get isPublic;
  @override
  Activity get activity;
  @override
  @JsonKey(ignore: true)
  _$$ActivityReservationImplCopyWith<_$ActivityReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ConfortReservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConfortReservation _$ConfortReservationFromJson(Map<String, dynamic> json) {
  return _ConfortReservation.fromJson(json);
}

/// @nodoc
mixin _$ConfortReservation {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  Option get option => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfortReservationCopyWith<ConfortReservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfortReservationCopyWith<$Res> {
  factory $ConfortReservationCopyWith(
          ConfortReservation value, $Res Function(ConfortReservation) then) =
      _$ConfortReservationCopyWithImpl<$Res, ConfortReservation>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      Option option});

  $OptionCopyWith<$Res> get option;
}

/// @nodoc
class _$ConfortReservationCopyWithImpl<$Res, $Val extends ConfortReservation>
    implements $ConfortReservationCopyWith<$Res> {
  _$ConfortReservationCopyWithImpl(this._value, this._then);

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
    Object? option = null,
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
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as Option,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionCopyWith<$Res> get option {
    return $OptionCopyWith<$Res>(_value.option, (value) {
      return _then(_value.copyWith(option: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfortReservationImplCopyWith<$Res>
    implements $ConfortReservationCopyWith<$Res> {
  factory _$$ConfortReservationImplCopyWith(_$ConfortReservationImpl value,
          $Res Function(_$ConfortReservationImpl) then) =
      __$$ConfortReservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      Option option});

  @override
  $OptionCopyWith<$Res> get option;
}

/// @nodoc
class __$$ConfortReservationImplCopyWithImpl<$Res>
    extends _$ConfortReservationCopyWithImpl<$Res, _$ConfortReservationImpl>
    implements _$$ConfortReservationImplCopyWith<$Res> {
  __$$ConfortReservationImplCopyWithImpl(_$ConfortReservationImpl _value,
      $Res Function(_$ConfortReservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? option = null,
  }) {
    return _then(_$ConfortReservationImpl(
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
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as Option,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfortReservationImpl implements _ConfortReservation {
  const _$ConfortReservationImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.option = const Option()});

  factory _$ConfortReservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfortReservationImplFromJson(json);

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
  final Option option;

  @override
  String toString() {
    return 'ConfortReservation(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, option: $option)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfortReservationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.option, option) || other.option == option));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, updateAt, deleted, option);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfortReservationImplCopyWith<_$ConfortReservationImpl> get copyWith =>
      __$$ConfortReservationImplCopyWithImpl<_$ConfortReservationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfortReservationImplToJson(
      this,
    );
  }
}

abstract class _ConfortReservation implements ConfortReservation {
  const factory _ConfortReservation(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final Option option}) = _$ConfortReservationImpl;

  factory _ConfortReservation.fromJson(Map<String, dynamic> json) =
      _$ConfortReservationImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  Option get option;
  @override
  @JsonKey(ignore: true)
  _$$ConfortReservationImplCopyWith<_$ConfortReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

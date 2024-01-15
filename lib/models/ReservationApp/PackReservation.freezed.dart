// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PackReservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PackReservation _$PackReservationFromJson(Map<String, dynamic> json) {
  return _PackReservation.fromJson(json);
}

/// @nodoc
mixin _$PackReservation {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  Pack get pack => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackReservationCopyWith<PackReservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackReservationCopyWith<$Res> {
  factory $PackReservationCopyWith(
          PackReservation value, $Res Function(PackReservation) then) =
      _$PackReservationCopyWithImpl<$Res, PackReservation>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      int price,
      Pack pack});

  $PackCopyWith<$Res> get pack;
}

/// @nodoc
class _$PackReservationCopyWithImpl<$Res, $Val extends PackReservation>
    implements $PackReservationCopyWith<$Res> {
  _$PackReservationCopyWithImpl(this._value, this._then);

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
    Object? pack = null,
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
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as Pack,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PackCopyWith<$Res> get pack {
    return $PackCopyWith<$Res>(_value.pack, (value) {
      return _then(_value.copyWith(pack: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PackReservationImplCopyWith<$Res>
    implements $PackReservationCopyWith<$Res> {
  factory _$$PackReservationImplCopyWith(_$PackReservationImpl value,
          $Res Function(_$PackReservationImpl) then) =
      __$$PackReservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      int price,
      Pack pack});

  @override
  $PackCopyWith<$Res> get pack;
}

/// @nodoc
class __$$PackReservationImplCopyWithImpl<$Res>
    extends _$PackReservationCopyWithImpl<$Res, _$PackReservationImpl>
    implements _$$PackReservationImplCopyWith<$Res> {
  __$$PackReservationImplCopyWithImpl(
      _$PackReservationImpl _value, $Res Function(_$PackReservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? price = null,
    Object? pack = null,
  }) {
    return _then(_$PackReservationImpl(
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
      pack: null == pack
          ? _value.pack
          : pack // ignore: cast_nullable_to_non_nullable
              as Pack,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackReservationImpl implements _PackReservation {
  const _$PackReservationImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.price = 0,
      this.pack = const Pack()});

  factory _$PackReservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackReservationImplFromJson(json);

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
  final Pack pack;

  @override
  String toString() {
    return 'PackReservation(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, price: $price, pack: $pack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackReservationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.pack, pack) || other.pack == pack));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, updateAt, deleted, price, pack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PackReservationImplCopyWith<_$PackReservationImpl> get copyWith =>
      __$$PackReservationImplCopyWithImpl<_$PackReservationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackReservationImplToJson(
      this,
    );
  }
}

abstract class _PackReservation implements PackReservation {
  const factory _PackReservation(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final int price,
      final Pack pack}) = _$PackReservationImpl;

  factory _PackReservation.fromJson(Map<String, dynamic> json) =
      _$PackReservationImpl.fromJson;

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
  Pack get pack;
  @override
  @JsonKey(ignore: true)
  _$$PackReservationImplCopyWith<_$PackReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

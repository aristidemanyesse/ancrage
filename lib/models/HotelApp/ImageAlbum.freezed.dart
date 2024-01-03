// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ImageAlbum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageAlbum _$ImageAlbumFromJson(Map<String, dynamic> json) {
  return _ImageAlbum.fromJson(json);
}

/// @nodoc
mixin _$ImageAlbum {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageAlbumCopyWith<ImageAlbum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageAlbumCopyWith<$Res> {
  factory $ImageAlbumCopyWith(
          ImageAlbum value, $Res Function(ImageAlbum) then) =
      _$ImageAlbumCopyWithImpl<$Res, ImageAlbum>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String image});
}

/// @nodoc
class _$ImageAlbumCopyWithImpl<$Res, $Val extends ImageAlbum>
    implements $ImageAlbumCopyWith<$Res> {
  _$ImageAlbumCopyWithImpl(this._value, this._then);

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
    Object? image = null,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageAlbumImplCopyWith<$Res>
    implements $ImageAlbumCopyWith<$Res> {
  factory _$$ImageAlbumImplCopyWith(
          _$ImageAlbumImpl value, $Res Function(_$ImageAlbumImpl) then) =
      __$$ImageAlbumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String image});
}

/// @nodoc
class __$$ImageAlbumImplCopyWithImpl<$Res>
    extends _$ImageAlbumCopyWithImpl<$Res, _$ImageAlbumImpl>
    implements _$$ImageAlbumImplCopyWith<$Res> {
  __$$ImageAlbumImplCopyWithImpl(
      _$ImageAlbumImpl _value, $Res Function(_$ImageAlbumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? image = null,
  }) {
    return _then(_$ImageAlbumImpl(
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageAlbumImpl implements _ImageAlbum {
  const _$ImageAlbumImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.image = ""});

  factory _$ImageAlbumImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageAlbumImplFromJson(json);

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
  final String image;

  @override
  String toString() {
    return 'ImageAlbum(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageAlbumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, updateAt, deleted, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageAlbumImplCopyWith<_$ImageAlbumImpl> get copyWith =>
      __$$ImageAlbumImplCopyWithImpl<_$ImageAlbumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageAlbumImplToJson(
      this,
    );
  }
}

abstract class _ImageAlbum implements ImageAlbum {
  const factory _ImageAlbum(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final String image}) = _$ImageAlbumImpl;

  factory _ImageAlbum.fromJson(Map<String, dynamic> json) =
      _$ImageAlbumImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$ImageAlbumImplCopyWith<_$ImageAlbumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

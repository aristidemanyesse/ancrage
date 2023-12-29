// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CategoryOption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryOption _$CategoryOptionFromJson(Map<String, dynamic> json) {
  return _CategoryOption.fromJson(json);
}

/// @nodoc
mixin _$CategoryOption {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updateAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Option> get categorieOption => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryOptionCopyWith<CategoryOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryOptionCopyWith<$Res> {
  factory $CategoryOptionCopyWith(
          CategoryOption value, $Res Function(CategoryOption) then) =
      _$CategoryOptionCopyWithImpl<$Res, CategoryOption>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String name,
      List<Option> categorieOption});
}

/// @nodoc
class _$CategoryOptionCopyWithImpl<$Res, $Val extends CategoryOption>
    implements $CategoryOptionCopyWith<$Res> {
  _$CategoryOptionCopyWithImpl(this._value, this._then);

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
    Object? name = null,
    Object? categorieOption = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categorieOption: null == categorieOption
          ? _value.categorieOption
          : categorieOption // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryOptionImplCopyWith<$Res>
    implements $CategoryOptionCopyWith<$Res> {
  factory _$$CategoryOptionImplCopyWith(_$CategoryOptionImpl value,
          $Res Function(_$CategoryOptionImpl) then) =
      __$$CategoryOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updateAt,
      bool deleted,
      String name,
      List<Option> categorieOption});
}

/// @nodoc
class __$$CategoryOptionImplCopyWithImpl<$Res>
    extends _$CategoryOptionCopyWithImpl<$Res, _$CategoryOptionImpl>
    implements _$$CategoryOptionImplCopyWith<$Res> {
  __$$CategoryOptionImplCopyWithImpl(
      _$CategoryOptionImpl _value, $Res Function(_$CategoryOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? deleted = null,
    Object? name = null,
    Object? categorieOption = null,
  }) {
    return _then(_$CategoryOptionImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categorieOption: null == categorieOption
          ? _value._categorieOption
          : categorieOption // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryOptionImpl implements _CategoryOption {
  const _$CategoryOptionImpl(
      {this.id = "",
      this.createdAt = "",
      this.updateAt = "",
      this.deleted = false,
      this.name = "",
      final List<Option> categorieOption = const []})
      : _categorieOption = categorieOption;

  factory _$CategoryOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryOptionImplFromJson(json);

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
  final String name;
  final List<Option> _categorieOption;
  @override
  @JsonKey()
  List<Option> get categorieOption {
    if (_categorieOption is EqualUnmodifiableListView) return _categorieOption;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categorieOption);
  }

  @override
  String toString() {
    return 'CategoryOption(id: $id, createdAt: $createdAt, updateAt: $updateAt, deleted: $deleted, name: $name, categorieOption: $categorieOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._categorieOption, _categorieOption));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updateAt, deleted,
      name, const DeepCollectionEquality().hash(_categorieOption));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryOptionImplCopyWith<_$CategoryOptionImpl> get copyWith =>
      __$$CategoryOptionImplCopyWithImpl<_$CategoryOptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryOptionImplToJson(
      this,
    );
  }
}

abstract class _CategoryOption implements CategoryOption {
  const factory _CategoryOption(
      {final String id,
      final String createdAt,
      final String updateAt,
      final bool deleted,
      final String name,
      final List<Option> categorieOption}) = _$CategoryOptionImpl;

  factory _CategoryOption.fromJson(Map<String, dynamic> json) =
      _$CategoryOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updateAt;
  @override
  bool get deleted;
  @override
  String get name;
  @override
  List<Option> get categorieOption;
  @override
  @JsonKey(ignore: true)
  _$$CategoryOptionImplCopyWith<_$CategoryOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

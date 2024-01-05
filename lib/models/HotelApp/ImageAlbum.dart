// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ImageAlbum.freezed.dart';
part 'ImageAlbum.g.dart';

@freezed
class ImageAlbum with _$ImageAlbum {
  const factory ImageAlbum(
      {@Default("") String id,
      @Default("") String createdAt,
      @Default("") String updateAt,
      @Default(false) bool deleted,
      @Default("") String image}) = _ImageAlbum;

  factory ImageAlbum.fromJson(Map<String, Object?> json) =>
      _$ImageAlbumFromJson(json);

  static const String ImageAlbumFragment = """
  fragment ImageAlbumFragment on ImageAlbumGenericType {
    id
    createdAt
    updateAt
    deleted
    image
  }
  """;
}

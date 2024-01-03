// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/AlbumSchema.dart';
import 'package:ancrage/models/HotelApp/ImageAlbum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Album.freezed.dart';
part 'Album.g.dart';

@freezed
class Album with _$Album {
  const factory Album({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String name,
    @Default("") String description,
    @Default([]) List<ImageAlbum> imageAlbum,
  }) = _Album;

  factory Album.fromJson(Map<String, Object?> json) => _$AlbumFromJson(json);

  static const String AlbumFragment = """
  fragment AlbumFragment on AlbumGenericType {
    id
    createdAt
    updateAt
    deleted
    name
    description
    imageAlbum{
      ...ImageAlbumFragment
    }
  }
  """;

  static Future<List<Album>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(AlbumSchema.ALL, variables);
    List<Album> items = [];
    for (var jsonTask in datas["searchAlbum"]["results"]) {
      items.add(Album.fromJson(jsonTask));
    }
    return items;
  }
}

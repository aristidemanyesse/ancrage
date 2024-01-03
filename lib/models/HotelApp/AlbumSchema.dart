import 'package:ancrage/models/HotelApp/Activity.dart';
import 'package:ancrage/models/HotelApp/Album.dart';
import 'package:ancrage/models/HotelApp/ImageAlbum.dart';

class AlbumSchema {
  static const String ALL = r"""
    query () {
      searchAlbum(
        deleted: false
      ) {
        results {
          ...AlbumFragment
        }
      }
    }
  """ +
      Album.AlbumFragment +
      ImageAlbum.ImageAlbumFragment;
}

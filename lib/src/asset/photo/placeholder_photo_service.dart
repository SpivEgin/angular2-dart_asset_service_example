import 'dart:async';
import 'dart:math';
import 'package:angular2/core.dart';
import 'package:angular2_dart_asset_service/src/asset/photo/photo_service.dart';
import 'package:angular2_dart_asset_service/src/nav/attribution.dart';
import 'package:angular2_dart_asset_service/src/nav/photo.dart';

@Injectable()
class PlaceholderPhotoService implements PhotoService {
  Random _rnd = new Random();
  static const int imgHeight = 150;
  static const int imgWidth = 300;
  static const String placeholderUrl = "http://placehold.it/";


  PlaceholderPhotoService();

  String _getPhotoUrl(String id) =>
      "$placeholderUrl${imgWidth}x$imgHeight/?text=$id";

  @override
  Future<Photo> getPhoto(String pId) async {
    final Attribution attrib = _getPhotoAttribution(pId);
    return new Future<Photo>.value(
        new Photo(pId, attrib, url: _getPhotoUrl(pId)));
  }


  Attribution _getPhotoAttribution(String id) {
    return new Attribution()
      ..author = "Author"
      ..url = placeholderUrl
      ..attributionText = "Courtesy placeholder.it"
      ..attributionRequired = _rnd.nextBool();
  }


}
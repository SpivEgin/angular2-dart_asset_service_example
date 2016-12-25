import 'dart:async';
import 'dart:math';
import 'package:angular2/core.dart';
import 'package:angular2_dart_asset_service/src/asset/photo/photo_service.dart';
import 'package:angular2_dart_asset_service/src/nav/attribution.dart';
import 'package:angular2_dart_asset_service/src/nav/photo.dart';

@Injectable()
class LoremPhotoService implements PhotoService {
  final Random _rnd = new Random();

  static const String loremPicUrl = "http://lorempixel.com/";
  static const int imgWidth = 300;
  static const int imgHeight = 150;
  static const String imgCategory = "cats";

  LoremPhotoService();

  String _getPhotoUrl(String id) {
    final String caption = id.replaceAll("_", "-");
    return "$loremPicUrl$imgWidth/$imgHeight/$imgCategory/$caption/";
  }

  @override
  Future<Photo> getPhoto(String pId) async {
    final Attribution attrib = await _getPhotoAttribution(pId);
    return new Photo(pId, attrib, url: _getPhotoUrl(pId));
  }


  Future<Attribution> _getPhotoAttribution(String id) async {
    return new Attribution()
      ..author = "Author"
      ..url = loremPicUrl
      ..attributionText = "Courtesy lorempixum"
      ..attributionRequired = _rnd.nextBool();
  }

}
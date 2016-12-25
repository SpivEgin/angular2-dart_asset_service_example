import 'dart:async';
import 'package:angular2/core.dart';

import 'package:angular2_dart_asset_service/src/nav/photo.dart';

abstract class PhotoService {
  Future<Photo> getPhoto(String pId);

}
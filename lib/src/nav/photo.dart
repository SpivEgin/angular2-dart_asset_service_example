import 'package:angular2_dart_asset_service/src/nav/attribution.dart';

class Photo {
  Attribution attribution;
  String id;
  String url;

  Photo(this.id, this.attribution, {this.url});
}
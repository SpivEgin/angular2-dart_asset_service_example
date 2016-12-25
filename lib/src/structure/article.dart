import 'package:angular2_dart_asset_service/util.dart';

class Article {
  String id;
  String name;
  String photoId;

  Article(this.name, [this.id]) {
    if (id == null) {
      id = slugName(name);
    }
  }

}
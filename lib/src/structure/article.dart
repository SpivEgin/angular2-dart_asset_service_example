import 'package:angular2_dart_asset_service/util.dart';

class Article {
  String id;
  String name;

  Article(this.name, [this.id]) {
    if (id == null) {
      id = slugName(name);
    }
  }

}
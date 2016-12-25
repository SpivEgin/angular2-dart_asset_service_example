import 'package:angular2_dart_asset_service/util.dart';
import 'package:angular2_dart_asset_service/src/structure/article.dart';
import 'package:angular2_dart_asset_service/src/page/article_component.dart';


class ArticleSection {
  String name;
  List<Article> articles = <Article>[];

  ArticleSection(this.name);

  String get routeSlug => slugName(name);
  String get routeName => camelName(name);
  dynamic get component => ArticleComponent;
  

}
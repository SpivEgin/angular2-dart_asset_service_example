import 'dart:async';
import 'package:angular2/core.dart';

import 'package:angular2_dart_asset_service/src/structure/article_content.dart';

abstract class ContentService {

  Future<ArticleContent> getContent(String id);

}
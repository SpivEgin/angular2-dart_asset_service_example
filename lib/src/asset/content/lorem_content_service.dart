import 'dart:async';
import 'package:angular2/core.dart';
import 'package:http/http.dart';
import 'package:angular2_dart_asset_service/src/structure/article_content.dart';
import 'package:angular2_dart_asset_service/src/asset/content/content_service.dart';

@Injectable()
class LoremContentService extends ContentService {

  static const String loremHtmlUrl = 'http://loripsum.net/api/10/short/headers/link/bq/ol/';

  final Client _http;

  LoremContentService(this._http);

  @override
  Future<ArticleContent> getContent(String id) async {
    final String url = "${loremHtmlUrl}section/$id.html";
    try {
      final Response response = await _http.get(url);
      return new ArticleContent(id, response.body);
    } catch (e) {
      _handleError(url, e.runtimeType);
      return new ArticleContent(
          id, "<h3>Error</h3><p>Failed to locate content at $url</p>");
    }
  }

  Exception _handleError(String url, dynamic e) {
    throw new Exception(e);
  }


}
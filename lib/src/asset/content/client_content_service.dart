import 'dart:async';
import 'package:angular2/core.dart';
import 'package:http/http.dart';

import 'package:angular2_dart_asset_service/src/asset/content/content_service.dart';


const OpaqueToken contentUrl = const OpaqueToken('app.content_url');

@Injectable()
class ClientContentService implements ContentService {

  //static final Map<String,String> _headers = {'Content-Type': 'application/json'};

  final Client _http;
  final String _contentUrl;

  ClientContentService(@Inject(contentUrl) this._contentUrl, this._http);

  @override
  Future<String> getContent(String id) async {
    final String url = "${_contentUrl}section/$id.html";
    try {
      final Response response = await _http.get(url);
      return response.body;
    } catch (e) {
      _handleError(url, e.runtimeType);
      return "<h3>Error</h3><p>Failed to locate content at $url</p>";
    }
  }

  void _handleError(String url, dynamic e) {
    //TODO: something useful with an error 
  }


}
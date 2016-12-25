import 'dart:async';
import 'package:angular2/core.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'photo_service.dart';
import 'package:angular2_dart_asset_service/src/nav/attribution.dart';
import 'package:angular2_dart_asset_service/src/nav/photo.dart';


const OpaqueToken photoUrl = const OpaqueToken('app.photo_url');

@Injectable()
class ClientPhotoService implements PhotoService {

  final Client _http;
  final String _photoUrl;

  ClientPhotoService(@Inject(photoUrl) this._photoUrl, this._http);

  String _getPhotoUrl(String id) => "${_photoUrl}images/$id.jpg";

  @override
  Future<Photo> getPhoto(String pId) async {
    final Attribution attrib = await _getPhotoAttribution(pId);
    return new Photo(pId, attrib, url: _getPhotoUrl(pId));
  }

  Future<Attribution> _getPhotoAttribution(String id) async {
    final Attribution attrib = new Attribution();
    final String url = "${_photoUrl}images/$id.jpg.license";
    try {
      final Response response = await _http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = _extractData(response);
        if (json != null) {
          attrib
            ..author = json['author']
            ..url = json['author_url']
            ..attributionText = json['attribution_text']
            ..attributionRequired = json['attribution_required'];
        }
        return attrib;
      } else {
        _handleError(url, "Response ${response.statusCode}");
        return attrib;
      }
    } catch (e) {
      _handleError(url, e.runtimeType);
      return attrib;
    }
  }

  dynamic _extractData(Response resp) => JSON.decode(resp.body);

  void _handleError(String url, dynamic e) {
    //TODO handle error usefully
  }

}
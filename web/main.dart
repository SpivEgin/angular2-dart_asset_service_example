@MirrorsUsed(override: '*')
import 'dart:mirrors'; //mirrors not used elsewhere, explicitly discard all symbols

import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:http/http.dart';
import 'package:http/browser_client.dart';

import 'package:angular2_dart_asset_service/app_component.dart';

import 'package:angular2_dart_asset_service/src/asset/content/content_service.dart';
import 'package:angular2_dart_asset_service/src/asset/photo/photo_service.dart';

import 'package:angular2_dart_asset_service/src/asset/content/lorem_content_service.dart';
import 'package:angular2_dart_asset_service/src/asset/photo/placeholder_photo_service.dart';
//import 'package:angular2_dart_asset_service/src/asset/content/client_content_service.dart';
//import 'package:angular2_dart_asset_service/src/asset/content/placeholder_content_service.dart';
//import 'package:angular2_dart_asset_service/src/asset/photo/lorem_photo_service.dart';


void main() {
  final dynamic contentServiceProvider = LoremContentService;
  //dynamic contentServiceProvider = PlaceholderContentService;
  //dynamic contentServiceProvider = ClientContentService;
  //provide(contentUrl, useValue: "http://foobar")

  //dynamic photoProvider = LoremPhotoService;
  final dynamic photoProvider = PlaceholderPhotoService;

  bootstrap(AppComponent, <Provider>[
    provide(Client, useFactory: () => new BrowserClient(), deps: <Object>[]),
    provide(ContentService, useClass: contentServiceProvider),
    provide(PhotoService, useClass: photoProvider),
  ]
  );
}



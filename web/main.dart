@MirrorsUsed(override: '*')
import 'dart:mirrors'; //mirrors not used elsewhere, explicitly discard all symbols

import 'package:http/http.dart';
import 'package:http/browser_client.dart';
import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2_dart_asset_service/app_component.dart';
import 'package:angular2_dart_asset_service/src/asset/content/content_service.dart';

import 'package:angular2_dart_asset_service/src/asset/content/client_content_service.dart';


void main() {
  final dynamic contentServiceProvider = ClientContentService;

  bootstrap(AppComponent, <Provider>[
    provide(ContentService, useClass: ClientContentService),
    provide(Client, useFactory: () => new BrowserClient(), deps: <Object>[]),
    provide(contentUrl, useValue: "http://localhost:8090/content/article")
  ]
  );
}



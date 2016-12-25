@MirrorsUsed(override: '*')
import 'dart:mirrors'; //mirrors not used elsewhere, explicitly discard all symbols

import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2_dart_asset_service/app_component.dart';
import 'package:angular2_dart_asset_service/src/asset/content/content_service.dart';
import 'package:angular2_dart_asset_service/src/asset/content/placeholder_content_service.dart';

void main() {
  bootstrap(AppComponent, <Provider>[
    provide(ContentService, useClass: PlaceholderContentService)
  ]);

}



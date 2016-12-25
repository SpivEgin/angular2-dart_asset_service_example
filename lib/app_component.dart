// Copyright (c) 2016, mike. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2_dart_asset_service/src/structure/article_section.dart';
import 'package:angular2_dart_asset_service/src/structure/site_structure_service.dart';

@Component(
    selector: 'my-app',
    styleUrls: const <String>['app_component.css'],
    templateUrl: 'app_component.html',
    directives: const <dynamic>[
      ROUTER_DIRECTIVES,
    ],
    providers: const <dynamic>[
      SiteStructureService,
      ROUTER_PROVIDERS
    ]
)
class AppComponent {
  Router _router;
  List<ArticleSection> navItems = <ArticleSection>[];

  AppComponent(this._router, SiteStructureService _siteStruct) {
    navItems = SiteStructureService.structure;
    _router.config(_getRouteConfig(SiteStructureService.structure));
  }

  List<RouteDefinition> _getRouteConfig(List<ArticleSection> pages) {
    final List<RouteDefinition> config = <RouteDefinition>[];
    for (int i = 0; i < pages.length; i++) {
      config.add(
          new Route(path: "/" + pages[i].routeSlug,
              name: pages[i].routeName,
              component: pages[i].component,
              data: <String,dynamic>{'id': pages[i].name}));
    }
    return config;
  }


}

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2_dart_asset_service/src/structure/site_structure_service.dart';
import 'package:angular2_dart_asset_service/src/structure/article.dart';

@Component(
    selector: 'my-article',
    styleUrls: const <String>['article_component.css'],
    templateUrl: 'article_component.html',
    directives: const <dynamic>[],
    providers: const <dynamic>[SiteStructureService]
)
class ArticleComponent implements OnInit, CanReuse {
  String pageId;

  final SiteStructureService _struct;
  final RouteData _routeData;
  String flowDirection = "row";

  List<Article> get articles =>
      _struct
          .getTopLevelItem(pageId)
          .articles;


  ArticleComponent(this._struct, this._routeData);


  toggleFlowDirection() {
    flowDirection = flowDirection == "row" ? "column" : "row";
  }

  @override
  ngOnInit() {
    pageId = _routeData.data['id'];
  }

  @override //we can reuse only if activated by the same route
  routerCanReuse(ComponentInstruction nextInstruction,
      ComponentInstruction prevInstruction) =>
      prevInstruction?.routeName == nextInstruction?.routeName;

}
import '../nav/photo.dart';
import 'package:angular2/core.dart';
import 'package:angular2/security.dart';
import 'package:angular2/router.dart';
import 'package:angular2_dart_asset_service/src/asset/content/content_service.dart';
import 'package:angular2_dart_asset_service/src/asset/photo/photo_service.dart';
import 'package:angular2_dart_asset_service/src/structure/site_structure_service.dart';
import 'package:angular2_dart_asset_service/src/structure/article.dart';

@Component(
    selector: 'my-article',
    styleUrls: const <String>['article_component.css'],
    templateUrl: 'article_component.html',
    encapsulation: ViewEncapsulation
        .None, /* easier styling of innerHTML content */
    directives: const <dynamic>[SafeInnerHtmlDirective],
    providers: const <dynamic>[SiteStructureService]
)
class ArticleComponent implements OnInit, CanReuse {
  String pageId;

  final SiteStructureService _struct;
  final ContentService _contentService;
  final PhotoService _photoService;
  final RouteData _routeData;
  String flowDirection = "row";
  Map<String, SafeHtml> contents = <String, SafeHtml>{};
  final DomSanitizationService _trustService;

  Map<String, Photo> photos = <String, Photo>{};


  ArticleComponent(this._struct,
      this._contentService,
      this._photoService,
      this._trustService,
      this._routeData);

  void _getContent(Article article) {
    // load content
    _contentService.getContent(article.id).then((String content) {
      contents[article.id] =
          _trustService.bypassSecurityTrustHtml(
              content); //we implicitly trust this content
    });
    if (article.photoId != null) {
      // load photos
      _photoService.getPhoto(article.photoId).then((Photo p) {
        photos[article.id] = p;
      });
    }
  }

  List<Article> get articles =>
      _struct
          .getTopLevelItem(pageId)
          .articles;

  void toggleFlowDirection() {
    flowDirection = flowDirection == "row" ? "column" : "row";
  }

  @override
  void ngOnInit() {
    pageId = _routeData.data['id'];
    articles.forEach(_getContent);
  }

  @override //we can reuse only if activated by the same route
  bool routerCanReuse(ComponentInstruction nextInstruction,
      ComponentInstruction prevInstruction) =>
      prevInstruction?.routeName == nextInstruction?.routeName;

}
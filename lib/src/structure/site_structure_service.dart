import 'package:angular2/core.dart';
import 'package:angular2_dart_asset_service/src/structure/article.dart';
import 'package:angular2_dart_asset_service/src/structure/article_section.dart';

@Injectable()
class SiteStructureService {
  static final List<ArticleSection> structure = <ArticleSection>[
    new ArticleSection("About Kittens")
      ..articles.add(new Article("Fuzzy"))
      ..articles.add(new Article("Warm"))
      ..articles.add(new Article("Playful"))
      ..articles.add(new Article("Small"))
      ..articles.add(new Article("Curious")),
    new ArticleSection("Anatomy")
      ..articles.add(new Article("Paws"))
      ..articles.add(new Article("Whiskers"))
      ..articles.add(new Article("Feet"))
      ..articles.add(new Article("Tail"))
      ..articles.add(new Article("Ears"))
      ..articles.add(new Article("Nose")),
    new ArticleSection("Behavior")
      ..articles.add(new Article("Purry"))
      ..articles.add(new Article("Meowy"))
      ..articles.add(new Article("Sleepy"))
      ..articles.add(new Article("Pouncy")),
    new ArticleSection("Where to Find")
      ..articles.add(new Article("Under the Bed"))
      ..articles.add(new Article("On the Floor"))
      ..articles.add(new Article("In a Box")),
    new ArticleSection("Care")
      ..articles.add(new Article("Food"))
      ..articles.add(new Article("Petting"))
      ..articles.add(new Article("Toys")),
  ];

  SiteStructureService();

  ArticleSection getTopLevelItem(String id) =>
      structure.firstWhere((ArticleSection a) => a.name == id);


}

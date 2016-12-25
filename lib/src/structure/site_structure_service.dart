import 'package:angular2/core.dart';
import 'package:angular2_dart_asset_service/src/structure/article.dart';
import 'package:angular2_dart_asset_service/src/structure/article_section.dart';

@Injectable()
class SiteStructureService {
  static final List<ArticleSection> structure = <ArticleSection>[
    new ArticleSection("About Kittens")
      ..articles.add(new Article("Fuzzy")..photoId = "fuzzy")
      ..articles.add(new Article("Warm")..photoId = "warm")
      ..articles.add(new Article("Playful")..photoId = "playful")
      ..articles.add(new Article("Small")..photoId = "small")
      ..articles.add(new Article("Curious")..photoId = "curious"),
    new ArticleSection("Anatomy")
      ..articles.add(new Article("Paws")..photoId = "paws")
      ..articles.add(new Article("Whiskers", "internet")..photoId = "whiskers")
      ..articles.add(new Article("Feet")..photoId = "feet")
      ..articles.add(new Article("Tail")..photoId = "tail")
      ..articles.add(new Article("Ears")..photoId = "ears")
      ..articles.add(new Article("Nose")..photoId = "nose"),
    new ArticleSection("Behavior")
      ..articles.add(new Article("Purry")..photoId = "purry")
      ..articles.add(new Article("Meowy")..photoId = "meowy")
      ..articles.add(new Article("Sleepy")..photoId = "sleepy")
      ..articles.add(new Article("Pouncy")..photoId = "pouncy"),
    new ArticleSection("Where to Find")
      ..articles.add(new Article("Under the Bed")..photoId = "under-the-bed")
      ..articles.add(new Article("On the Floor")..photoId = "on-the-floor")
      ..articles.add(new Article("In a Box")..photoId = "in-a-box"),
    new ArticleSection("Care")
      ..articles.add(new Article("Food")..photoId = "food")
      ..articles.add(new Article("Petting")..photoId = "petting")
      ..articles.add(new Article("Toys")..photoId = "toys"),
  ];

  SiteStructureService();

  ArticleSection getTopLevelItem(String id) =>
      structure.firstWhere((ArticleSection a) => a.name == id);


}

import 'package:angular2/core.dart';
import 'package:angular2_dart_asset_service/src/structure/article.dart';
import 'package:angular2_dart_asset_service/src/structure/article_section.dart';

@Injectable()
class SiteStructureService {
  static final List<ArticleSection> structure = <ArticleSection>[
    new ArticleSection("About Tallinn")
      ..articles.add(new Article("History") ..photoId = "history")
      ..articles.add(new Article("People") ..photoId = "REMOVEME-people")
      ..articles.add(new Article("Climate") ..photoId = "climate")
      ..articles.add(new Article("Neighborhoods")..photoId = "neighborhoods")
      ..articles.add(new Article("Cuisine")..photoId = "cuisine"),
    new ArticleSection("Day to Day")
      ..articles.add(new Article("Safety") ..photoId = "safety")
      ..articles.add(new Article("Internet/WiFi", "internet") ..photoId = "internet")
      ..articles.add(new Article("Language") ..photoId = "language")
      ..articles.add(new Article("Currency") ..photoId = "currency")
      ..articles.add(new Article("Tourist Office") ..photoId = "tourist-office")
      ..articles.add(new Article("Tallinn Card") ..photoId = "tallinn-card"),
    new ArticleSection("Transport")
      ..articles.add(new Article("Airport") ..photoId = "airport")
      ..articles.add(new Article("Sea Port") ..photoId = "seaport")
      ..articles.add(new Article("Auto Rental") ..photoId = "auto-rental")
      ..articles.add(new Article("Public Transport") ..photoId = "public-transport")
      ..articles.add(new Article("Taxis") ..photoId = "taxis")
      ..articles.add(new Article("Bikes") ..photoId = "bikes"),
    new ArticleSection("Sightseeing")
      ..articles.add(new Article("Parks") ..photoId = "parks")
      ..articles.add(new Article("Museums ") ..photoId = "museums")
      ..articles.add(new Article("Walking Tours ") ..photoId = "walking")
      ..articles.add(new Article("Seasonal Events")..photoId = "seasonal-events"),
    new ArticleSection("Dining and Nightlife")
      ..articles.add(new Article("Food and Drink") ..photoId = "food-and-drink")
      ..articles.add(new Article("Restaurants") ..photoId = "restaurants")
      ..articles.add(new Article("Nightlife") ..photoId = "parks"),
    new ArticleSection("Accomodation"),
    new ArticleSection("Elsewhere in Estonia")
  ];

  SiteStructureService();

  ArticleSection getTopLevelItem(String id) => structure.firstWhere((ArticleSection a) => a.name == id);


}
// // https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=9bb7bf6152d147ad8ba14cd0e7452f2f
// import 'dart:convert';
// import 'dart:math';
// import 'package:http/http.dart';
//
//
// import 'package:newsapp1/model/newsArt.dart';
//
//
// class FetchNews {
//   static List sourcesId = [
//     "abc-news",
//     "bbc-news",
//     "bbc-sport",
//     "business-insider",
//     "engadget",
//     "entertainment-weekly",
//     "espn",
//     "espn-cric-info",
//     "financial-post",
//     "fox-news",
//     "fox-sports",
//     "globo",
//     "google-news",
//     "google-news-in",
//     "medical-news-today",
//     "national-geographic",
//     "news24",
//     "new-scientist",
//     "new-york-magazine",
//     "next-big-future",
//     "techcrunch",
//     "techradar",
//     "the-hindu",
//     "the-wall-street-journal",
//     "the-washington-times",
//     "time",
//     "usa-today",
//   ];
//
//   static Future<NewsArt> fetchNews() async {
//     final _random = new Random();
//     var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
//
//     Response response = await get(Uri.parse(
//         "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=caea254bf2f94f869e831ec24284ece1"));
//
//     Map body_data = jsonDecode(response.body);
//     List articles = body_data["articles"];
//
//     final _Newrandom = new Random();
//     var myArticle = articles[_random.nextInt(articles.length)];
//
//     return NewsArt.fromAPItoApp(myArticle);
//   }
// }
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:newsapp1/model/newsArt.dart';

class FetchNews {
  static List<String> sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArt> fetchNews({String? category}) async {
    final _random = new Random();
    var sourceID;

    if (category == null) {
      // If no category is specified, select a random source.
      sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    } else {
      // If a category is specified, select a source related to that category.
      sourceID = getCategorySourceId(category);
    }

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=91391876320a499aa9dcd16dffeb49f3"));

    Map<String, dynamic> bodyData = jsonDecode(response.body);
    List<dynamic> articles = bodyData["articles"];

    final _newRandom = new Random();
    var myArticle = articles[_newRandom.nextInt(articles.length)];

    return NewsArt.fromAPItoApp(myArticle);
  }

  // Helper function to map categories to sources (customize as needed).
  static String getCategorySourceId(String category) {
    switch (category.toLowerCase()) {
      case "business":
        return "business-insider";
      case "sports":
        return "espn";
      case "technology":
        return "techcrunch";
    // Add more categories and mappings here.
      default:
        return sourcesId[Random().nextInt(sourcesId.length)];
    }
  }
}

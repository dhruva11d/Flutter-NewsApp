// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(search());
// }
//
// class search extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SearchScreen(),
//     );
//   }
// }
//
// class NewsApiService {
//   final String apiKey = '91391876320a499aa9dcd16dffeb49f3'; // Replace with your actual API key
//   final String baseUrl = 'https://newsapi.org/v2/';
//
//   Future<List<Map<String, dynamic>>> searchNews(String query, List<String> sources) async {
//     final sourceQuery = sources.isNotEmpty ? '&sources=${sources.join(',')}' : '';
//     final response = await http.get(Uri.parse(
//         '$baseUrl/everything?q=$query$sourceQuery&apiKey=$apiKey'));
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);
//       return List<Map<String, dynamic>>.from(data['articles']);
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
// }
//
// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   final NewsApiService apiService = NewsApiService();
//   List<Map<String, dynamic>> news = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News Search App'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               onSubmitted: (query) {
//                 searchNews(query);
//               },
//               decoration: InputDecoration(
//                 labelText: "Search for news",
//                 hintText: "Enter a keyword",
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: news.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(news[index]['title'] ?? ''),
//                   subtitle: Text(news[index]['description'] ?? ''),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void searchNews(String query) {
//     final sources = [
//       "abc-news",
//       "bbc-news",
//       "bbc-sport",
//       "business-insider",
//       "engadget",
//       "entertainment-weekly",
//       "espn",
//       "espn-cric-info",
//       "financial-post",
//       "fox-news",
//       "fox-sports",
//       "globo",
//       "google-news",
//       "google-news-in",
//       "medical-news-today",
//       "national-geographic",
//       "news24",
//       "new-scientist",
//       "new-york-magazine",
//       "next-big-future",
//       "techcrunch",
//       "techradar",
//       "the-hindu",
//       "the-wall-street-journal",
//       "the-washington-times",
//       "time",
//       "usa-today",
//     ]; // Define your list of sources here
//
//     apiService.searchNews(query, sources).then((result) {
//       setState(() {
//         news = result;
//       });
//     }).catchError((error) {
//       // Handle error
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(SearchApp());
}

class SearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
    );
  }
}

class NewsApiService {
  final String apiKey = '91391876320a499aa9dcd16dffeb49f3'; // Replace with your actual API key
  final String baseUrl = 'https://newsapi.org/v2/';

  Future<List<Map<String, dynamic>>> searchNews(String query, List<String> sources) async {
    final sourceQuery = sources.isNotEmpty ? '&sources=${sources.join(',')}' : '';
    final response = await http.get(Uri.parse(
        '$baseUrl/everything?q=$query$sourceQuery&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['articles']);
    } else {
      throw Exception('Failed to load news');
    }
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final NewsApiService apiService = NewsApiService();
  List<Map<String, dynamic>> news = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Search App'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onSubmitted: (query) {
                searchNews(query);
              },
              decoration: InputDecoration(
                labelText: "Search for news",
                hintText: "sports",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(news[index]['title'] ?? ''),
                  subtitle: Text(news[index]['description'] ?? ''),
                  leading: news[index]['urlToImage'] != null
                      ? Image.network(
                    news[index]['urlToImage'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                      : Image.network(
                    "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void searchNews(String query) {
    final sources = [
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
    ]; // Define your list of sources here

    apiService.searchNews(query, sources).then((result) {
      setState(() {
        news = result;
      });
    }).catchError((error) {
      // Handle error
    });
  }
}

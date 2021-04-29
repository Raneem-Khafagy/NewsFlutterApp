import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class News extends ChangeNotifier {
  List < Map > data = [];
  Future fetchData(String url) async {
    Response response = await get((Uri.parse(url)));

    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status'] == "ok") {
      var articlesList = jsonResponse['articles'];
      data.clear();
      for (var i = 0; i < articlesList.length; i++) {
        if (articlesList[i]['urlToImage'] != null) {
          Map article_data = {
            "author": articlesList[i]['author'],
            "title": articlesList[i]['title'],
            "description": articlesList[i]['description'],
            "articleUrl": articlesList[i]["url"],
            "urlToImage": articlesList[i]['urlToImage'],
            "publshedAt": DateTime.parse(articlesList[i]['publishedAt']),
            "content": articlesList[i]["content"],
          };
          data.add(article_data);
        }
      }
      notifyListeners();

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load News');
    }

  }

}
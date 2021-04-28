import 'dart:convert';
import 'package:http/http.dart';
class News {
Future fetchData(String url) async {
  List < Map > data = [];
  Response response = await get((Uri.parse(url)));

  var jsonResponse = jsonDecode(response.body);
  print(jsonResponse);
  print("/////////////////////////////////////////////////");
  if (jsonResponse['status'] == "ok") {

    var articlesList = jsonResponse['articles'];
    print(articlesList);
    print("/////////////////////////////////////////////////");
    for (var i = 0; i < articlesList.length; i++) {
      if (articlesList[i]['urlToImage'] != null) {
         
        Map article_data = {
          "title": articlesList[i]['title'],
          "author": articlesList[i]['author'],
          "description": articlesList[i]['description'],
          "articleUrl": articlesList[i]["url"],
          "urlToImage": articlesList[i]['urlToImage'],
          "publshedAt": DateTime.parse(articlesList[i]['publishedAt']),
          "content": articlesList[i]["content"],
          
        };
        data.add(article_data);
      }
    }
    print(data);
    return(data);
  }else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load News');
    }

}

}
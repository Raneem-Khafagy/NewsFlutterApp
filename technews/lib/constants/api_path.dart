// all API endpoints
import 'package:flutter/material.dart';
class UrlProvider with ChangeNotifier {
  String category = '', country = 'us';
  String apiKey = "9d5fa3e244c34c3d85572538f388113a";
  geturl() {
    String url;
    category == '' ?
      url = "http://newsapi.org/v2/top-headlines?country=${country}&apiKey=${apiKey}" :
      url = "http://newsapi.org/v2/top-headlines?country=${country}&category=${category}&apiKey=${apiKey}";

    return url;
  }
  void changeCountry(newCountryName) {
    country = newCountryName;
    print("prev" + country);
    notifyListeners();
  }
  void changeCategory(newcategoryName) {
    category = newcategoryName;
    notifyListeners();
  }

}
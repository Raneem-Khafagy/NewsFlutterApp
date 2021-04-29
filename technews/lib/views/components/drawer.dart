import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technews/constants/api_path.dart';
import 'package:technews/utils/services/rest_api_service.dart';

import '/../constants/assest_path.dart';
import '/../utils/models/category_model.dart';
import '/../utils/themes/theme_config.dart';
import '../../views/Widgets/theme_icon.dart';
class CategoryItems {
  final String name;
  const CategoryItems(this.name);
}
class DrawerItems {
  final String name;
  final Widget icon;
  const DrawerItems(this.name, this.icon);
}
class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State < DrawerComponent > {
  // String country = 'us';
  late final List < CategoryItems > category;

  //////////////////////////////
  List categories = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  ///

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of < ThemeNotifier > (context, listen: false);
    final List < DrawerItems > drawer = [
      DrawerItems('Theme', ThemeIcon(themeNotifier: themeNotifier), ),
    ];
    List < CategoryModel > category = getCategories();
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(Assetpath.logo), height: 100, ),
            // Text('Categories'),
            const Divider(
                color: Colors.white54,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                      child: Text("country", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                  ),
                  DropdownButton < String > (
                    value: Provider.of < UrlProvider > (context).country,
                    icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String ? newValue) {
                          setState(() {
                            Provider.of < UrlProvider > (context, listen: false).changeCountry(newValue);
                            print(newValue);
                            Provider.of < News > (context, listen: false).fetchData(Provider.of < UrlProvider > (context, listen: false).geturl());
                          });
                        },

                        items: < String > ["ae", "ar", "at", "au", "be", "bg", "br", "ca", "ch", "cn", "co", "cu", "cz", "de", "eg", "fr", "gb", "gr", "hk", "hu", "id", "ie", "il", "in", "it", "jp", "kr", "lt", "lv", "ma", "mx", "my", "ng", "nl", "no", "nz", "ph", "pl", "pt", "ro", "rs", "ru", "sa", "se", "sg", "si", "sk", "th", "tr", "tw", "ua", "us", "ve", "za"].map < DropdownMenuItem < String >> ((String value) {
                          return DropdownMenuItem < String > (
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),

                ],
              ),

              ListView.builder(
                itemCount: category.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 12),
                      child: InkWell(
                        onTap: () {
                          print(categories[index].name, );
                          Provider.of < UrlProvider > (context, listen: false).changeCategory(category[index].name[0].toUpperCase() +
                            category[index].name.substring(1).toLowerCase());

                          Provider.of < News > (context, listen: false).fetchData(Provider.of < UrlProvider > (context, listen: false).geturl());


                        },
                        child: Container(
                          height: 35,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(category[index].name, style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ), )
                            ],
                          ),
                        ),
                      ),
                  );
                }),

              const Divider(
                  color: Colors.white54,
                ),
                ListView.builder(
                  itemCount: drawer.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12, left: 12),
                        child: Container(
                          height: 48,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                  child: drawer[index].icon,
                              ),
                            ],
                          ),
                        ),
                    );
                  }),
          ],
        ),
    );
  }
}
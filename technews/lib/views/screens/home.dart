import 'package:flutter/material.dart';
import 'package:technews/constants/assest_path.dart';
import '../../utils/themes/theme_config.dart';
import '../../views/components/api_category_filter.dart';
import '../../views/components/splash_screen.dart';
import 'package:provider/provider.dart';
import '../../views/components/theme_icon.dart';
import 'article.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);  
    
          return Scaffold(
            appBar: AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          flex : 1,
          child: Image.asset(Assetpath.logo,fit: BoxFit.contain,width: 200,)
        ),
          Flexible(
            flex : 1,
            child: ThemeIcon(themeNotifier: themeNotifier)),
        
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  ),
            body: Center(
            // child: Column(children: [ApiCategoryFilter(),ThemeIcon(themeNotifier: themeNotifier),],),
            // child: ThemeIcon(themeNotifier: themeNotifier),
            // child:news()
            ),
          );
        }
     
  }


class news extends StatelessWidget {
  const news({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     InkWell(
    
        onTap: () {
    
          Navigator.push(
    
              context,
    
              MaterialPageRoute(
    
                  builder: (context) => ArticlePage(
    
                        // article: article,
    
                      )));
    
        },
    
        child: Container(
    
          margin: EdgeInsets.all(12.0),
    
          padding: EdgeInsets.all(8.0),
    
          decoration: BoxDecoration(
    
              color: Colors.white,
    
              borderRadius: BorderRadius.circular(12.0),
    
              boxShadow: [
    
                BoxShadow(
    
                  color: Colors.black12,
    
                  blurRadius: 3.0,
    
                ),
    
              ]),
    
          child: Column(
    
            mainAxisAlignment: MainAxisAlignment.start,
    
            crossAxisAlignment: CrossAxisAlignment.start,
    
            children: [
    
              Container(
    
                height: 200.0,
    
                width: double.infinity,
    
                decoration: BoxDecoration(
    
                  //let's add the height
    
                  image: DecorationImage(
    
                      // image: NetworkImage("article.urlToImage"), fit: BoxFit.cover),
    
                      image: NetworkImage(Assetpath.logo), fit: BoxFit.cover),
    
                  borderRadius: BorderRadius.circular(12.0),
    
                ),
    
              ),
    
              SizedBox(
    
                height: 8.0,
    
              ),
    
              Container(
    
                padding: EdgeInsets.all(6.0),
    
                decoration: BoxDecoration(
    
                  color: Colors.red,
    
                  borderRadius: BorderRadius.circular(30.0),
    
                ),
    
                child: Text(
    
                  "article.source.name",
    
                  style: TextStyle(
    
                    color: Colors.white,
    
                  ),
    
                ),
    
              ),
    
              SizedBox(
    
                height: 8.0,
    
              ),
    
              Text(
    
                "article.title",
    
                style: TextStyle(
    
                  fontWeight: FontWeight.bold,
    
                  fontSize: 16.0,
    
                ),
    
              )
    
            ],
    
          ),
    
        ),
    
      );
  }
}


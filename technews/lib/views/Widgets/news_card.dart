import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technews/utils/services/rest_api_service.dart';
import 'package:technews/views/screens/article.dart';


class NewsCard extends StatefulWidget {
  final String url;
  const NewsCard({
    required this.url
  });
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State < NewsCard > {
  @override
  void didChangeDependencies() {
    Provider.of < News > (context).fetchData(widget.url);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer < News > (
      builder: (context, value, child) {
        return ListView.builder(itemBuilder: (context, index) {
            Map article = value.data[index];
            return
            InkWell(
              onTap: () {
                print(article);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticlePage(
                      data: article
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
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
                        image: DecorationImage(
                          image: NetworkImage(value.data[index]["urlToImage"]), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        value.data[index]["title"],
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      value.data[index]["publshedAt"].toString(),
                      style: TextStyle(
                        color: Theme.of(context).shadowColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: value.data.length,
        );
      }
    );


  }


}
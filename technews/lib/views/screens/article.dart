import 'package:flutter/material.dart';
class ArticlePage extends StatelessWidget {
  Map data;

  ArticlePage({
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    String author;
    (data["author"] != null) ? author = data["author"]: author = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(author),
        shadowColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data["urlToImage"] != null)
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data["urlToImage"]), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                if (data["title"] != null)
                  Container(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      data["title"],
                      style: TextStyle(
                        color: Theme.of(context).shadowColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  if (data["description"] != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data["description"],
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
                          ),
                        ),
                    ),
            ],
          ),
      ),
    );
  }
}
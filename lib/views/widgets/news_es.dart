import 'package:flutter/material.dart';
import 'package:flutternews/views/article_view.dart';

class NewsEs extends StatelessWidget {
  final String urlToImage, title, description, content, articleUrl;

  NewsEs(
      {this.urlToImage,
      this.description,
      this.title,
      this.content,
      @required this.articleUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      articleUrl: articleUrl,
                    )));
      },
      child: Container(
        width: double.infinity,
        height: 120,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    child: Image.network(
                      urlToImage,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                    Text(
                      '2020-10-23T18:16:00Z',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}

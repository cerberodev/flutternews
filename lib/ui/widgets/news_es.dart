import 'package:flutter/material.dart';
import 'package:flutternews/ui/views/article_view.dart';

class NewsEs extends StatelessWidget {
  NewsEs({
    @required this.articleUrl,
    @required this.urlToImage,
    this.title,
  });
  final String urlToImage, title, articleUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      newsTitle: title,
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
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
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

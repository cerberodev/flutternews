import 'package:flutter/material.dart';
import 'package:flutternews/ui/views/article_view.dart';

class ColombiaCard extends StatelessWidget {
  ColombiaCard({
    @required this.urlToImage,
    @required this.articleUrl,
    this.title,
    this.author,
  });
  final String urlToImage, title, articleUrl, author;
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
            ),
          ),
        );
      },
      child: Container(
        height: 200,
        width: 200,
        margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
        child: Stack(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  urlToImage,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black38),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 200,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterLogo(size: 32),
                        Text(
                          author,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

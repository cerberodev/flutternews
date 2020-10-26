import 'package:flutter/material.dart';

class NewsEs extends StatelessWidget {
  const NewsEs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: Image.asset(
                    'assets/123.jpg',
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
                    '¿Cuál es la enfermedad que tiene hospitalizado a Ricardo Quevedo? - Caracol Radio',
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
    );
  }
}

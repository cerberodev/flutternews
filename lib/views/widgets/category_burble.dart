import 'package:flutter/material.dart';

class CategoryBurble extends StatelessWidget {
  const CategoryBurble({
    Key key,
    this.imageUrl,
    this.categoryName,
  }) : super(key: key);

  final String imageUrl, categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tap to button category');
      },
      child: Container(
        height: 70,
        width: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 70,
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

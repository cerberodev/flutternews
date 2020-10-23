import 'package:flutter/material.dart';

class ColombiaCard extends StatelessWidget {
  const ColombiaCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tap to button category');
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/123.jpg',
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black38),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Mónica Jaramillo publicó foto de su hermosa hermana, para hacerle dedicatoria especial - Pulzo.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
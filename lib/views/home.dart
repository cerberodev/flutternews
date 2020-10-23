import 'package:flutter/material.dart';
import 'package:flutternews/views/widgets/category_burble.dart';
import 'package:flutternews/views/widgets/colombia_card.dart';
import 'package:flutternews/views/widgets/news_es.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //endDrawer: Drawer(),
        //appBar: AppBar(
        //  title: Text('Flutter News'),
        //),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CategoryBurble();
                    },
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ColombiaCard();
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return NewsEs();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

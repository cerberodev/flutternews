import 'package:flutter/material.dart';
import 'package:flutternews/views/widgets/category_burble.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(),
        appBar: AppBar(
          title: Text('Flutter News'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CategoryBurble();
                  },
                ),
              ),
              Container(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

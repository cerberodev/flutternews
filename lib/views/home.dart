import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/api/news_api.dart';
import 'package:flutternews/helper/data.dart';
import 'package:flutternews/models/category_model.dart';
import 'package:flutternews/views/widgets/category_burble.dart';
import 'package:flutternews/views/widgets/colombia_card.dart';
import 'package:flutternews/views/widgets/news_es.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _loading;
  var newEsList;

  List<CategoryModel> category = List<CategoryModel>();

  void getNewsEs() async {
    NewsEsApi newsEsApi = NewsEsApi();
    await newsEsApi.getNewsEs();
    newEsList = newsEsApi.newsEsApi;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    category = getCategory();
    getNewsEs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(),
        appBar: AppBar(
          title: Text('Flutter News'),
        ),
        body: _loading
            ? Center(
                child: FlutterLogo(size: 50),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          itemBuilder: (context, index) {
                            return CategoryBurble(
                              imageUrl: category[index].imageUrl,
                              categoryName: category[index].categoryName,
                            );
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
                          itemCount: newEsList.length,
                          itemBuilder: (context, index) {
                            return NewsEs(
                              title: newEsList[index].title ?? '',
                              urlToImage: newEsList[index].urlToImage ?? '',
                              articleUrl: newEsList[index].articleUrl ?? '',
                              author: newEsList[index].author ?? '',
                              publshedAt: newEsList[index].publshedAt ?? '',
                            );
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

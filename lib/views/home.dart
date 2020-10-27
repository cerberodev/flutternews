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
  var newslist;
  var newscollist;

  List<CategoryModel> category = List<CategoryModel>();

  //void getNews() async {
  //  News news = News();
  //  await news.getNews();
  //  newslist = news.news;
  //  setState(() {
  //    _loading = false;
  //  });
  //}

  void getNewsColombia() async {
    NewsColombia newsCol = NewsColombia();
    await newsCol.getNewsColombia();
    newscollist = newsCol.newsCol;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    category = getCategory();
    //getNews();
    getNewsColombia();
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
                child: CupertinoActivityIndicator(),
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
                          itemCount: newscollist.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ColombiaCard(
                              urlToImage: newscollist[index].urlToImage ?? "",
                              title: newscollist[index].title ?? "",
                              articleUrl: newscollist[index].articleUrl ?? "",
                              author: newscollist[index].author ?? "",
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

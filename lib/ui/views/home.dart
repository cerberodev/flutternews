import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/core/api/news_api.dart';
import 'package:flutternews/core/helper/data.dart';
import 'package:flutternews/core/models/category_model.dart';
import 'package:flutternews/ui/views/vide.dart';
import 'package:flutternews/ui/widgets/category_burble.dart';
import 'package:flutternews/ui/widgets/colombia_card.dart';
import 'package:flutternews/ui/widgets/news_es.dart';
import 'package:video_player/video_player.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _loading;
  var newslist;
  var newscollist;
  var newsEsList;

  List<CategoryModel> category = List<CategoryModel>();
  VideoPlayerController _controller;
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

  void getNewsEs() async {
    NewsEsApi newsEs = NewsEsApi();
    await newsEs.getNewsEs();
    newsEsList = newsEs.newsEs;
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
    getNewsColombia();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
        ),
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
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return CategoryBurble(
                              imageUrl: category[index].imageUrl,
                              categoryName: category[index].categoryName,
                            );
                          },
                        ),
                      ),
                      Container(
                        child: RaisedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoApp()));
                          },
                          icon: Icon(Icons.play_arrow),
                          label: Text('Video'),
                        ),
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsets.only(right: 15),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 30,
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
                      Container(
                        margin: EdgeInsets.all(5),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: newsEsList.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsEs(
                              urlToImage: newsEsList[index].urlToImage ?? "",
                              title: newsEsList[index].title ?? "",
                              articleUrl: newsEsList[index].articleUrl ?? "",
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

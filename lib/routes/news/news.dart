import 'package:covid/components/shimmer_container.dart';
import 'package:covid/helper/current_data.dart';
import 'package:covid/helper/news/top_headlines_data.dart';
import 'package:covid/helper/news/news_data.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:covid/model/articles/articles.dart';
import 'package:covid/components/news/header_image.dart';
import 'package:covid/routes/news/article_page.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  TopheadlinesData topheadlinesData = TopheadlinesData();
  NewsData newsData = NewsData();
  bool isLoading = true;
  PageController _pageController = PageController();

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    await topheadlinesData.refresh();
    await newsData.refresh();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(() {});
    _pageController.dispose();
    super.dispose();
  }

  Future<void> refreshPage() async {
    setState(() {
      isLoading = true;
    });
    await CurrentData.refresh();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var headlines = topheadlinesData.headlines;
    var articles = newsData.articles;
    TopheadlinesData().refresh();
    return RefreshIndicator(
      onRefresh: refreshPage,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: height * 0.35,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: SmoothPageIndicator(
                controller: _pageController,
                count: headlines.length,
                effect: ScrollingDotsEffect(
                  dotColor: const Color(0x66FFFFFF),
                  activeDotColor: const Color(0xFFFFFFFF),
                  activeDotScale: width * 0.003,
                  dotWidth: width * 0.025,
                  dotHeight: width * 0.025,
                ),
              ),
              centerTitle: true,
              background: isLoading
                  ? Center(
                      child: ShimmerContainer(
                      height: height * 0.3,
                      width: width * 0.9,
                      radius: 28.0,
                    ))
                  : PageView(
                      controller: _pageController,
                      children: List.generate(
                        headlines.length,
                        (index) {
                          return HeaderImage(
                            imageURL: headlines[index].urlToImage,
                            text: headlines[index].title,
                          );
                        },
                      ),
                    ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ArticlePage(
                          articleUrl: articles[index].url,
                        );
                      }));
                    },
                    child: isLoading
                        ? buildLoadingList(
                            height,
                            width,
                          )
                        : buildNewsList(
                            height,
                            width,
                            articles,
                            index,
                          ),
                  );
                },
                childCount: isLoading ? 6 : articles.length,
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildNewsList(
      double height, double width, List<Article> articles, int index) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: height * 0.14,
              width: width * 0.4,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(articles[index].urlToImage),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  articles[index].title,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'ProductSans',
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: const Color(0xFFC5C5C5),
          height: height * 0.02,
          thickness: height * 0.001,
        ),
      ],
    );
  }

  buildLoadingList(height, width) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ShimmerContainer(
                height: height * 0.14,
                width: width * 0.4,
                firstColor: const Color(0x33cccccc),
                secondColor: const Color(0x55cccccc),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: List.generate(
                      2,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.all(3.5),
                          child: ShimmerContainer(
                            height: height * 0.025,
                            width: width * 0.4,
                            radius: 8.0,
                            firstColor: const Color(0x33cccccc),
                            secondColor: const Color(0x55cccccc),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: const Color(0xFFC5C5C5),
            height: height * 0.02,
            thickness: height * 0.001,
          ),
        ],
      ),
    );
  }
}

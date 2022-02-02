import 'dart:convert';

import 'package:base_app/ui/common/bottom_tab_component.dart';
import 'package:base_app/ui/common/header_component.dart';
import 'package:base_app/ui/common/sidebar_component.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'auth/signin_page.dart';
import 'ebooks.dart';
import 'home.dart';
import 'articles.dart';
import 'news.dart';
import 'profile.dart';

// late PageController pageController;
// var currentIndex = 0;

var articleList;
var newsList;
var newsCate;
var articlesCate;
var booksList;
var booksBuyCheck;
var subscribeCheck;
var latestBooksList;
var wishlistBooksList = [];
var latestArticlesList;
var latestNewsList;
var videosList;
var bannerSliderList;
var bannerList;
var userInfo;
var userInfoList;

var name;
var userId;
var userToken;
var videoSrc;
var videoTitle;
var videoDate;
var currentVideoId;

class IndexPage extends StatefulWidget {
  IndexPage({Key? key, required this.title}) : super(key: key);
  // GlobalKey gBottomKey = new GlobalKey(debugLabel: 'btm_app_bar');

  final String title;

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // final _globalWidget = GlobalWidget();

  // Pages if you click bottom navigation
  final List<Widget> _contentPages = <Widget>[
    HomePage(),
    ArticlesPage(),
    EBooksPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
    pageController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Color _color1 = Color(0xFF0181cc);
    Color primary = Theme.of(context).primaryColor;
    // Color _color2 = Color(0xFF515151);
    // Color _color3 = Color(0xFFe75f3f);

    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: HeaderComponent(),
            drawer: SidebarComponent(),
            body: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: _contentPages.map((Widget content) {
                return content;
              }).toList(),
            ),
            bottomNavigationBar: BottomTabs()),
      ),
    );
  }
}

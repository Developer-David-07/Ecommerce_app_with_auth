import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_tab_component.dart';

var userInfo;
var name;
var newsCatId;
var newsCatName;
var articlesCatId;
var articlesCatName;
var cateNewsList;
var cateArticleList;

// void _launchURL() async =>
//     await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

class SidebarComponent extends StatefulWidget implements PreferredSizeWidget {
  final Text? title;
  final bool? center;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  SidebarComponent({Key? key, this.title, this.center}) : super(key: key);
  @override
  _SidebarComponentState createState() => _SidebarComponentState();
}

class _SidebarComponentState extends State<SidebarComponent> {
  var loginInfo;
  var userDetails;
  var vehicleCategories;
  var userLoaded = false;

  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             Container(
                padding: const EdgeInsets.only(
                    top: 22.0, left: 10.0, right: 10.0, bottom: 18.0),
                child: ListTile(
                  leading: GFAvatar(
                    shape: GFAvatarShape.circle,
                    size: GFSize.LARGE,
                    child: Text('name'[0],
                        style: TextStyle(fontSize: 30)),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                  trailing: Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                    size: 34.0,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    currentIndex = 4;
                    pageController.jumpToPage(4);
                  },
                ),
                ),
            // menu lists
             Divider(
              color: Colors.grey,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                currentIndex = 0;
                pageController.jumpToPage(0);
              },
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Row(
                  children: [
                    Icon(Icons.home,
                        size: 20, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    Flexible(
                      child:
                          Text(
                            ' Home',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            GFAccordion(
                margin: EdgeInsets.zero,
                titlePadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                titleChild: Row(
                  children: [
                    Icon(
                      CupertinoIcons.news_solid,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child:
                          Text(
                            ' News',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                    ),
                  ],
                ),
                collapsedTitleBackgroundColor: Colors.transparent,
                expandedTitleBackgroundColor: Colors.transparent,
                contentBackgroundColor: Colors.transparent,
                contentChild: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int i) {
                        return InkWell(
                          onTap: () {

                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 5.0),
                            child: Text(
                              'name',
                              style:
                              TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                        );
                      }),
                ),
                collapsedIcon:
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                expandedIcon:
                Icon(Icons.keyboard_arrow_up_rounded, color: Colors.grey)),
            Divider(
              color: Colors.grey,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                currentIndex = 3;
                pageController.jumpToPage(3);
              },
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Row(
                  children: [
                    Icon(Icons.auto_stories,
                        size: 20, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Wrap(
                        children: [
                          Text(
                            ' Ebooks',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            InkWell(
              onTap: () async {
              },
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Row(
                  children: [
                    Icon(Icons.login,
                        size: 20, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    Flexible(
                          child:Text(
                            ' Login',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                    ),

                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    flex: 1,
                    child:  FloatingActionButton(
                        elevation: 0.0,
                        child: new Icon(
                            FontAwesomeIcons.facebookF),
                        backgroundColor: new Color(0xFF3b5998),
                        onPressed: (){}
                    )
                ),
                Flexible(
                    flex: 1,
                    child:  FloatingActionButton(
                        elevation: 0.0,
                        child:  Icon(
                            FontAwesomeIcons.instagram),
                        backgroundColor: new Color(0xFFE1306C),

                        onPressed: (){}

                    )

                ),
                Flexible(
                    flex: 1,
                    child:  FloatingActionButton(
                        elevation: 0.0,
                        child: new Icon(
                            FontAwesomeIcons.twitter),
                        backgroundColor: new Color(0xFF1DA1F2),
                        onPressed: (){}
                    )
                ),
              ],
            ),
          ],
        ));
  }
}

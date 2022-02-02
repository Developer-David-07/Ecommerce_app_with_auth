import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

late PageController pageController;
var currentIndex = 0;

class BottomTabs extends StatefulWidget {
  BottomTabs();
  GlobalKey gBottomKey = new GlobalKey(debugLabel: 'btm_app_bar');

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    return BottomNavigationBar(
      key: widget.gBottomKey,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (value) {
        currentIndex = value;
        pageController.jumpToPage(value);

        // this unfocus is to prevent show keyboard in the text field
        FocusScope.of(context).unfocus();
      },
      selectedFontSize: 8,
      unselectedFontSize: 8,
      iconSize: 28,
      items: [
        BottomNavigationBarItem(
          // ignore: deprecated_member_use
            title: Container(
              // margin: EdgeInsets.only(top: 5.0),
              child: Text('Home',
                  style: TextStyle(
                      color: currentIndex == 0 ? primary : Colors.grey[400],
                      fontWeight:
                      currentIndex == 0 ? FontWeight.bold : FontWeight.w500,
                      fontSize: 9)),
            ),
            icon: Icon(Icons.home,
                color: currentIndex == 0 ? primary : Colors.grey[400])),
        BottomNavigationBarItem(
          // ignore: deprecated_member_use
            title: Container(
              margin: EdgeInsets.only(top: 3.0),
              child: Text('List',
                  style: TextStyle(
                      color: currentIndex == 1 ? primary : Colors.grey[400],
                      fontWeight:
                      currentIndex == 1 ? FontWeight.bold : FontWeight.w500,
                      fontSize: 9)),
            ),
            icon: Icon(FontAwesomeIcons.list,
                color: currentIndex == 1 ? primary : Colors.grey[400])),
        BottomNavigationBarItem(
          // ignore: deprecated_member_use
            title: Container(
              margin: EdgeInsets.only(top: 3.0),
              child: Text('Grid',
                  style: TextStyle(
                      color: currentIndex == 2 ? primary : Colors.grey[400],
                      fontWeight:
                      currentIndex == 2 ? FontWeight.bold : FontWeight.w500,
                      fontSize: 9)),
            ),
            icon: FaIcon(FontAwesomeIcons.th,
                size: 24,
                color: currentIndex == 2 ? primary : Colors.grey[400])),
        BottomNavigationBarItem(
          // ignore: deprecated_member_use
            title: Container(
              margin: EdgeInsets.only(top: 3.0),
              child: Text('Profile',
                  style: TextStyle(
                      color: currentIndex == 3 ? primary : Colors.grey[400],
                      fontWeight:
                      currentIndex == 3 ? FontWeight.bold : FontWeight.w500,
                      fontSize: 9)),
            ),
            icon: Icon(Icons.account_circle,
                color: currentIndex == 3 ? primary : Colors.grey[400])),
      ],
    );
  }
}

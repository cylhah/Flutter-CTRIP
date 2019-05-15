import 'package:demo/pages/home_page/home_page.dart';
import 'package:demo/pages/my_page/my_page.dart';
import 'package:demo/pages/search_page/search_page.dart';
import 'package:demo/pages/travel_page/travel_page.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget{
  @override
  _TabNavigatorState createState() => _TabNavigatorState();

}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
           _currentIndex = index; 
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: _activeColor,
            ),
            title: Text(
              '首页',
              style: TextStyle(
                color: _currentIndex != 0 ? _defaultColor : _activeColor
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.search,
              color: _activeColor,
            ),
            title: Text(
              '搜索',
              style: TextStyle(
                color: _currentIndex != 1 ? _defaultColor : _activeColor
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.camera_alt,
              color: _activeColor,
            ),
            title: Text(
              '旅拍',
              style: TextStyle(
                color: _currentIndex != 2 ? _defaultColor : _activeColor
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.account_circle,
              color: _activeColor,
            ),
            title: Text(
              '我的',
              style: TextStyle(
                color: _currentIndex != 3 ? _defaultColor : _activeColor
              ),
            )
          ),
        ],
      ),
    );
  }
  
}

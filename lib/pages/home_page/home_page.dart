import 'package:demo/dao/home_dao.dart';
import 'package:demo/model/common_model.dart';
import 'package:demo/model/home_model.dart';
import 'package:demo/pages/home_page/widgets/banner.dart';
import 'package:demo/pages/home_page/widgets/bargin_price.dart';
import 'package:demo/pages/home_page/widgets/grid_nav.dart';
import 'package:demo/pages/home_page/widgets/local_nav.dart';
import 'package:demo/pages/home_page/widgets/sub_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const APPBAR_SCROLL_OFFSET = 60;
  List<CommonModel> bannerList = [];
  Color _boxColor = Color.fromARGB(0, 255, 255, 255);
  Color inputBoxColor = Color.fromARGB(255, 255, 255, 255);
  Color boxFontColor = Colors.white;
  SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xffffffff),
    systemNavigationBarDividerColor: null,
    statusBarColor: Color.fromARGB(0, 255, 255, 255),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  _onScroll(offset) {
    int alpha = (offset / APPBAR_SCROLL_OFFSET * 255) ~/ 1;
    int color = (-0.45 * offset + 255) ~/ 1;
    Brightness statusBarIconBrightness = offset > APPBAR_SCROLL_OFFSET * 0.8
        ? Brightness.dark
        : Brightness.light;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 255) {
      alpha = 255;
    }
    setState(() {
      boxFontColor =
          offset > APPBAR_SCROLL_OFFSET * 0.8 ? Colors.black : Colors.white;
      _boxColor = Color.fromARGB(alpha, 255, 255, 255);
      inputBoxColor = offset < APPBAR_SCROLL_OFFSET
          ? Color.fromARGB(255, color, color, color)
          : Color.fromARGB(255, 228, 228, 228);
      _currentStyle = SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xffffffff),
        systemNavigationBarDividerColor: null,
        statusBarColor: Color.fromARGB(alpha, 255, 255, 255),
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: statusBarIconBrightness,
        statusBarBrightness: Brightness.dark,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: _currentStyle,
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 250, 250, 250),
          body: Stack(
            children: <Widget>[
              MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: NotificationListener(
                      onNotification: (notification) {
                        if (notification is ScrollUpdateNotification &&
                            notification.depth == 0) {
                          _onScroll(notification.metrics.pixels);
                        }
                      },
                      child: ListView(
                        children: <Widget>[
                          Container(
                            height: 230,
                            child: Stack(
                              children: <Widget>[
                                ClipPath(
                                  clipper: _ArcClipper(),
                                  child: MyBanner(
                                    bannerList: bannerList,
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 9,
                                  right: 9,
                                  child: LocalNav(),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 6),
                              child: GridNav()),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 6),
                              child: SubNav()),
                          Padding(
                              padding: EdgeInsets.fromLTRB(9, 0, 9, 7),
                              child: BarginPrice())
                        ],
                      ))),
              _searchBox()
            ],
          )),
    );
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        bannerList = model.bannerList;
      });
    } catch (e) {
      print(e);
    }
    return null;
  }

  Widget _searchBox() {
    return SafeArea(
        top: true,
        child: Container(
            alignment: Alignment.center,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: _boxColor,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 26,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '杭州',
                        style: TextStyle(color: boxFontColor),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: boxFontColor,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: inputBoxColor,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: 26,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 92, 182, 236),
                              size: 18,
                            ),
                            Expanded(
                                child: TextField(
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 5),
                                  border: InputBorder.none,
                                  hintText: '杭州攻略',
                                  hintStyle: TextStyle(fontSize: 14)),
                            )),
                            Icon(
                              Icons.settings_voice,
                              color: Color.fromARGB(255, 169, 169, 169),
                              size: 18,
                            )
                          ],
                        ),
                      )),
                ),
                Container(
                  width: 50,
                  height: 26,
                  child: Icon(
                    Icons.comment,
                    color: boxFontColor,
                    size: 20,
                  ),
                )
              ],
            )));
  }
}

class _ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 30);
    Offset firstControlPoint = Offset(size.width / 4, size.height - 10);
    Offset firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    Offset secondControlPoint = Offset(size.width * 3 / 4, size.height - 10);
    Offset secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

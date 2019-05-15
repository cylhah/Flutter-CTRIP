import 'package:demo/dao/home_dao.dart';
import 'package:demo/model/common_model.dart';
import 'package:demo/model/home_model.dart';
import 'package:demo/pages/home_page/widgets/banner.dart';
import 'package:demo/pages/home_page/widgets/bargin_price.dart';
import 'package:demo/pages/home_page/widgets/grid_nav.dart';
import 'package:demo/pages/home_page/widgets/local_nav.dart';
import 'package:demo/pages/home_page/widgets/sub_nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const APPBAR_SCROLL_OFFSET = 60;
  List<CommonModel> bannerList = [];
  Color _boxColor = Color.fromARGB(0, 255, 255, 255);
  Color inputBoxColor = Color.fromARGB(255, 255, 255, 255);

  @override
  void initState() {
    _handleRefresh();
    super.initState();
  }

  _onScroll(offset) {
    int alpha = (offset / APPBAR_SCROLL_OFFSET * 255) ~/ 1;
    int color = (-0.45 * offset + 255) ~/ 1;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 255) {
      alpha = 255;
    }
    setState(() {
      _boxColor = Color.fromARGB(alpha, 255, 255, 255);
    });
    if (offset < APPBAR_SCROLL_OFFSET) {
      setState(() {
        inputBoxColor = Color.fromARGB(255, color, color, color);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        MyBanner(bannerList: bannerList),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 6),
                            child: LocalNav()),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 6),
                            child: GridNav()),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 6),
                            child: SubNav()),
                        Padding(
                            padding: EdgeInsets.fromLTRB(6, 0, 6, 7),
                            child: BarginPrice())
                      ],
                    ))),
            _searchBox()
          ],
        ));
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
                      Text('杭州'),
                      Icon(Icons.keyboard_arrow_down),
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
                    color: Color.fromARGB(255, 200, 200, 200),
                    size: 20,
                  ),
                )
              ],
            )));
  }
}

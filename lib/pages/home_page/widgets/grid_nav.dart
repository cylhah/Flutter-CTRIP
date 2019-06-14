import 'package:demo/widgets/my_webview.dart';
import 'package:flutter/material.dart';

class GridNav extends StatelessWidget {
  final List<_GridNavModel> gridNavList = [
    _GridNavModel(
        title: '酒店',
        background: 'images/grid-nav-items-hotel.png',
        url: 'https://m.ctrip.com/webapp/hotel/'),
    _GridNavModel(
        title: '海外酒店',
        url: 'https://m.ctrip.com/webapp/hotel/oversea/?otype=1'),
    _GridNavModel(
        title: '特价酒店', url: 'https://m.ctrip.com/webapp/hotel/hotsale'),
    _GridNavModel(
        title: '团购',
        url:
            '"https://m.ctrip.com/webapp/tuan/?secondwakeup=true&dpclickjump=true'),
    _GridNavModel(
        title: '机票',
        background: 'images/grid-nav-items-flight.png',
        url: 'https://m.ctrip.com/html5/flight/swift/index'),
    _GridNavModel(
        title: '火车票',
        url:
            'https://m.ctrip.com/webapp/train/?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F#/index?VNK=4e431539'),
    _GridNavModel(
        title: '特价机票', url: 'https://m.ctrip.com/html5/flight/swift/index'),
    _GridNavModel(
        title: '汽车票·船票', url: 'https://m.ctrip.com/html5/Trains/bus/'),
    _GridNavModel(
        title: '旅游',
        background: 'images/grid-nav-items-travel.png',
        url: 'https://m.ctrip.com/webapp/vacations/tour/vacations'),
    _GridNavModel(
        title: '门票', url: '"https://m.ctrip.com/webapp/ticket/ticket'),
    _GridNavModel(title: '目的地攻略', url: 'https://m.ctrip.com/html5/you/'),
    _GridNavModel(
        title: '邮轮旅行', url: '"https://m.ctrip.com/webapp/cruise/index'),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(children: _gridNavItems(context)),
    );
  }

  List<Widget> _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    items.add(_gridNavItem(context, gridNavList.sublist(0, 4),
        [Color.fromARGB(255, 250, 89, 86), Color.fromARGB(255, 250, 155, 77)]));
    items.add(_gridNavItem(context, gridNavList.sublist(4, 8), [
      Color.fromARGB(255, 75, 143, 237),
      Color.fromARGB(255, 75, 143, 237)
    ]));
    items.add(_gridNavItem(context, gridNavList.sublist(8, 12), [
      Color.fromARGB(255, 52, 194, 170),
      Color.fromARGB(255, 108, 213, 87)
    ]));
    return items;
  }

  Widget _gridNavItem(BuildContext context, List<_GridNavModel> itemList,
      List<Color> gradient) {
    const itemHeight = 66.0;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MyWebview(
                        url: itemList[0].url, title: itemList[0].title);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(itemList[0].background),
                        fit: BoxFit.cover),
                    border: BorderDirectional(
                        end: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                  ),
                  height: itemHeight,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    itemList[0].title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MyWebview(
                        url: itemList[1].url, title: itemList[1].title);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          end: BorderSide(color: Colors.white),
                          bottom: BorderSide(color: Colors.white))),
                  height: itemHeight,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    itemList[1].title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MyWebview(
                        url: itemList[2].url, title: itemList[2].title);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          end: BorderSide(color: Colors.white),
                          bottom: BorderSide(color: Colors.white))),
                  height: itemHeight,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    itemList[2].title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MyWebview(
                        url: itemList[3].url, title: itemList[3].title);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(color: Colors.white))),
                  height: itemHeight,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    itemList[3].title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class _GridNavModel {
  final String background;
  final String title;
  final String url;

  _GridNavModel({this.background, this.title, this.url});
}

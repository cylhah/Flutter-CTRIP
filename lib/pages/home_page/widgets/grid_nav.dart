import 'package:flutter/material.dart';

class GridNav extends StatelessWidget {
  final List<_GridNavModel> gridNavList = [
    _GridNavModel(title: '酒店', background: 'images/grid-nav-items-hotel.png'),
    _GridNavModel(title: '海外酒店'),
    _GridNavModel(title: '特价酒店'),
    _GridNavModel(title: '团购'),
    _GridNavModel(title: '机票', background: 'images/grid-nav-items-flight.png'),
    _GridNavModel(title: '火车票'),
    _GridNavModel(title: '特价机票'),
    _GridNavModel(title: '汽车票·船票'),
    _GridNavModel(title: '旅游', background: 'images/grid-nav-items-travel.png'),
    _GridNavModel(title: '门票'),
    _GridNavModel(title: '目的地攻略'),
    _GridNavModel(title: '邮轮旅行'),
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
          ),
          Expanded(
            flex: 2,
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
          ),
          Expanded(
            flex: 2,
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
          ),
          Expanded(
            flex: 2,
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
          ),
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

import 'package:flutter/material.dart';

class SubNav extends StatelessWidget {
  final List<_SubNavModel> subNavList = [
    _SubNavModel(icon: 'images/sub_nav_wifi.png', title: 'WiFi电话卡'),
    _SubNavModel(icon: 'images/sub_nav_visa.png', title: '保险·签证'),
    _SubNavModel(icon: 'images/sub_nav_exchange.png', title: '外币兑换'),
    _SubNavModel(icon: 'images/sub_nav_shopping.png', title: '购物'),
    _SubNavModel(icon: 'images/sub_nav_guide.png', title: '当地向导'),
    _SubNavModel(icon: 'images/sub_nav_freetravel.png', title: '自由行'),
    _SubNavModel(icon: 'images/sub_nav_play.png', title: '境外玩乐'),
    _SubNavModel(icon: 'images/sub_nav_lipin.png', title: '礼品卡'),
    _SubNavModel(icon: 'images/sub_nav_credit.png', title: '信用卡'),
    _SubNavModel(icon: 'images/sub_nav_more.png', title: '更多'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(bottom: 13), child: _row(0, 5)),
        Padding(padding: EdgeInsets.only(bottom: 13), child: _row(5, 10))
      ],
    );
  }

  Widget _row(int start, int end) {
    List<Widget> items = [];
    for (int i = start; i < end; i++) {
      items.add(_item(subNavList[i]));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(_SubNavModel model) {
    return Container(
      width: 50,
      child: Column(
        children: <Widget>[
          Image.asset(
            model.icon,
            width: 19,
            height: 19,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              model.title,
              style: TextStyle(fontSize: 10),
            ),
          )
        ],
      )
    );
  }
}

class _SubNavModel {
  final String icon;
  final String title;
  final String url;

  _SubNavModel(
      {this.icon, this.title, this.url});
}
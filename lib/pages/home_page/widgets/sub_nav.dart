import 'package:demo/widgets/my_webview.dart';
import 'package:flutter/material.dart';

class SubNav extends StatelessWidget {
  final List<_SubNavModel> subNavList = [
    _SubNavModel(
        icon: 'images/sub_nav_wifi.png',
        title: 'WiFi电话卡',
        url: 'https://m.ctrip.com/webapp/activity/wifi'),
    _SubNavModel(
        icon: 'images/sub_nav_visa.png',
        title: '保险·签证',
        url: 'https://m.ctrip.com/webapp/tourvisa/entry'),
    _SubNavModel(
        icon: 'images/sub_nav_exchange.png',
        title: '外币兑换',
        url: 'https://dp.ctrip.com/webapp/forex/index?bid=2&1=1'),
    _SubNavModel(
        icon: 'images/sub_nav_shopping.png',
        title: '购物',
        url:
            'https://m.ctrip.com/webapp/gshop/?ctm_ref=M_ps_2home_sl&bid=2&cid=3&pid=1'),
    _SubNavModel(
        icon: 'images/sub_nav_guide.png',
        title: '当地向导',
        url:
            'https://m.ctrip.com/webapp/vacations/pguider/homepage?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F'),
    _SubNavModel(
        icon: 'images/sub_nav_freetravel.png',
        title: '自由行',
        url:
            'https://dp.ctrip.com/webapp/vacations/idiytour/diyindex?navBarStyle=white'),
    _SubNavModel(
        icon: 'images/sub_nav_play.png',
        title: '境外玩乐',
        url: 'https://dp.ctrip.com/webapp/activity/overseasindex'),
    _SubNavModel(
        icon: 'images/sub_nav_lipin.png',
        title: '礼品卡',
        url: 'https://dp.ctrip.com/webapp/lipin/money'),
    _SubNavModel(
        icon: 'images/sub_nav_credit.png',
        title: '信用卡',
        url: 'https://dp.ctrip.com/webapp/cc/index?bid=8&cid=1&pid=4'),
    _SubNavModel(
        icon: 'images/sub_nav_more.png',
        title: '更多',
        url: 'https://dp.ctrip.com/webapp/more/'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 13), child: _row(context, 0, 5)),
        Padding(
            padding: EdgeInsets.only(bottom: 13), child: _row(context, 5, 10))
      ],
    );
  }

  Widget _row(BuildContext context, int start, int end) {
    List<Widget> items = [];
    for (int i = start; i < end; i++) {
      items.add(_item(context, subNavList[i]));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context, _SubNavModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return MyWebview(url: model.url, title: model.title);
        }));
      },
      child: Container(
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
          )),
    );
  }
}

class _SubNavModel {
  final String icon;
  final String title;
  final String url;

  _SubNavModel({this.icon, this.title, this.url});
}

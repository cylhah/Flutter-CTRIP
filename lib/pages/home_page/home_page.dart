import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  static const APPBAR_SCROLL_OFFSET = 60;
  List _imageUrls = [
    'https://images3.c-ctrip.com/overseas/city/singapore256-256.jpg',
    'https://imgs.qunarzz.com/vs_ceph_vs_tts/a891b14c-5704-43c0-8e14-acbe1c41c3f3.jpg_r_480x320x90_b7d8392c.jpg',
    'https://imgs.qunarzz.com/p/p70/1809/e7/4941057a6aae702.jpg_256x160_9fee6ccb.jpg'
  ];
  Color _boxColor = Color.fromARGB(0, 255, 255, 255);
  Color inputBoxColor = Color.fromARGB(255, 255, 255, 255);

  _onScroll(offset) {
    int alpha = (offset / APPBAR_SCROLL_OFFSET * 255) ~/ 1;
    int color = (-0.45 * offset + 255) ~/ 1;
    if(alpha < 0) {
      alpha = 0;
    } else if (alpha > 255) {
      alpha = 255;
    }
    setState(() {
      _boxColor = Color.fromARGB(alpha, 255, 255, 255);
    });
    if(offset < APPBAR_SCROLL_OFFSET) {
      setState(() {
        inputBoxColor = Color.fromARGB(255, color, color, color);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (notification) {
                if(notification is ScrollUpdateNotification && notification.depth == 0) {
                  _onScroll(notification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7,vertical: 2),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(color: Color.fromARGB(255, 238, 238, 238), offset: Offset(0, 3))
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image.network(
                                'https://imgs.qunarzz.com/p/p70/1809/e7/4941057a6aae702.jpg_256x160_9fee6ccb.jpg',
                                width: 32,
                                height: 32,
                              ),
                              Text('攻略-景点', style: TextStyle(fontSize: 10),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image.network(
                                'https://imgs.qunarzz.com/p/p70/1809/e7/4941057a6aae702.jpg_256x160_9fee6ccb.jpg',
                                width: 32,
                                height: 32,
                              ),
                              Text('攻略-景点', style: TextStyle(fontSize: 10),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image.network(
                                'https://imgs.qunarzz.com/p/p70/1809/e7/4941057a6aae702.jpg_256x160_9fee6ccb.jpg',
                                width: 32,
                                height: 32,
                              ),
                              Text('攻略-景点', style: TextStyle(fontSize: 10),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image.network(
                                'https://imgs.qunarzz.com/p/p70/1809/e7/4941057a6aae702.jpg_256x160_9fee6ccb.jpg',
                                width: 32,
                                height: 32,
                              ),
                              Text('攻略-景点', style: TextStyle(fontSize: 10),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image.network(
                                'https://imgs.qunarzz.com/p/p70/1809/e7/4941057a6aae702.jpg_256x160_9fee6ccb.jpg',
                                width: 32,
                                height: 32,
                              ),
                              Text('攻略-景点', style: TextStyle(fontSize: 10),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            )
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 80,
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: _boxColor,
              // border: BorderDirectional(bottom: BorderSide(color: Color.fromARGB(255, 225, 225, 225)))
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
                      Icon(
                        Icons.arrow_drop_down
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: inputBoxColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    height: 26,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 92, 182, 236),
                            size: 18,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 5),
                                border: InputBorder.none,
                                hintText: '杭州攻略',
                                hintStyle: TextStyle(fontSize: 14)
                              ),
                            )
                          ),
                          Icon(
                            Icons.settings_voice,
                            color: Color.fromARGB(255, 169, 169, 169),
                            size: 18,
                          )
                        ],
                      ),
                    )
                  ),
                ),
                Container(
                  width: 50,
                  height: 26,
                  child: Icon(
                    Icons.comment,
                    color: Color.fromARGB(255, 88, 88, 88),
                    size: 20,
                  ),
                )
              ],
            )
          ),
        ],
      )
    );
  }
}

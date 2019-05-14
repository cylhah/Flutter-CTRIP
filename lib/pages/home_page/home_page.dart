import 'package:demo/dao/home_dao.dart';
import 'package:demo/model/common_model.dart';
import 'package:demo/model/grid_nav_model.dart';
import 'package:demo/model/home_model.dart';
import 'package:demo/pages/home_page/widgets/banner.dart';
import 'package:demo/pages/home_page/widgets/grid_nav.dart';
import 'package:demo/pages/home_page/widgets/local_nav.dart';
import 'package:demo/pages/home_page/widgets/sub_nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
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
                  MyBanner(bannerList: bannerList),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7,vertical: 6),
                    child: LocalNav()
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                    child: GridNav()
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                    child: SubNav()
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 0, 6, 7),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('超值特惠', style: TextStyle(fontSize: 15),),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text('更多', style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 164, 164, 164)),),
                                    Icon(Icons.keyboard_arrow_right, size: 18, color: Color.fromARGB(255, 164, 164, 164),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 158, 106),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text('特价机票', style: TextStyle(color: Colors.white),),
                                        Padding(
                                          padding: EdgeInsets.only(left: 3),
                                          child: Icon(
                                            Icons.play_circle_filled,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 52,
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3)
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('杭州 -> 北京', style: TextStyle(fontSize: 10),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Color.fromARGB(255, 255, 164, 19)
                                                ),
                                                child: Text('2.0折', style: TextStyle(fontSize: 8, color: Colors.white),),
                                              ),
                                              Container(
                                                // decoration: BoxDecoration(color: Colors.greenAccent),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text('￥', style: TextStyle(fontSize: 8, color: Color.fromARGB(255, 255, 102, 51)),),
                                                    Text('440',style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 102, 51)),),
                                                    Text('起', style: TextStyle(fontSize: 8, color: Color.fromARGB(255, 255, 102, 51)),)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 52,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3)
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('杭州 -> 广州', style: TextStyle(fontSize: 10),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Color.fromARGB(255, 255, 164, 19)
                                                ),
                                                child: Text('3.2折', style: TextStyle(fontSize: 8, color: Colors.white),),
                                              ),
                                              Container(
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text('￥', style: TextStyle(fontSize: 8, color: Color.fromARGB(255, 255, 102, 51)),),
                                                    Text('450',style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 102, 51)),),
                                                    Text('起', style: TextStyle(fontSize: 8, color: Color.fromARGB(255, 255, 102, 51)),)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 49, 216, 201),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text('特价机票', style: TextStyle(color: Colors.white),),
                                        Padding(
                                          padding: EdgeInsets.only(left: 3),
                                          child: Icon(
                                            Icons.play_circle_filled,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 52,
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3)
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('杭州 -> 北京', style: TextStyle(fontSize: 10),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Color.fromARGB(255, 255, 164, 19)
                                                ),
                                                child: Text('2.0折', style: TextStyle(fontSize: 8, color: Colors.white),),
                                              ),
                                              Container(
                                                // decoration: BoxDecoration(color: Colors.greenAccent),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text('￥', style: TextStyle(fontSize: 8, color: Color.fromARGB(255, 255, 102, 51)),),
                                                    Text('440',style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 102, 51)),),
                                                    Text('起', style: TextStyle(fontSize: 8, color: Color.fromARGB(255, 255, 102, 51)),)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 52,
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3)
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('杭州 -> 广州', style: TextStyle(fontSize: 10),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Color.fromARGB(255, 255, 164, 19)
                                                ),
                                                child: Text('3.2折', style: TextStyle(fontSize: 8, color: Colors.white),),
                                              ),
                                              Container(
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text('￥', style: TextStyle(fontSize: 8, color: Color.fromARGB(255, 255, 102, 51)),),
                                                    Text('450',style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 102, 51)),),
                                                    Text('起', style: TextStyle(fontSize: 8, color: Color.fromARGB(255, 255, 102, 51)),)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(color: Color.fromARGB(255, 238, 238, 238), offset: Offset(0, 2))
                            ]
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('images/bed.png'), fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8))
                                  ), 
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('特价酒店', style: TextStyle(fontSize: 14)),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Row(
                                          children: <Widget>[
                                            Text('限时', style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 247, 17, 17), fontWeight: FontWeight.w600)),
                                            Text('抢购', style: TextStyle(fontSize: 11),)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('images/bed.png'), fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8))
                                  ), 
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('特价酒店', style: TextStyle(fontSize: 14)),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Row(
                                          children: <Widget>[
                                            Text('限时', style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 247, 17, 17), fontWeight: FontWeight.w600)),
                                            Text('抢购', style: TextStyle(fontSize: 11),)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('images/bed.png'), fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(8))
                                  ), 
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('特价酒店', style: TextStyle(fontSize: 14)),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Row(
                                          children: <Widget>[
                                            Text('限时', style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 247, 17, 17), fontWeight: FontWeight.w600)),
                                            Text('抢购', style: TextStyle(fontSize: 11),)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  )
                ],
              )
            )
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 60,
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
                        Icons.keyboard_arrow_down
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
                    color: Color.fromARGB(255, 200, 200, 200),
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
}

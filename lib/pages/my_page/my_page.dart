import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

const APPBAR_SCROLL_OFFSET = 100;

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Color barFontColor = Colors.white;
  Color barBgColor = Color.fromARGB(0, 255, 255, 255);
  SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff000000),
    systemNavigationBarDividerColor: null,
    statusBarColor: Color.fromARGB(0, 255, 255, 255),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  _onScroll(offset) {
    int alpha = (offset / APPBAR_SCROLL_OFFSET * 255) ~/ 1;
    Color fontColor =
        offset > APPBAR_SCROLL_OFFSET * 0.8 ? Colors.black : Colors.white;
    Brightness statusBarIconBrightness = offset > APPBAR_SCROLL_OFFSET * 0.8
        ? Brightness.dark
        : Brightness.light;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 255) {
      alpha = 255;
    }
    setState(() {
      barBgColor = Color.fromARGB(alpha, 255, 255, 255);
      barFontColor = fontColor;
      _currentStyle = SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff000000),
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
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: NotificationListener(
                onNotification: (notification) {
                  if (notification is ScrollUpdateNotification &&
                      notification.depth == 0) {
                    _onScroll(notification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    _item1(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _item2(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _myWallet(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _cards(),
                    )
                  ],
                ),
              ),
            ),
            _banner()
          ],
        ),
      ),
    );
  }

  Widget _item1() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 300,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 70, 20, 0),
            height: 260,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(colors: <Color>[
                  Color.fromARGB(255, 31, 128, 255),
                  Color.fromARGB(255, 36, 177, 255)
                ])),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    'https://images.nowcoder.com/images/20180510/9356835_1525914844075_7C2C60506876716CCF0E706DB13D4511@0e_100w_100h_0c_1i_1o_90Q_1x'))),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 66,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '尊敬的会员',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(153, 0, 123, 240)),
                                  child: Text(
                                    '领会员福利',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(153, 0, 123, 240)),
                                  child: Text(
                                    '程信分538',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: Icon(
                                Icons.contact_mail,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                            Text(
                              '常用信息',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                            Text(
                              '我的收藏',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: Icon(
                                Icons.history,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                            Text(
                              '浏览历史',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                            Text(
                              '我的旅拍',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(255, 238, 238, 238),
                        offset: Offset(0, 3))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'images/ln_ticket.png',
                        width: 26,
                        height: 26,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          '全部订单',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'images/ln_food.png',
                        width: 26,
                        height: 26,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          '代付款',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'images/ln_weekend.png',
                        width: 26,
                        height: 26,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          '未出行',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'images/ln_oneday.png',
                        width: 26,
                        height: 26,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          '待点评',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _item2() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 238, 238, 238), offset: Offset(0, 2))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '实名认证',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  '为保证账户安全马上认证',
                  style: TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Color.fromARGB(255, 176, 176, 176),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _myWallet() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 249, 249, 249)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '我的钱包',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '礼品卡·现金·返现',
                          style: TextStyle(
                              color: Color.fromARGB(255, 176, 176, 176)),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 176, 176, 176),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 249, 249, 249)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(Icons.add_shopping_cart),
                      ),
                      Text(
                        '拿去花',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(Icons.enhanced_encryption),
                      ),
                      Text(
                        '借现金',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(Icons.timelapse),
                      ),
                      Text(
                        '理财',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(Icons.credit_card),
                      ),
                      Text(
                        '白金卡',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              end: BorderSide(
                                  color: Color.fromARGB(255, 249, 249, 249)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.credit_card,
                                  size: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Text(
                                    '优惠券',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            '0张',
                            style: TextStyle(
                                color: Color.fromARGB(255, 31, 128, 255)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.monetization_on,
                                  size: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Text(
                                    '积分',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            '20分',
                            style: TextStyle(
                                color: Color.fromARGB(255, 31, 128, 255)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cards() {
    return Container(
      height: 220,
      child: PhysicalModel(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.dns,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '会员权益码',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.view_day,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '银联付款码',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.local_airport,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '航班助手',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.library_books,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '出行清单',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.security,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '我的保险',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.store_mall_directory,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '携程门店',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.event_note,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '电子发票',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.public,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '一生旅行',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.chat,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '我的社区',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.mic,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '离线讲解',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.border_color,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '用户调研',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 62,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.more,
                            size: 24,
                            color: Color.fromARGB(255, 140, 140, 140),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '更多',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 140, 140, 140)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget _banner() {
    return SafeArea(
        top: true,
        child: Container(
          color: barBgColor,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.calendar_today,
                  color: barFontColor,
                ),
              ),
              Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      color: barFontColor,
                    ),
                    Icon(Icons.crop_free, color: barFontColor),
                    Icon(Icons.sentiment_satisfied, color: barFontColor)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

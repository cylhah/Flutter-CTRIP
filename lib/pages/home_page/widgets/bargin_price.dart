import 'package:flutter/material.dart';

class BarginPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_titleBar(), _middle(), _bottom()],
    );
  }

  Widget _titleBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '超值特惠',
            style: TextStyle(fontSize: 15),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  '更多',
                  style: TextStyle(
                      fontSize: 10, color: Color.fromARGB(255, 164, 164, 164)),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 18,
                  color: Color.fromARGB(255, 164, 164, 164),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _middle() {
    return Row(
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
                    Text(
                      '特价机票',
                      style: TextStyle(color: Colors.white),
                    ),
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
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '杭州 -> 北京',
                        style: TextStyle(fontSize: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 255, 164, 19)),
                            child: Text(
                              '2.0折',
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white),
                            ),
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '￥',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                ),
                                Text(
                                  '440',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                ),
                                Text(
                                  '起',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                )
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
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '杭州 -> 广州',
                        style: TextStyle(fontSize: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 255, 164, 19)),
                            child: Text(
                              '3.2折',
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white),
                            ),
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '￥',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                ),
                                Text(
                                  '450',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                ),
                                Text(
                                  '起',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                )
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
                    Text(
                      '特价机票',
                      style: TextStyle(color: Colors.white),
                    ),
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
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '杭州 -> 北京',
                        style: TextStyle(fontSize: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 255, 164, 19)),
                            child: Text(
                              '2.0折',
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white),
                            ),
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '￥',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                ),
                                Text(
                                  '440',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                ),
                                Text(
                                  '起',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                )
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
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '杭州 -> 广州',
                        style: TextStyle(fontSize: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 255, 164, 19)),
                            child: Text(
                              '3.2折',
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white),
                            ),
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '￥',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                ),
                                Text(
                                  '450',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                ),
                                Text(
                                  '起',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Color.fromARGB(255, 255, 102, 51)),
                                )
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
    );
  }

  Widget _bottom() {
    return Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color.fromARGB(255, 238, 238, 238), offset: Offset(0, 2))
        ]),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bed.png'), fit: BoxFit.cover),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(8))),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('特价酒店', style: TextStyle(fontSize: 14)),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text.rich(
                        TextSpan(
                          text: '限时',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color.fromARGB(255, 247, 17, 17),
                            fontWeight: FontWeight.w600
                          ),
                          children: <TextSpan> [
                            TextSpan(text: '抢购', style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
                          ]
                        )
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
                    image: DecorationImage(
                        image: AssetImage('images/bed.png'), fit: BoxFit.cover),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(8))),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('特价旅游', style: TextStyle(fontSize: 14)),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text.rich(
                        TextSpan(
                          text: '超值',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                          children: <TextSpan> [
                            TextSpan(text: '3折', style: TextStyle(color: Color.fromARGB(255, 247, 17, 17), fontWeight: FontWeight.w600)),
                            TextSpan(text: '起', style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
                          ]
                        )
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
                    image: DecorationImage(
                        image: AssetImage('images/bed.png'), fit: BoxFit.cover),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(8))),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('私家团', style: TextStyle(fontSize: 14)),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text.rich(
                        TextSpan(
                          text: '最高',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                          children: <TextSpan> [
                            TextSpan(text: '减1000', style: TextStyle(color: Color.fromARGB(255, 247, 17, 17), fontWeight: FontWeight.w600)),
                          ]
                        )
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

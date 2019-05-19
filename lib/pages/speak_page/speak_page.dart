import 'package:flutter/material.dart';

class SpeakPage extends StatefulWidget {
  @override
  _SpeakPageState createState() => _SpeakPageState();
}

class _SpeakPageState extends State<SpeakPage> {
  Color _micIconColor = Color.fromARGB(255, 31, 143, 229);
  String _speakTip = '长按说话';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    Text('你可以这样说', style: TextStyle(fontSize: 18)),
                    _examples()
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: _bottom(),
            )
          ],
        ),
      ),
    );
  }

  Widget _examples() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              '故宫门票',
              style: TextStyle(color: Color.fromARGB(225, 100, 100, 100)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              '故宫门票',
              style: TextStyle(color: Color.fromARGB(225, 100, 100, 100)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              '故宫门票',
              style: TextStyle(color: Color.fromARGB(225, 100, 100, 100)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              '故宫门票',
              style: TextStyle(color: Color.fromARGB(225, 100, 100, 100)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottom() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: <Widget>[
          Text(
            _speakTip,
            style: TextStyle(
                fontSize: 12, color: Color.fromARGB(255, 80, 178, 239)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 26,
                ),
                GestureDetector(
                  onTapUp: (_) {
                    setState(() {
                      _micIconColor = Color.fromARGB(255, 31, 143, 229);
                      _speakTip = '长按说话';
                    });
                  },
                  onTapDown: (_) {
                    setState(() {
                      _micIconColor = Color.fromARGB(255, 15, 127, 165);
                      _speakTip = '松开完成';
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: _micIconColor,
                        borderRadius: BorderRadius.circular(60 / 2)),
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(Icons.clear,
                        color: Color.fromARGB(255, 164, 164, 164)),
                  ),
                )
              ],
            ),
          ),
          Text('百度语音提供技术支持',
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 200, 200, 200)))
        ],
      ),
    );
  }
}

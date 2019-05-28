import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyWebview extends StatefulWidget {
  final String url;
  final String title;
  MyWebview({Key key, this.url, this.title}) : super(key: key);

  @override
  _MyWebviewState createState() => _MyWebviewState();
}

class _MyWebviewState extends State<MyWebview> {
  SystemUiOverlayStyle defaultUi = SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xffffffff),
    systemNavigationBarDividerColor: null,
    statusBarColor: Color.fromARGB(255, 0, 0, 0),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: defaultUi,
        child: Scaffold(
            body: SafeArea(
          top: true,
          child: Column(
            children: <Widget>[
              _webviewAppBar(),
              Expanded(
                child: WebviewScaffold(
                  url: widget.url,
                ),
              )
            ],
          ),
        )));
  }

  Widget _webviewAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          border: BorderDirectional(
              bottom: BorderSide(color: Color.fromARGB(255, 180, 180, 180)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 34,
              child: Icon(
                Icons.keyboard_arrow_left,
                size: 34,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
            ),
          ),
          Container(
            width: 260,
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 17),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(width: 34),
        ],
      ),
    );
  }
}

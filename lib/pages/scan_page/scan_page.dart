import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanPage extends StatefulWidget {
  final String url;
  final String title;
  ScanPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
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
              Text('data')
            ],
          ),
        )));
  }
}

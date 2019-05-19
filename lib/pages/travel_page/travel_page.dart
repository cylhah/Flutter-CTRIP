import 'package:demo/dao/travel_tab_dao.dart';
import 'package:demo/model/travel_tab_model.dart';
import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<TravelTab> tabs = [];
  TravelTabModel travelTabModel;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _loadData() async {
    _controller = TabController(length: 0, vsync: this);
    try {
      TravelTabModel model = await TravelTabDao.fetch();
      _controller = TabController(
          length: model.tabs.length, vsync: this); //fix tab label 空白问题
      setState(() {
        tabs = model.tabs;
        travelTabModel = model;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 248, 251),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: TabBar(
                    controller: _controller,
                    isScrollable: true,
                    labelColor: Colors.black,
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(color: Color(0xff1fcfbb), width: 3),
                        insets: EdgeInsets.only(bottom: 10)),
                    tabs: tabs.map<Tab>((TravelTab tab) {
                      return Tab(
                        text: tab.labelName,
                      );
                    }).toList()),
              ),
              Expanded(
                child: TabBarView(
                    controller: _controller,
                    children: tabs.map((TravelTab tab) {
                      return Text(tab.labelName);
                    }).toList()),
              )
            ],
          ),
        ));
  }
}

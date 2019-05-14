import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget{
  @override
  _SearchBoxState createState() => _SearchBoxState();

}

class _SearchBoxState extends State<SearchBox> {

  Color _boxColor = Color.fromARGB(0, 255, 255, 255);
  Color inputBoxColor = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: <Widget>[
                  Text('杭州'),
                  Icon(
                    Icons.arrow_drop_down
                  ),
                ],
              ),
            )
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
    );
  }
}
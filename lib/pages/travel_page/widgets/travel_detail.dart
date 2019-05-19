import 'package:demo/dao/travel_dao.dart';
import 'package:demo/model/travel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const PAGE_SIZE = 10;

class TravelDetail extends StatefulWidget {
  final Map params;
  final String groupChannelCode;
  final int type;

  const TravelDetail({Key key, this.params, this.groupChannelCode, this.type})
      : super(key: key);

  @override
  _TravelDetailState createState() => _TravelDetailState();
}

class _TravelDetailState extends State<TravelDetail> {
  TravelModel travelModel;
  List<TravelItem> travelItemList = [];
  int pageIndex = 1;

  @override
  void initState() {
    super.initState();
    _loadDetailData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadDetailData() async {
    try {
      TravelModel data = await TravelDao.fetch(widget.params,
          widget.groupChannelCode, widget.type, pageIndex, PAGE_SIZE);
      List<TravelItem> temp = [];
      data.resultList.forEach((item){
        if(item.article!=null) {
          temp.add(item);
        }
      });
      setState(() {
        travelItemList = temp;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: travelItemList.length,
          itemBuilder: (BuildContext context, int index) =>
              _travelItemCard(travelItemList[index], index),
          staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ));
  }

  Widget _travelItemCard(TravelItem item, int index) {
    return Container(
        child: PhysicalModel(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(item.article?.images[0]?.dynamicUrl),
              Positioned(
                bottom: 5,
                left: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 16,
                      ),
                      LimitedBox(
                        maxWidth: 100,
                        child: Text(
                          item.article.pois[0].poiName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: Text(
                    item.article.articleTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(6, 0, 6, 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(item.article.author
                                        ?.coverImage?.dynamicUrl)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              width: 60,
                              child: Text(
                                item.article.author?.nickName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.thumb_up,
                              size: 14,
                              color: Color.fromARGB(255, 186, 186, 186),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                item.article.likeCount.toString(),
                                style: TextStyle(fontSize: 11),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

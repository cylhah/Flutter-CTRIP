import 'package:demo/dao/travel_dao.dart';
import 'package:demo/model/travel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadDetailData();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent -
              _scrollController.position.pixels <
          100) {
        _loadDetailData(loadMore: true);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _loadDetailData({loadMore = false}) async {
    if (loadMore) {
      pageIndex++;
    } else {
      pageIndex = 1;
    }
    try {
      TravelModel data = await TravelDao.fetch(widget.params,
          widget.groupChannelCode, widget.type, pageIndex, PAGE_SIZE);
      List<TravelItem> temp = [];
      data.resultList.forEach((item) {
        if (item.article != null) {
          temp.add(item);
        }
      });
      setState(() {
        travelItemList.addAll(temp);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Null> _handleRefresh() async {
    travelItemList = [];
    _loadDetailData();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: StaggeredGridView.countBuilder(
            controller: _scrollController,
            crossAxisCount: 4,
            itemCount: travelItemList.length,
            itemBuilder: (BuildContext context, int index) =>
                _travelItemCard(travelItemList[index], index),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
        ));
  }

  Widget _travelItemCard(TravelItem item, int index) {
    String poiName = item.article.pois == null || item.article.pois.length == 0
        ? '未知'
        : item.article.pois[0]?.poiName ?? '未知';
    return GestureDetector(
      onTap: () {
        if (item.article.urls != null && item.article.urls.length > 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return WebviewScaffold(
              url: item.article.urls[0].h5Url,
              appBar: AppBar(
                title: Text('详情'),
              ),
            );
          }));
        }
      },
      child: Container(
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
                            poiName,
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
      )),
    );
  }
}

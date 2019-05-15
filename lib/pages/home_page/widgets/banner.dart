import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/model/common_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyBanner extends StatelessWidget {
  final List<CommonModel> bannerList;

  MyBanner({
    Key key,
    @required this.bannerList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            imageUrl: bannerList[index].icon,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        },
        pagination: SwiperPagination(),
        onTap: (index) {
          Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return WebviewScaffold(
                url: bannerList[index].url,
                hidden: true,
                appBar: AppBar(
                  title: Text(bannerList[index].title ?? ''),
                ),
              );
            })
          );
        },
      ),
    );
  }
}

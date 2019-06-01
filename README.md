# Flutter_CTRIP

学习了Flutter之后，自己尝试着做了一个携程小demo，大家一起参考学习，我的目录写的还是挺清晰的，想看什么功能直接去找就可以了，喜欢的小伙伴记得star哦

## 目录

- [下载](#下载)
- [真机预览](#真机预览)
- [功能与特性](#功能与特性)
- [插件使用](#插件使用)
- [运行调试](#运行调试)
- [ToDo](#ToDo)

## 下载

![Flutter_Trip](<https://raw.githubusercontent.com/wkl007/flutter_trip/master/screenshot/flutter_trip_two_code.png>)

## APP效果图

![Flutter_Trip](https://raw.githubusercontent.com/cylhah/Flutter-CTRIP/master/preview/preview.jpg)

## 功能与特性

- 实现首页、搜索、语音搜索、旅拍、我的5个页面；
- 实现数据接口封装以及数据模型model创建；
- 首页实现ClipPath剪裁、导航条与状态栏控制；
- 搜索界面实现携程接口调用、关键词高亮显示；
- 语音搜索界面实现百度语音sdk集成、简单波纹动画实现；
- 旅拍界面实现瀑布流布局、并使用本地图片站位；
- 我的界面使用shared_preferences实现简单用户信息存储；

## 插件使用

- [cached_network_image ^0.8.0](https://pub.dev/packages/cached_network_image)
- [flutter_swiper ^1.1.6](https://pub.dev/packages/flutter_swiper)
- [flutter_staggered_grid_view ^0.2.7](https://pub.dev/packages/flutter_staggered_grid_view)
- [flutter_webview_plugin ^0.3.5](https://pub.dev/packages/flutter_webview_plugin)
- [dio: ^2.1.3](https://pub.dev/packages/dio)
- [shared_preferences: ^0.5.2](https://pub.dev/packages/shared_preferences)

## 运行调试

1. 准备Flutter环境,可参考: [getting-started](<https://flutter-io.cn/docs/get-started/install>)。
2. Clone [flutter_trip](https://github.com/wkl007/flutter_trip.git) ,然后终端进入项目根目录。
3. 终端运行 `flutter packages get`。
4. 然后运行 `flutter run`。

## ToDo

1. 实现城市选择相关页面
2. 添加定位功能。
3. 用 [dio](https://pub.flutter-io.cn/packages/dio) 替换 [http](https://pub.flutter-io.cn/packages/http) 库
4. 用官方 [webview_flutter](https://pub.flutter-io.cn/packages/webview_flutter) 插件替换 [flutter_webview_plugin](https://pub.flutter-io.cn/packages/flutter_webview_plugin)


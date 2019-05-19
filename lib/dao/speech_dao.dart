import 'dart:async';
import 'package:demo/model/home_model.dart';
import 'package:dio/dio.dart';

const SPEECH_URL = 'http://vop.baidu.com/server_api';
const TOKEN = '24.b3007729b4b98b72e0ffaa8908dbb218.2592000.1560677172.282335-16276124';
const params = {
  'format': 'pcm',
  'rate': 16000,
  'channel': 1,
  'cuid': 'B0-25-AA-19-F8-F6',
  'token': TOKEN,
  'speech': ''
};

///首页接口
class HomeDao {
  static Future<HomeModel> fetch() async {
    Response response = await Dio().post(SPEECH_URL, data: params);
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load home_page data');
    }
  }
}

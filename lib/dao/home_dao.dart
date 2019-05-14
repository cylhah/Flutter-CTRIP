import 'dart:async';
import 'package:demo/model/home_model.dart';
import 'package:dio/dio.dart';

const HOME_URL = 'https://www.easy-mock.com/mock/5cd0e696d61cdd20981096eb/api/homePage';

///首页接口
class HomeDao {
  static Future<HomeModel> fetch() async {
    Response response = await Dio().get(HOME_URL);
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load home_page data');
    }
  }
}

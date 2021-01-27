import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio dio;

  DioHelper() {
    dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/'));
  }

  static Future<Response> getHeadLines({@required String path}) async {
    return await dio.get(path, queryParameters: {
      'country': 'eg',
      'apiKey': '2f89fcd3e0214937853f64711ef5bfb6',
    }).catchError((error){
      print(error.message);
    });
  }
  static Future<Response> getSingleCategory({@required String path,@required category}) async {
    return await dio.get(path, queryParameters: {
      'country': 'eg',
      'category':category,
      'apiKey': '2f89fcd3e0214937853f64711ef5bfb6',

    }).catchError((error){
      print(error.message);
    });
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:helloworld/core/model/old/home_model.dart';
import 'config.dart';

class HomeRequest{
  static Future<List<MovieItem>> requestMovieList(int start) async{
    // 1.构建URL
    // final movieUrl = "/movie/top250?start=$start&count=${HomeConfig.movieCount}";
    // 2.发送网络请求获取结果
    // final result = await HttpRequest.request(movieUrl);
    String jsonString = await rootBundle.loadString("assets/jsonData/home_list.json");
    final jsonResult = json.decode(jsonString);
    final result = jsonResult;
    final subjects = result["subjects"];
    // print(subjects);
    // 3.面向对象 我们需要将Map数据转成 Model
    List<MovieItem> movies = [];
    for(var sub in subjects){
      movies.add(MovieItem.fromMap(sub));
    }
    //将我们的数据返回出去
    return movies;
  }
}
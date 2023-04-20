import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:helloworld/core/model/category_model.dart';
import 'package:helloworld/core/model/meal_model.dart';

class JsonParse{
  static Future<List<HYCategoryModel>> getCategoryData() async{
    // 1: 加载json文件
    final jsonString = await rootBundle.loadString("assets/jsonData/category.json");
    // 2: 将jsonString转为 Map/List
    final result = json.decode(jsonString);
    // 3: 将Map中的内容转为一个一个对象
    final resultList = result["category"];
    List<HYCategoryModel> categories = [];
    for(var json in resultList){
      categories.add(HYCategoryModel.fromJson(json));
    }
    return categories;
  }

  static Future<List<HYMealModel>> getMealData() async{
    // 1: 加载json文件
    final jsonString = await rootBundle.loadString("assets/jsonData/meal.json");
    // 2: 将jsonString转为 Map/List
    final result = json.decode(jsonString);
    // 3: 将Map中的内容转为一个一个对象
    final mealArray = result["meal"];
    List<HYMealModel> meals = [];
    for(var json in mealArray){
      meals.add(HYMealModel.fromJson(json));
    }
    return meals;
  }
}
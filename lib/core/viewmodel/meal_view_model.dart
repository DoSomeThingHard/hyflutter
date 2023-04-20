import 'package:flutter/material.dart';
import 'package:helloworld/core/service/json_parse.dart';
import 'package:helloworld/core/viewmodel/base_view_model.dart';
import 'package:helloworld/core/viewmodel/filter_view_model.dart';
import '../model/meal_model.dart';

class HYMealViewModel extends BaseMealViewModel {
  HYMealViewModel() {
    JsonParse.getMealData().then((res) {
      meals = res;
    });
  }
}

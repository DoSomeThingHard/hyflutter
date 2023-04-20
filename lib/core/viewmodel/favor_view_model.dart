import 'package:flutter/material.dart';
import 'package:helloworld/core/viewmodel/base_view_model.dart';
import 'filter_view_model.dart';

import '../model/meal_model.dart';

class HYFavorViewModel extends BaseMealViewModel {
  // 添加收藏
  void addMeal(HYMealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  // 取消收藏
  void removeMeal(HYMealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  // 处理meal对象 关于是否收藏
  void handleMeal(HYMealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

  // 判断是否已经收藏
  bool isFavor(HYMealModel meal) => originMeals.contains(meal);
}

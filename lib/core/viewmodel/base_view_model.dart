import 'package:flutter/material.dart';

import '../model/meal_model.dart';
import 'filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<HYMealModel> _meals = []; // 私有变量外面无法访问

  late HYFilterViewModel _filterVM;

  void updateFilters(HYFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();    // 数据改变刷新
  }

  List<HYMealModel> get meals {
    // 我们使用get方法 访问_meals的数据
    return _meals.where((meal) {
      //  过滤
      if (_filterVM.isGlutenFree && meal.isGlutenFree == false) return false;
      if (_filterVM.isLactoseFree && meal.isLactoseFree == false) return false;
      if (_filterVM.isVegan && meal.isVegan == false) return false;
      if (_filterVM.isVegetarian && meal.isVegetarian == false) return false;
      return true;
    }).toList();
  }

  List<HYMealModel> get originMeals {
    return _meals;
  }

  set meals(List<HYMealModel> value) {
    _meals = value;
    notifyListeners();    // 数据改变刷新
  }
}

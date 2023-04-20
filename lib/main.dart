import 'package:flutter/material.dart';
import 'package:helloworld/core/viewmodel/favor_view_model.dart';
import 'package:helloworld/core/viewmodel/filter_view_model.dart';
import 'package:helloworld/core/viewmodel/meal_view_model.dart';
import 'package:helloworld/core/viewmodel/old/counter_view_model.dart';
import 'package:provider/provider.dart';
import 'package:event_bus/event_bus.dart';

import 'package:helloworld/app.dart';

// 创建全局的EventBus对象
final eventBus = EventBus();
// 1： runApp 函数   是在我们的 material 这个库里面
main() {
  runApp(
    MultiProvider(
      providers: [
        // 初始化是懒加载的
        ChangeNotifierProvider<HYFilterViewModel>(create: (context) => HYFilterViewModel()),
        // ChangeNotifierProvider(create: (context) => HYMealViewModel()),
        ChangeNotifierProxyProvider<HYFilterViewModel, HYMealViewModel>(
          create: (context) => HYMealViewModel(),
          update: (context, filterVM, mealVM) {
            mealVM?.updateFilters(filterVM);
            return mealVM!;
          },
        ),
        // ChangeNotifierProvider(create: (context) => HYFavorViewModel()),
        ChangeNotifierProxyProvider<HYFilterViewModel, HYFavorViewModel>(
          create: (context) => HYFavorViewModel(),
          update: (context, filterVM, favorVM) {
            favorVM?.updateFilters(filterVM);
            return favorVM!;
          },
        ),
      ],
      child: const MyApp(),
    ),

    //   ChangeNotifierProvider( // 状态管理
    //     // create: (context) => HYCountViewModel(),
    //     create: (context) => HYMealViewModel(), // 这里其实是一个懒加载，不会一开始就加载。
    //     child: const MyApp(),
    //   ),
  );
}

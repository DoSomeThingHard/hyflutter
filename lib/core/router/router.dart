import 'package:flutter/material.dart';
import 'package:helloworld/ui/pages/filter/filter.dart';
import 'package:helloworld/ui/pages/filter/filter_content.dart';
import 'package:helloworld/ui/pages/home/old/home.dart';
import 'package:helloworld/ui/pages/main/main_screen.dart';
import 'package:helloworld/ui/pages/meal/meal.dart';
import '../../ui/pages/detail/detail.dart';
import "../../ui/pages/home/old/animation/animation.dart";

class MyRouter {
  static const String initialRoute = HYMainScreen.routeName;
  // 这里是不加参数的
  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routeName: (ctx) => const HYMainScreen(),
    HYMealScreen.routeName: (ctx) => const HYMealScreen(),
    HYDetailScreen.routeName: (ctx) => const HYDetailScreen()
    // HYHomePage.routeName : (ctx) => const HYHomePage(),
    // HYAnimationPage.routeName : (ctx) => HYAnimationPage()
  };
  // 这里是可以修改页面 push样式的 可以实现present的出现样式
  static RouteFactory generateRoute = (setting) {
    if (setting.name == HYFilterScreen.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          return const HYFilterScreen();
        },
        fullscreenDialog: true,
      );
    }
    return null;
  };
  // 这里是错误的页面
  static RouteFactory unknownRoute = (setting) {
    return null;
  };
}

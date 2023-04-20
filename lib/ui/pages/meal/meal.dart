import 'package:flutter/material.dart';
import 'package:helloworld/core/model/category_model.dart';
import 'package:helloworld/ui/pages/meal/meal_content.dart';

class HYMealScreen extends StatelessWidget {
  static const String routeName = "/meal";
  const HYMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取传递过来的参数
    final category = ModalRoute.of(context)?.settings.arguments as HYCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title ?? "标题"),
      ),
      body: HYMealContent(category),
    );
  }
}

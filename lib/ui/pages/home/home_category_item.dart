import 'package:flutter/material.dart';
import 'package:helloworld/core/extension/int_extension.dart';
import 'package:helloworld/core/model/category_model.dart';
import 'package:helloworld/ui/pages/meal/meal.dart';

class HYHomeCategoryItem extends StatelessWidget {
  final HYCategoryModel _category;
  const HYHomeCategoryItem(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.cColor!;
    return GestureDetector( // 由于Container本身是没有点击事件的 我们给他包裹一个
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.px),
          gradient: LinearGradient(colors: [bgColor.withOpacity(.5), bgColor]), // 渐变
        ),
        alignment: Alignment.center,
        child: Text(_category.title ?? "",
            style: Theme.of(context).textTheme.displayMedium),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(HYMealScreen.routeName, arguments:_category);
      },
    );
  }
}

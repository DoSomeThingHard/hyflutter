import 'package:flutter/material.dart';
import 'package:helloworld/core/extension/double_extension.dart';
import 'package:helloworld/core/model/meal_model.dart';

class HYDetailContent extends StatelessWidget {
  final HYMealModel _meal;
  const HYDetailContent(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // 滚动
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle(context, "步骤"),
          buildMakeSteps(context),
        ],
      ),
    );
  }

  // 1：顶部的横幅图片
  Widget buildBannerImage() {
    return SizedBox(
      width: double.infinity,
      child: Image.network(_meal.imageUrl),
    );
  }

  // 2：制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildContentList(
      context: context,
      child: ListView.builder(
        shrinkWrap: true, // 范围内进行包裹  底部会默认多出来一些内边距 我们去掉就行了
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.amber,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.px, vertical: 5.0.px),
              child: Text(_meal.ingredients[index]),
            ),
          );
        },
      ),
    );
  }

  // 3：制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildContentList(
      context: context,
      child: ListView.separated(
        shrinkWrap: true, // 范围内进行包裹  底部会默认多出来一些内边距 我们去掉就行了
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _meal.steps.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text("#$index"),
            ),
            title: Text(_meal.steps[index]),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }

  // 公共的方法
  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0.px),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContentList({required BuildContext context, required Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width - 30.0.px,
      padding: EdgeInsets.all(8.0.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0.px),
      ),
      child: child,
    );
  }
}

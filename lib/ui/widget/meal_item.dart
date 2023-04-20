import 'package:flutter/material.dart';
import 'package:helloworld/core/extension/double_extension.dart';
import 'package:helloworld/core/extension/int_extension.dart';
import 'package:helloworld/core/model/meal_model.dart';
import 'package:helloworld/core/viewmodel/favor_view_model.dart';
import 'package:helloworld/ui/pages/detail/detail.dart';
import 'package:helloworld/ui/widget/opeartion_item.dart';
import 'package:provider/provider.dart';

final borderRadius = 12.0.px;

class HYMealItem extends StatelessWidget {
  final HYMealModel _meal;
  const HYMealItem(this._meal, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(HYDetailScreen.routeName, arguments: _meal);
      },
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5, // 阴性
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            buildBasicInfo(context), // 基础信息
            buildOperation(), // 下面的操作栏
          ],
        ),
      ),
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
          child: Image.network(
            _meal.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0.px,
          ),
        ),
        Positioned(
          right: 10.0.px,
          bottom: 10.0.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.0.px),
            ),
            child: Text(
              _meal.title,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget buildOperation() {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0.px, 0.px, 8.0.px, 0.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HYOperationItem(const Icon(Icons.schedule), "${_meal.duration}min"),
          HYOperationItem(const Icon(Icons.restaurant), _meal.complexityTitle),
          buildFavorItem(),
        ],
      ),
    );
  }

  Widget buildFavorItem() {
    return Consumer<HYFavorViewModel>(
      builder: (context, favorVM, child) {
        final isFavor = favorVM.isFavor(_meal);
        final iconData = isFavor ? Icons.favorite : Icons.favorite_border;
        final favorColor = isFavor ? Colors.red : Colors.black;
        final title = isFavor ? "收藏" : "未收藏";
        return GestureDetector(
          child: HYOperationItem(Icon(iconData, color: favorColor), title, textColor: favorColor,),
          onTap: () {
            favorVM.handleMeal(_meal);
          },
        );
      },
    );
  }
}

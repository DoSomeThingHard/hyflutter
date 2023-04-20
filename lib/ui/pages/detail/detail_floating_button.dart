import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/model/meal_model.dart';
import '../../../core/viewmodel/favor_view_model.dart';

class HYDetailFloatingButton extends StatelessWidget {
  const HYDetailFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as HYMealModel;
    return Theme(
      data: Theme.of(context)
          .copyWith(colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.amber)),
      child: Consumer<HYFavorViewModel>(
        builder: (context, favorVM, child) {
          // 判断是否已经收藏
          final isFavor = favorVM.isFavor(meal);
          final IconData iconData = isFavor ? Icons.favorite : Icons.favorite_border;
          final iconColor = isFavor ? Colors.red : Colors.black;
          return FloatingActionButton(
            child: Icon(iconData, color: iconColor),
            onPressed: () {
              favorVM.handleMeal(meal);
            },
          );
        },
      ),
    );
  }
}

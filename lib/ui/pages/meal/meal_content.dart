import 'package:flutter/material.dart';
import 'package:helloworld/core/model/meal_model.dart';
import 'package:helloworld/core/viewmodel/meal_view_model.dart';
import 'package:helloworld/ui/widget/meal_item.dart';
import 'package:provider/provider.dart';
import '../../../core/model/category_model.dart';
import 'package:collection/collection.dart';

// class HYMealContent extends StatelessWidget {
//   final HYCategoryModel category; // 传过来或者重新拿都行
//   const HYMealContent(this.category, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // 这里存在问题 就是数据改变这里会全部build，性能不好 我们使用Selector来代替这个。
//     // 重新拿一次，这里都是从顶层路由获取数据的
//     // final category = ModalRoute.of(context)?.settings.arguments as HYCategoryModel;
//     return Consumer<HYMealViewModel>(
//       builder: (context, mealVM, child) {
//         // 这个where 就相当于是 Vue里面的filter 不改变原数组返回新数组（Iterable，需要.toList()），根据条件。
//         final meals = mealVM.meals.where((meal) => meal.categories.contains(category.id)).toList();
//         return ListView.builder(
//           itemCount: meals.length,
//           itemBuilder: (context, index) {
//             final itemModel = meals[index];
//             return ListTile(title: Text(itemModel.title),);
//           },
//         );
//       },
//       child: Text("ss"),
//     );
//   }
// }

class HYMealContent extends StatelessWidget {
  final HYCategoryModel category; // 传过来或者重新拿都行
  const HYMealContent(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HYMealViewModel, List<HYMealModel>>(
      shouldRebuild: (prev, next){
        // 我们需要判断两个数组里面的东西是否相同, 相同就返回false。
        return !(const ListEquality().equals(prev, next));
      },  // 是否重新build prev和next都是List<HYMealModel>>类型
      builder: (context, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final itemModel = meals[index];
            return HYMealItem(itemModel);
          },
        );
      },
      selector: (context, mealVM) { // 专门做过滤的
        return mealVM.meals.where((meal) => meal.categories.contains(category.id)).toList();
      }
    );
  }
}

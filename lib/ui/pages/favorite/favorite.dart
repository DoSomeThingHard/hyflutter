import 'package:flutter/material.dart';
import 'package:helloworld/core/model/meal_model.dart';
import 'package:helloworld/core/viewmodel/favor_view_model.dart';
import 'package:provider/provider.dart';

import '../../widget/meal_item.dart';

class HYFavoriteScreen extends StatelessWidget {
  const HYFavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("收藏"),
      ),
      body: Consumer<HYFavorViewModel>(
        builder: (context, favorVM, child) {
          if(favorVM.meals.isEmpty){
            return const Center(
              child: Text("未收藏美食"),
            );
          }
          return ListView.builder(
            itemCount: favorVM.meals.length,
            itemBuilder: (itemContext, index) {
              return HYMealItem(favorVM.meals[index]);
            },
          );
        },
      ),
    );
  }
}

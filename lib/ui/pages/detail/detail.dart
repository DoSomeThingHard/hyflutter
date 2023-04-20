import 'package:flutter/material.dart';
import 'package:helloworld/core/model/meal_model.dart';
import 'package:helloworld/core/viewmodel/favor_view_model.dart';
import 'package:helloworld/ui/pages/detail/detail_floating_button.dart';
import 'package:helloworld/ui/pages/favorite/favorite.dart';
import 'package:provider/provider.dart';

import 'detail_content.dart';

class HYDetailScreen extends StatelessWidget {
  static const String routeName = "/detail";
  const HYDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as HYMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: HYDetailContent(meal),
      floatingActionButton: const HYDetailFloatingButton(),
    );
  }
}

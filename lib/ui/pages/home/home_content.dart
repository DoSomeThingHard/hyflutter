import 'package:flutter/material.dart';
import 'package:helloworld/core/extension/int_extension.dart';
import 'package:helloworld/core/service/json_parse.dart';
import 'package:helloworld/ui/pages/home/home_category_item.dart';

import '../../../core/model/category_model.dart';

class HYHomeScreenContent extends StatelessWidget {
  const HYHomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HYCategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.error != null) return const Center(child: Text("请求失败"),);
        final categories = snapshot.data ?? [];
        return GridView.builder(
          padding: EdgeInsets.all(20.px),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.px,
            mainAxisSpacing: 20.px,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (ctx, index) {
            return HYHomeCategoryItem(categories[index]);
          },
        );
      },
    );
  }
}

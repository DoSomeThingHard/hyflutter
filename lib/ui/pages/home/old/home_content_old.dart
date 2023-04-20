import 'package:flutter/material.dart';
import 'package:helloworld/core/extension/int_extension.dart';
import 'package:helloworld/core/service/json_parse.dart';
import 'package:helloworld/ui/pages/home/home_category_item.dart';

import '../../../../core/model/category_model.dart';

class HYHomeScreenContentOld extends StatefulWidget {
  const HYHomeScreenContentOld({Key? key}) : super(key: key);

  @override
  State<HYHomeScreenContentOld> createState() => _HYHomeScreenContentState();
}

class _HYHomeScreenContentState extends State<HYHomeScreenContentOld> {
  List<HYCategoryModel> _categories = [];
  @override
  void initState() {
    super.initState();
    JsonParse.getCategoryData().then((res) {
      setState(() {
        _categories = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20.px),
      itemCount: _categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.px,
        mainAxisSpacing: 20.px,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (ctx, index) {
        return HYHomeCategoryItem(_categories[index]);
      },
    );
  }
}

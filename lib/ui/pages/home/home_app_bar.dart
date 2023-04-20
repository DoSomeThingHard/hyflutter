import 'package:flutter/material.dart';

class HYHomeAppBar extends AppBar {
  HYHomeAppBar({Key? key})
      : super(
          key: key,
          title: const Text("美食广场"),
          // leading: const Icon(Icons.add),  // 这样会导致抽屉弹不出
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  // 我们需要获取Scaffold的context，如果不包裹Builder，我们获取的 context是属于build的
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.add),
              );
            },
          ),
        );
}

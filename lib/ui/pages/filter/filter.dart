import 'package:flutter/material.dart';
import 'package:helloworld/ui/pages/filter/filter_content.dart';
class HYFilterScreen extends StatelessWidget {
  static const String  routeName = "/filter";
  const HYFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("美食过滤"),
      ),
      body: const HYFilterContent(),
    );
  }
}

import 'package:flutter/material.dart';
import 'home_content.dart';

class HYHomePage extends StatelessWidget {
  static const String routeName = "/home";
  const HYHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: const HYHomeContent(),
    );
  }
}

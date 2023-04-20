import 'package:flutter/material.dart';
import '../home/home_drawer.dart';
import 'initialize_items.dart';

class HYMainScreen extends StatefulWidget {
  static const String routeName = '/';
  const HYMainScreen({Key? key}) : super(key: key);
  @override
  State<HYMainScreen> createState() => _HYMainScreenState();
}

class _HYMainScreenState extends State<HYMainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HYHomeDrawer(), // 会让首页导航栏多了一个 抽屉的图标
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

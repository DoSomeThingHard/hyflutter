import 'package:flutter/material.dart';
import 'pages.dart';
import 'bottom_bar_item.dart';

class HYMainPage extends StatefulWidget {
  const HYMainPage({Key? key}) : super(key: key);
  @override
  State<HYMainPage> createState() => _HYMainPageState();
}

class _HYMainPageState extends State<HYMainPage> {
  int _currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex, // 选中的
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _currentIndex,
        // 主要用于设置item及字体颜色  如果不设置 会跟随主题的颜色
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.green,
        // 主要用于设置icon颜色,作用优先于unselectedItemColor
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        selectedIconTheme: const IconThemeData(color: Colors.green),
        // 有设置主题与selectedItemColor时,颜色无作用
        // selectedFontSize 和 unselectedFontSize 是选中的大小和未选中的大小
        selectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 12),
        unselectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 12),
        // 图标的大小
        iconSize: 23,
        // 超过三个必须设置，否则无法显示出来
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


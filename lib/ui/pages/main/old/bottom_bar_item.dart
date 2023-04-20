
import 'package:flutter/material.dart';

class HYBottomBarItem extends BottomNavigationBarItem{
  HYBottomBarItem(IconData iconData, String title) : super(
    label: title,
    // 这里使用的一般都是图片 我们demo没有图片就使用 Icon代替
    icon: Icon(iconData),
    activeIcon: Icon(iconData),
  );
  // 图片的使用范例
  // HYBottomBarItem(String iconName, String title) : super(
  //   label: title,
  //   // 这里使用的一般都是图片 我们demo没有图片就使用 Icon代替
  //   icon: Image.asset('asset/images/tabbar/$iconName.png', width: 32, gaplessPlayback: true,),
  //   activeIcon: Image.asset('asset/images/tabbar/${iconName}_active.png', width: 32, gaplessPlayback: true),
  // );
}

// 返回tabbar的底部内容
List<HYBottomBarItem> items = [
  // BottomNavigationBarItem(icon: Icon(Icons.people),label:"我的"),
  // BottomNavigationBarItem(icon: Icon(Icons.people),label:"我的"),
  // BottomNavigationBarItem(icon: Icon(Icons.people),label:"我的"),
  HYBottomBarItem(Icons.home,"首页"),
  HYBottomBarItem(Icons.book,"书影音"),
  HYBottomBarItem(Icons.group,"小组"),
  HYBottomBarItem(Icons.palette_rounded,"诗集"),
  HYBottomBarItem(Icons.person_outline,"我的"),
];
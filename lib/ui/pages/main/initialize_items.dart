import 'package:flutter/material.dart';
import 'package:helloworld/ui/pages/favorite/favorite.dart';
import 'package:helloworld/ui/pages/home/home_screen.dart';

final List<Widget> pages = [
  const HYHomeScreen(),
  const HYFavoriteScreen(),
];
final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
  const BottomNavigationBarItem(label: "收藏", icon: Icon(Icons.star)),
];

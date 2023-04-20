import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HYGroupContent extends StatefulWidget {
  const HYGroupContent({Key? key}) : super(key: key);
  @override
  State<HYGroupContent> createState() => _HYGroupContentState();
}

class _HYGroupContentState extends State<HYGroupContent> {
  List<String> names = ["aaa", "bbb", "ccc"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Key"),
      ),
      body: ListView(
        children: names.map((item) {
          return ListItemLess(item,key: ValueKey(item),);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "group",
        child: const Icon(Icons.delete),
        onPressed: () {
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

class ListItemLess extends StatefulWidget {
  final String name;
  const ListItemLess(this.name, {super.key});
  @override
  State<ListItemLess> createState() => _ListItemLessState();
}

class _ListItemLessState extends State<ListItemLess> {
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: randomColor,
      child: Text(widget.name),
    );
  }
}

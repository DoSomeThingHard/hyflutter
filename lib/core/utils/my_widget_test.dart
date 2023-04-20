import 'package:flutter/material.dart';

class HYKeywords extends StatelessWidget {
  final List<String> keywords;
  const HYKeywords(this.keywords, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: keywords.map((key) {
          return ListTile(
            leading: const Icon(Icons.people),
            title: Text(key),
          );
        }).toList(),
      ),
    );
  }
}
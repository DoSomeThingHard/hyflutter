import 'package:flutter_test/flutter_test.dart';
import 'package:helloworld/core/utils/my_widget_test.dart';
import 'package:flutter/material.dart';

void main(){
  testWidgets("Test Contacts Widget", (WidgetTester tester) async {
    // 注入widget 替代 runapp
    await tester.pumpWidget(const MaterialApp(home: HYKeywords(["1","1","cba","abc"])));
    // 在 HYKeywords 中查找widget/文本
    final abcText = find.text("abc");
    final cbaText = find.text("cba");
    final cba1Text = find.text("cba1");
    final icons = find.byIcon(Icons.people);
    // 期望
    expect(abcText, findsOneWidget);  // 看看能找到几个
    expect(cbaText, findsOneWidget);  // 看看能找到几个
    expect(cba1Text, findsNothing);  // 看看能找到几个
    expect(icons, findsNWidgets(4));  // 看看能找到几个
  });
}
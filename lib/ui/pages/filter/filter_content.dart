import 'package:flutter/material.dart';
import 'package:helloworld/core/extension/int_extension.dart';
import 'package:helloworld/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';

class HYFilterContent extends StatelessWidget {
  const HYFilterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildChoiceTitle(context), buildChoiceSelect()],
    );
  }

  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text(
        "展示你的选择",
        style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget buildChoiceSelect() {
    return Expanded(
      child: Consumer<HYFilterViewModel>(
        builder: (context, filterVM, child) {
          return ListView(
            children: [
              buildListTile("无谷蛋白", "无谷蛋白的描述", filterVM.isGlutenFree,(value) {
                filterVM.isGlutenFree = value;
              }),
              buildListTile("不含乳糖", "不含乳糖", filterVM.isLactoseFree,(value) {
                filterVM.isLactoseFree = value;
              }),
              buildListTile("素食主义", "素食主义", filterVM.isVegan,(value) {
                filterVM.isVegan = value;
              }),
              buildListTile("严格素食主义", "严格素食主义", filterVM.isVegetarian,(value) {
                filterVM.isVegetarian = value;
              }),
            ],
          );
        },
      ),
    );
  }

  Widget buildListTile(String title, String subtitle, bool value, void Function(bool)? onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: onChange,
      ),
    );
  }
}

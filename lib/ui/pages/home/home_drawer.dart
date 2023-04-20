import 'package:flutter/material.dart';
import 'package:helloworld/core/extension/int_extension.dart';
import 'package:helloworld/ui/pages/filter/filter.dart';

class HYHomeDrawer extends StatelessWidget {
  const HYHomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.px,
      child: Drawer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text(
              "开始动手",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 20.px),
            child: Column(
              children: [
                buildListTile(context, const Icon(Icons.restaurant), "进餐", () {
                  // Scaffold.of(context).closeDrawer();
                  Navigator.of(context).pop();
                }),
                buildListTile(context, const Icon(Icons.settings), "过滤", () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(HYFilterScreen.routeName);
                  // showDialog(context: context, builder: (context){
                  //   return const Text("ss");
                  // });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListTile(BuildContext context, Widget icon, String title, void Function()? handler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      onTap: handler,
    );
  }
}

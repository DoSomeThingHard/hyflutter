import 'package:flutter/material.dart';
import 'package:helloworld/core/extension/int_extension.dart';
import 'package:helloworld/core/i18n/localizations.dart';
import 'package:helloworld/ui/pages/home/home_drawer.dart';
import '../../../generated/l10n.dart';
import 'home_app_bar.dart';
import 'home_content.dart';

class HYHomeScreen extends StatelessWidget {
  const HYHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HYHomeAppBar(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // 我们需要获取Scaffold的context，如果不包裹Builder，我们获取的 context是属于build的
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.add),
        ),
      ),
      body: const HYHomeScreenContent(),
      floatingActionButton: FloatingActionButton(
        // child: Text(HYLocalizations.of(context).title),
        child: Text(S.of(context).title),
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2024),
          );
        },
      ),
    );
  }
}

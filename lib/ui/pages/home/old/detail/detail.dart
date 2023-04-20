import 'package:flutter/material.dart';

class HYDetailPage extends StatelessWidget {
  const HYDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop("详情带回来的");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("详情页"),
        ),
        body: Column(
          children: [
            const Text("body"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop("详情带回来的");
              },
              child: const Text("返回"),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HYImageDetailPage extends StatelessWidget {
  final String _imgURL;
  const HYImageDetailPage(this._imgURL, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      // data: ThemeData(
      //     primaryColor: Colors.red
      // ),
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              //要修改哪些参数，直接在这里修改，覆盖之前的设置
              primary: Colors.lime, secondary: Colors.red,
            ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("详情"),
          // backgroundColor: Colors.red,
        ),
        floatingActionButton:
            FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
        body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Center(
            child: GestureDetector(
              child: Hero(tag: _imgURL, child: Image.network(_imgURL)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}

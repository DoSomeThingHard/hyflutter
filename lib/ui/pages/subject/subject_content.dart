import 'package:flutter/material.dart';
import 'package:helloworld/core/extension/double_extension.dart';
import 'package:helloworld/main.dart';
import 'package:helloworld/ui/pages/home/old/animation/animation.dart';

import '../home/old/detail/detail.dart';

class HYSubjectContent extends StatefulWidget {
  const HYSubjectContent({Key? key}) : super(key: key);

  @override
  State<HYSubjectContent> createState() => _HYSubjectContentState();
}

class _HYSubjectContentState extends State<HYSubjectContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("诗集"),
      ),
      body: Column(
        children: const [
          JumpButton()
          // HYButton(),
          // HYText()
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ()=>_jumpToDetail(context),
      //   child: const Text("跳转到详情"),
      // ),
    );
  }
}

class JumpButton extends StatefulWidget {
  const JumpButton({Key? key}) : super(key: key);

  @override
  State<JumpButton> createState() => _JumpButtonState();
}

class _JumpButtonState extends State<JumpButton> {
  String _context = "默认";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: ()=>_jumpToDetail(context), child: const Text("跳转到详情",)),
        ElevatedButton(onPressed: ()=>_jumpToAnimation(context), child: const Text("跳转到Animation")),
        Text(_context),
        Container(
          width: 200.0.px,
          height: 200,
          color: Colors.red,
        )
      ],
    );
  }

  void _jumpToAnimation(BuildContext context){
    Navigator.of(context).pushNamed(HYAnimationPage.routeName);
  }

  void _jumpToDetail(BuildContext context){
    final future = Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return const HYDetailPage();
      }),
    );
    future.then((res){
      setState((){
        _context = res;
      });
    });
  }
}


class MyEvent{
  String data;
  MyEvent(this.data);
}

class HYButton extends StatelessWidget {
  const HYButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      eventBus.fire(MyEvent("你好啊，李银河"));
    }, child: const Icon(Icons.add));
  }
}

class HYText extends StatefulWidget {
  const HYText({Key? key}) : super(key: key);

  @override
  State<HYText> createState() => _HYTextState();
}

class _HYTextState extends State<HYText> {
  String _message = "默认值";
  @override
  void initState() {
    super.initState();

    eventBus.on<MyEvent>().listen((event) {
      setState(() {
        _message = event.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message);
  }
}


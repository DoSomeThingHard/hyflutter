import 'package:flutter/material.dart';

class HYDataWidget extends InheritedWidget {
  final int? counter;
  // 构造方法
  const HYDataWidget({this.counter, super.key, required super.child});
  static HYDataWidget? of(BuildContext context) {
    // 沿着Element树，去找最近的HYCounterElement
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(HYDataWidget oldWidget) {
    // 根据返回的值来决定是否通知
    return counter != oldWidget.counter;
  }
}

class HYMallContent extends StatefulWidget {
  const HYMallContent({Key? key}) : super(key: key);
  @override
  State<HYMallContent> createState() => _HYMallContentState();
}

class _HYMallContentState extends State<HYMallContent> {
  int _counter = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("书影音"),
      ),
      body: HYDataWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              HTShowData01(),
              HTShowData02(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "mall",
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            if (_counter < 302) {
              _counter++;
            }
          });
        },
      ),
    );
  }
}

class HTShowData01 extends StatelessWidget {
  const HTShowData01({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int? counter = HYDataWidget.of(context)?.counter;
    return Container(
      color: Colors.red,
      child: Text(
        "当前数据 $counter",
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}

class HTShowData02 extends StatefulWidget {
  const HTShowData02({Key? key}) : super(key: key);
  @override
  State<HTShowData02> createState() => _HTShowData02State();
}

class _HTShowData02State extends State<HTShowData02> {
  // 当我们的widget依赖于inheritWidget 当inheritWidget里面的数据发生改变的时候会执行。
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    int? counter = HYDataWidget.of(context)?.counter;
    return Card(
      color: Colors.orange,
      child: Text(
        "当前数据 $counter",
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}

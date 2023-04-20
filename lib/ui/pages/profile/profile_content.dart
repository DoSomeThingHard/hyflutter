import 'package:flutter/material.dart';
import 'package:helloworld/core/viewmodel/old/counter_view_model.dart';
import 'package:provider/provider.dart';

class HYProfileContent extends StatefulWidget {
  const HYProfileContent({Key? key}) : super(key: key);

  @override
  State<HYProfileContent> createState() => _HYProfileContentState();
}

class _HYProfileContentState extends State<HYProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [HTShowData01(), HTShowData02()],
        ),
      ),
      floatingActionButton: Consumer<HYCountViewModel>(
        child: const Icon(Icons.add),
        builder: (context, counterVM, child) {
          return FloatingActionButton(
              heroTag: "profile",
              child: child,
              onPressed: () {
                counterVM.counter += 1;
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
    print("01");
    // 取出来
    return Container(
      color: Colors.red,
      child: Consumer<HYCountViewModel>(
        builder: (context, counterVM, child) {
          return FittedBox(
            child: Text(
              "当前数据 ${counterVM.counter}",
              style: const TextStyle(fontSize: 30),
            ),
          );
        },
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
    print("02");
    int counter = Provider.of<HYCountViewModel>(context).counter;
    return Card(
      color: Colors.orange,
      child: Text(
        "当前数据 $counter",
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}

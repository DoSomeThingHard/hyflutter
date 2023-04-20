import 'dart:math';

import 'package:flutter/material.dart';
import 'package:helloworld/ui/pages/home/old/animation/animation_detail.dart';

class HYAnimationPage extends StatelessWidget {
  final GlobalKey<AnimationDemo01State> animationKey = GlobalKey();

  static const String routeName = "/animation";

  HYAnimationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画'),
      ),
      // body: HYAnimationContent(
      //   key: animationKey,
      // ),
      // body: AnimationDemo01(
      //   key: animationKey,
      // ),
      body: Center(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16 / 9,
          ),
          children: List.generate(20, (index) {
            String imageURL = "https://picsum.photos/id/$index/400/200";
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,ani1,ani2){
                  return FadeTransition(opacity: ani1, child: HYImageDetailPage(imageURL));
                }));
              },
              child: Hero(
                tag: imageURL,
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          AnimationController? controller =
              animationKey.currentState?.controller;
          if (controller!.isAnimating) {
            controller.stop(); // 暂停
          } else if (controller.status == AnimationStatus.forward) {
            controller.forward();
          } else if (controller.status == AnimationStatus.reverse) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
      ),
    );
  }
}

class AnimationDemo01 extends StatefulWidget {
  const AnimationDemo01({required Key key}) : super(key: key);

  @override
  AnimationDemo01State createState() => AnimationDemo01State();
}

class AnimationDemo01State extends State<AnimationDemo01>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  late Animation<Color?> colorAnim;
  late Animation<double> sizeAnim;
  late Animation<double> rotationAnim;
  late Animation<double> opacityAnim;

  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // 2.动画添加Curve效果
    animation = CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn);
    // 3.监听动画
    // animation.addListener(() {
    //   setState(() {});
    // });

    // 4.设置值的变化
    colorAnim =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);
    sizeAnim = Tween(begin: 10.0, end: 200.0).animate(controller);
    opacityAnim = Tween(begin: 0.0, end: 1.0).animate(animation);
    rotationAnim = Tween(begin: 0.0, end: 2 * pi).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Opacity(
            opacity: opacityAnim.value,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(rotationAnim.value),
              child: Container(
                width: sizeAnim.value,
                height: sizeAnim.value,
                color: colorAnim.value,
                alignment: Alignment.center,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class HYAnimationContent extends StatefulWidget {
  const HYAnimationContent({Key? key}) : super(key: key);

  @override
  State<HYAnimationContent> createState() => HYAnimationContentState();
}

class HYAnimationContentState extends State<HYAnimationContent>
    with SingleTickerProviderStateMixin {
  // 1：创建AnimationController
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // 2：给动画设置Curve的值 什么都不设置直接使用的话会报错 因为Curve里面的跨度需要时 0~1的
    animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    // 3：使用 tween 进行包裹
    animation = Tween(begin: 50.0, end: 150.0).animate(animation);

    // // 2：添加监听让刷新
    // _controller.addListener(() {
    //   setState(() {});
    // });

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画完成
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 默认装改
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //     child: HYAnimatedIcon(animation),
    // );
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Icon(
            Icons.favorite,
            color: Colors.red,
            size: animation.value,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// class HYAnimatedIcon extends AnimatedWidget{
//   const HYAnimatedIcon(Animation animation,{super.key}): super(listenable: animation);
//   @override
//   Widget build(BuildContext context) {
//     Animation animation = listenable as Animation;
//     return Icon(
//           Icons.favorite,
//           color: Colors.red,
//           size: animation.value,
//         );
//   }
// }

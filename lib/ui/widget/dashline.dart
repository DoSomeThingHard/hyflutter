import 'package:flutter/material.dart';

class HYDashLine extends StatelessWidget {
  final Axis axis; //axis：确定虚线的方向；
  final double dashedWidth; // dashedWidth：根据虚线的方向确定自己虚线的宽度；
  final double dashedHeight; // dashedHeight：根据虚线的方向确定自己虚线的高度；
  final int count; // count：内部会根据设置的个数和宽高确定密度（虚线的空白间隔）；
  final Color color; // color：虚线的颜色，不多做解释；

  const HYDashLine(
      {this.axis = Axis.horizontal,
      this.dashedWidth = 1,
      this.dashedHeight = 1,
      this.count = 10,
      this.color = Colors.black,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 用不上的字段可以使用 _ 来替代 否则写了不用要报错
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (_) {
        return SizedBox(
          width: dashedWidth,
          height: dashedHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}

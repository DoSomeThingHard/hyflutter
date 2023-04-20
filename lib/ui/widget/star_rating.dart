import 'package:flutter/material.dart';

// 星星组件 满分是10分
class HYStarRating extends StatefulWidget {
  final double rating; // 当前分值
  final double maxRating; // 满分的分值
  final int count; // 几颗星
  final double size; // 星星的大小
  final Color unSelectedColor; // 未选中的颜色
  final Color selectedColor; // 选中的颜色
  final Widget unSelectedImage;  // 未选中的图片
  final Widget selectedImage;  // 选中的图片
  HYStarRating({
    required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unSelectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget? unSelectedImage,
    Widget? selectedImage,
    Key? key,
  }) : selectedImage = selectedImage != null ? SizedBox(width: size, height: size,child: selectedImage,) : Icon(Icons.star, color: selectedColor, size: size,),
        unSelectedImage =  unSelectedImage != null ? SizedBox(width: size, height: size,child: unSelectedImage,) : Icon(Icons.star_border, color: unSelectedColor, size: size,),
        super(key: key);
  @override
  State<HYStarRating> createState() => _HYStarRatingState();
}

class _HYStarRatingState extends State<HYStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: buildUnSelectedStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStar()),
      ],
    );
  }

  // 创建未选中的星星
  List<Widget> buildUnSelectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unSelectedImage;
    });
  }

  // 创建选中的星星
  List<Widget> buildSelectedStar() {
    // 创建返回数组，我们下面创建的星星全都放到这个数组进行返回
    List<Widget> stars = [];
    double rating = widget.rating > widget.maxRating ? widget.maxRating : widget.rating;
    // 创建满填充的星星
    double oneValue = widget.maxRating / widget.count;
    // 向下取整
    int entireCount = (rating / oneValue).floor();
    final star = widget.selectedImage;
    List<Widget> fullStar = List.generate(entireCount, (index) {
      return star;
    });
    // 将满的星星加进去
    stars.addAll(fullStar);
    //创建不满的星星 加入数组
    double leftWidth = (rating / oneValue - entireCount) * widget.size;
    stars.add(
      ClipRect(
        clipper: HYStarClipper(leftWidth),
        child: star,
      ),
    );
    return stars;
  }
}

class HYStarClipper extends CustomClipper<Rect>{
  double width;
  HYStarClipper(this.width);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }
  @override
  bool shouldReclip(covariant HYStarClipper oldClipper) {
    // 如果新的和旧的相等 就不重新裁剪了
    return oldClipper.width != width;
  }
}
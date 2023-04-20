import 'package:flutter/material.dart';
import 'package:helloworld/ui/widget/dashline.dart';
import 'package:helloworld/ui/widget/star_rating.dart';
import 'package:helloworld/core/model/old/home_model.dart';

class HYHomeMovieItem extends StatelessWidget {
  final MovieItem movie;
  const HYHomeMovieItem(this.movie, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        // 最下面的边框
        border: Border(
          bottom: BorderSide(width: 8, color: Color(0xffe2e2e2)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          const SizedBox(
            height: 8,
          ),
          getMovieContentWidget(),
          const SizedBox(
            height: 8,
          ),
          getMovieIntroduceWidget()
        ],
      ),
    );
  }

  // 头部的电影排名
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: const Color.fromARGB(255, 238, 205, 144)),
      child: Text(
        "No.${movie.rank}",
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 131, 95, 36),
        ),
      ),
    );
  }

  // 具体内容
  Widget getMovieContentWidget() {
    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getContentImage(),
          getContentDesc(),
          getDashLine(),
          getContentWish()
        ],
      ),
    );
  }

  // 内容的图片
  Widget getContentImage() {
    return ClipRRect(
        // 图片切圆角
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          movie.imageURL!,
          height: 150,
        ));
  }

  // 内容的信息
  Widget getContentDesc() {
    return Expanded(
      // 剩余空间占据 可以伸缩
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTitleWidget(),
            const SizedBox(
              height: 3,
            ),
            getRatingWidget(),
            const SizedBox(
              height: 3,
            ),
            getInfoWidget()
          ],
        ),
      ),
    );
  }

  // 标题行
  Widget getTitleWidget() {
    return Text.rich(
      // 富文本
      TextSpan(children: [
        const WidgetSpan(
          child: Icon(
            Icons.play_circle_outline,
            color: Colors.redAccent,
            size: 20,
          ),
        ),
        TextSpan(
          text: movie.title!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: "(${movie.playDate})",
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        )
      ]),
      maxLines: 2,
    );
  }

  // 评分
  Widget getRatingWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        HYStarRating(
          rating: movie.rating!,
          size: 18,
        ),
        const SizedBox(width: 5),
        Text("${movie.rating}")
      ],
    );
  }

  Widget getInfoWidget() {
    // 1.获取种类字符串
    final genres = movie.genres?.join(" "); // 将数组转为字符串
    final director = movie.director?.name!;
    var castString = "";
    for (final cast in movie.casts!) {
      castString += "${cast.name!} ";
    }
    // 2.创建Widget
    return Text(
      "$genres / $director / $castString",
      maxLines: 2, // 最大2行
      overflow: TextOverflow.ellipsis, // 超出隐藏
      style: const TextStyle(fontSize: 14),
    );
  }

  // 虚线
  Widget getDashLine() {
    return const SizedBox(
      width: 1,
      height: 100,
      child: HYDashLine(
        axis: Axis.vertical,
        dashedHeight: 6,
        dashedWidth: .5,
        count: 12,
      ),
    );
  }

  Widget getContentWish() {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(
            height: 20,
          ),
          Icon(
            Icons.favorite_border,
            size: 30,
            color: Colors.orange,
          ),
          // Image.asset("assets/images/home/wish.png", width: 30,),
          SizedBox(
            height: 5,
          ),
          Text(
            "想看",
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 235, 170, 60)),
          )
        ],
      ),
    );
  }

  // 电影简介（原生名称）
  Widget getMovieIntroduceWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        movie.originalTitle!,
        style: const TextStyle(fontSize: 18, color: Colors.black54),
      ),
    );
  }
}

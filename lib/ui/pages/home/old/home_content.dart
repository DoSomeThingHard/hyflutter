
import 'package:flutter/material.dart';
import 'package:helloworld/core/service/home_request.dart';
import 'package:helloworld/core/utils/log.dart';
import 'package:helloworld/ui/widget/movie_item.dart';
import 'package:helloworld/core/model/old/home_model.dart';

class HYHomeContent extends StatefulWidget {
  const HYHomeContent({Key? key}) : super(key: key);

  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final List<MovieItem> movies = [];
  @override
  void initState() {
    super.initState();
    myprint("message", StackTrace.current);
    // 发送网络请求
    HomeRequest.requestMovieList(0).then((res){
      // 数组之间的添加 将res全部添加到movies
      setState(() {
        movies.addAll(res);
      });
    }).catchError((err){
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            // ${movies[index].title}
            return HYHomeMovieItem(movies[index]);
          },
        ),
      ),
    );
  }
}

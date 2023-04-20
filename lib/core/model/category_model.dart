import 'package:flutter/material.dart';

class HYCategoryModel {
  String? id;
  String? title;
  String? color;
  Color? cColor;

  HYCategoryModel({this.id, this.title, this.color});

  HYCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 1：将color转成16进制的数字
    if(color != null){
      final colorInt = int.parse(color!,radix: 16);
      // 2：将透明度加进去
      cColor = Color(colorInt | 0xFF000000);
    }else{
      cColor = Colors.white;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    return data;
  }
}

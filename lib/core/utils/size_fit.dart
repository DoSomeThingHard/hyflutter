import 'dart:ui';

class HYSizeFit{
  static late double physicalWidth;
  static late double physicalHeight;
  static late double screenWidth;
  static late double screenHeight;
  static late double dpr;
  static late double statusHeight;
  static late double rpx;
  static late double px;

  static void initialize({double standardWidth = 750}){
    // 手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    // 获取dpr
    dpr = window.devicePixelRatio;
    // 宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;
    // 状态栏高度
    statusHeight = window.padding.top / dpr;
    // 计算rpx的大小
    rpx = screenWidth / standardWidth;
    px = screenWidth / standardWidth * 2;
  }

  static double setRpx(double size){
    return rpx * size;
  }
  static double setPx(double size){
    return px * size;
  }
}
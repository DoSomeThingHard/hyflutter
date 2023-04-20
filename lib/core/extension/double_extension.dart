import 'package:helloworld/core/utils/size_fit.dart';
extension DoubleFit on double{
  // double px(){
  //   return HYSizeFit.setPx(this);
  // }
  // double rpx(){
  //   return HYSizeFit.setRpx(this);
  // }
  double get px{
    return HYSizeFit.setPx(this);
  }
  double get rpx{
    return HYSizeFit.setRpx(this);
  }
}
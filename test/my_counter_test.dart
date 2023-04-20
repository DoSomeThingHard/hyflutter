import 'package:flutter_test/flutter_test.dart';
import 'package:helloworld/core/utils/counter_test.dart';

void main() {
  test("Counter Class test", () {
    final counter = Counter();  // 1.创建Counter并且执行操作
    counter.increment();
    expect(counter.value, 1); // 2.通过expect来监测结果正确与否
  });
}
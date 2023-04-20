import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';


void main(){
  group("counter application test", () {
      late FlutterDriver driver;
      setUpAll(() async{
        driver = await FlutterDriver.connect();
      });

      tearDownAll(() {
        driver.close();
      });

      test("test default value", (){

      });

      test("floatingactionbutton click", (){

      });
  });
}
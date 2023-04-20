import 'package:flutter/foundation.dart';

void myprint(Object message, StackTrace current){
  MyCustomTrace programInfo = MyCustomTrace(current);
  if (kDebugMode) {
    print("所在文件:${programInfo.fileName},所在行${programInfo.lineNumber},所在列${programInfo.columnNumber},打印内容$message");
  }
}

class MyCustomTrace{
  final StackTrace _trace;
  late String fileName;
  late int lineNumber;
  late int columnNumber;

  MyCustomTrace(this._trace){
    _parseTrace();
  }

  void _parseTrace(){
    var traceString = _trace.toString().split("\n")[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(":");
    fileName = listOfInfos[0];
    lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    columnNumber = int.parse(columnStr);
  }
}
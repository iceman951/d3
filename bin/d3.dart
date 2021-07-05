import 'dart:io';

import 'package:d3/d3.dart' as d3;

class Stateful {}

abstract class State {
  void handler(Stateful context);
  @override
  String toString();
}

void main(List<String> arguments) {
  var line = stdin.readLineSync();
  List<String> lineList = line.toString().split(' ');
}

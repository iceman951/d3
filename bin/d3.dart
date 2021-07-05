import 'dart:io';

import 'package:d3/d3.dart' as d3;

abstract class State {
  void handler(Stateful context);
  String toString();
}

class Stateful {
  State _state;

  Stateful(this._state);

  State get state => _state;
  set state(State newState) => _state = newState;

  void touch() {
    print("  Touching the Stateful...");
    _state.handler(this);
  }
}

void main(List<String> arguments) {
  print("time");
  print('command: ');
  var line = stdin.readLineSync();
  List<String> commandList = line.toString().split(' ');
  while (true) {
    print('command: ');
    var line = stdin.readLineSync();
    List<String> commandList = line.toString().split(' ');
  }
}

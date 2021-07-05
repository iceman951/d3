import 'dart:ffi';
import 'dart:io';

import 'package:d3/d3.dart' as d3;

abstract class State {
  void handler(Stateful context);
  String toString();
}

class StatusOff implements State {
  handler(Stateful context) {
    print(" ");
    context.state = StatusOn();
  }

  @override
  String toString() {
    return "off";
  }
}

class StatusOn implements State {
  handler(Stateful context) {
    print("");
    context.state = StatusOff();
  }

  @override
  String toString() {
    return "on";
  }
}

class Stateful {
  State _state;

  Stateful(this._state);

  State get state => _state;
  set state(State newState) => _state = newState;

  void set(Float hours, Float minutes) {
    print("settttt");
    _state.handler(this);
  }

  void increaseMinutes(Float hours, Float minutes) {
    print("set_clock");
    _state.handler(this);
  }
}

void main(List<String> arguments) {
  var clockState = Stateful(StatusOff());
  print("time");
  print('command: ');
  while (true) {
    print('command: ');
    var line = stdin.readLineSync();
    List<String> commandList = line.toString().split(' ');
  }
}

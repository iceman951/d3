import 'dart:ffi';
import 'dart:io';

import 'package:d3/d3.dart' as d3;

abstract class State {
  void handler(Stateful context);
  String toString();
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

class StatusOff implements State {
  handler(Stateful context) {
    print("");
    context.state = StatusOn();
  }

  @override
  String toString() {
    return "off";
  }
}

class Stateful {
  State _state;

  Stateful(this._state);

  State get state => _state;
  set state(State newState) => _state = newState;

  void set(hours, minutes) {
    print("Set time :");
    _state.handler(this);
    inc(hours, minutes);
  }

  void inc(hours, minutes) {
    var hr = (int.parse(hours) + 1) % 24;
    print(hr);
  }
}

void main() {
  var clockState = Stateful(StatusOff());
  while (true) {
    print("clock ${clockState.state}");
    var line = stdin.readLineSync();
    List<String> commandList = line.toString().split(' ');

    if (commandList[0] == 'on' && commandList[1] != 0 && commandList[2] != 0) {
      //idle
      var hours = commandList[1];
      var minutes = commandList[2];

      print("Current time: ${hours} : ${minutes}");

      var line = stdin.readLineSync();
      List<String> lineList = line.toString().split(' ');
    }
  }
}

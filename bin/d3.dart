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
    return "status off ,please on: (on hr min)";
  }
}

class Stateful {
  State _state;

  Stateful(this._state);

  State get state => _state;
  set state(State newState) => _state = newState;

  void set(hours, minutes) {
    print("Set the time : //setState");
    // _state.handler(this);
    var increment = stdin.readLineSync();
    String command = increment.toString();
    if (command == 'inc') {
      inc(hours, minutes);
    }
  }

  void inc(hours, minutes) {
    var hr = (int.parse(hours) + 1) % 24;
    print("$hr, $minutes");
  }

  void on() {
    print("switch");
    _state.handler(this);
  }
}

void main() {
  var clockState = Stateful(StatusOff());
  var hours;
  var minutes;
  while (true) {
    print("clock ${clockState.state}");
    var line = stdin.readLineSync();
    List<String> commandList = line.toString().split(' ');
    clockState.on();

    if (commandList[1] != "0" && commandList[2] != "0") {
      hours = commandList[1];
      minutes = commandList[2];

      print("Current time: ${hours} : ${minutes}");

      var line = stdin.readLineSync();
      List<String> lineList = line.toString().split(' ');
      if (commandList[0] == 'set') {
        clockState.set(hours, minutes);
      }
    } else {
      print("hr 0 min 0");
    }
  }
}

import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  Timer? _timer;
  final hoursString = "00".obs;
  final minuteString = "00".obs;
  final secondString = "00".obs;
  int hours = 0, minutes = 0, seconds = 0;
  bool isTimerRunning = false, isResetButtonVisible = false;

  String cleaningTime = "";

  @override
  void onReady() {
    startTimer();
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  // setCleaningTime() {
  //   cleaningTime = hours * 3600 + minutes * 60 + seconds;
  //   print(cleaningTime);
  // }

  setCleaningTime() {
    cleaningTime =
        '${hoursString.value}:${minuteString.value}:${secondString.value}';
  }

  void startTimer() {
    isTimerRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _startSecond();
    });
  }

  void _startSecond() {
    if (seconds < 59) {
      seconds++;
      secondString.value = seconds.toString();
      if (secondString.value.length == 1) {
        secondString.value = "0" + secondString.value;
      }
    } else {
      _startMinute();
    }
  }

  void _startMinute() {
    if (minutes < 59) {
      seconds = 0;
      secondString.value = "00";
      minutes++;
      minuteString.value = minutes.toString();
      if (minuteString.value.length == 1) {
        minuteString.value = "0" + minuteString.value;
      }
    } else {
      _starHour();
    }
  }

  void _starHour() {
    seconds = 0;
    minutes = 0;
    secondString.value = "00";
    minuteString.value = "00";
    hours++;
    hoursString.value = hours.toString();
    if (hoursString.value.length == 1) {
      hoursString.value = "0" + hoursString.value;
    }
  }

  bool checkValues() {
    if (seconds != 0 || minutes != 0 || hours != 0) {
      return true;
    } else {
      return false;
    }
  }
}

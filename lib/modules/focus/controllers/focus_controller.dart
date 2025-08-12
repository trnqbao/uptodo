import 'dart:async';

import 'package:get/get.dart';
import 'package:uptodo/modules/focus/widgets/custom_tile.dart';

class FocusController extends GetxController {
  final RxBool isFocusing = false.obs;
  final RxString time = "45:00".obs;
  final RxDouble progress = 0.0.obs;
  final RxString statusButton = "Start".obs;
  final RxList<double> weeklySummary = [3.2, 1.5, 4.5, 1.7, 4.2, 5.6, 3.3].obs;
  final RxList applications = [].obs;

  final int focusTimeInMinutes = 45;
  late final RxInt totalSeconds = (focusTimeInMinutes * 60).obs;
  final RxInt remainingSeconds = 0.obs;
  late Timer _timer = Timer(Duration.zero, () {});

  final RxList customTiles = [].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // onButtonClick();
    resetTimer();
  }

  void onButtonClick() {
    if (isFocusing.value) {
      _timer.cancel();
      isFocusing.value = false;
      statusButton.value = "Start";
      // resetTimer();
    } else {
      startTimer();
      isFocusing.value = true;
      statusButton.value = "Stop";
    }
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int sec = seconds % 60;
    String minuteStr = (minutes).toString().padLeft(2, '0');
    String secStr = (sec).toString().padLeft(2, '0');
    return '$minuteStr:$secStr';
  }

  void getBottomBarTitles() {

  }

  void resetTimer() {
    _timer.cancel();
    remainingSeconds.value = totalSeconds.value;
    time.value = formatTime(remainingSeconds.value);
    progress.value = 0.0;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
        time.value = formatTime(remainingSeconds.value);
        progress.value = remainingSeconds.value / totalSeconds.value;
      } else {
        _timer.cancel();
        isFocusing.value = false;
      }
    });
  }
}

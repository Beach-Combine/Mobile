import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HistoryContorller extends GetxController {
  var historyRoute = "MAP";

  void changeRoute() {
    historyRoute = historyRoute == "MAP" ? "LIST" : "MAP";
    update();
  }
}

import 'package:get/get.dart';

class HomeTabLogic extends GetxController {
  final inProgressPercent = 0.0.obs;
  final nextFarm = 0.obs;


@override
  void onInit() {
    DateTime now = DateTime.now();
    nextFarm.value = DateTime(
            now.year, now.month, now.day, now.hour + 1, now.minute, now.second)
        .millisecondsSinceEpoch;
    super.onInit();
  }

}

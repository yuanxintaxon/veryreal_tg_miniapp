import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  late final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final index = 0.obs;




  void switchTab(index) {
    /*
    if (index == 2) {
      exLogic.queryMomentsList();
    }
    */
    this.index.value = index;
  }
}

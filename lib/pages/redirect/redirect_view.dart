import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'redirect_logic.dart';

class RedirectPage extends StatelessWidget {
  final logic = Get.find<RedirectLogic>();

  RedirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Redirecting..."),
    );
  }
}

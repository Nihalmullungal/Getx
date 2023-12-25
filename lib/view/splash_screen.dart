import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/splashcontroller.dart';
import 'package:student_app/controller/studentcontroller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SplashScreenController splashcontroller =
        Get.put(SplashScreenController());
    StudentController stdcontroller = Get.put(StudentController());
    stdcontroller.getall();
    splashcontroller.init();
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText("Please Wait...",
                  speed: const Duration(milliseconds: 300),
                  textStyle: const TextStyle(fontSize: 20))
            ],
          )
        ],
      ),
    ));
  }
}

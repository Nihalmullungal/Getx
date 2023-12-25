import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/splashcontroller.dart';

class ImageDisplay extends StatelessWidget {
  ImageDisplay({
    super.key,
  });

  final cont = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    cont.imagepicked = "";
    return Center(
      child: GetBuilder<SplashScreenController>(
        builder: (controller) {
          return Container(
            color: const Color.fromARGB(255, 190, 148, 191),
            height: 150,
            width: 150,
            child: cont.imagepicked == ""
                ? const Center(child: Text("No image selected"))
                : Image.file(
                    File(cont.imagepicked),
                    fit: BoxFit.cover,
                  ),
          );
        },
      ),
    );
  }
}

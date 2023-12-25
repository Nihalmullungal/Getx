import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/splashcontroller.dart';
import 'package:student_app/model/student.dart';

class ImageDisplayEdit extends StatelessWidget {
  ImageDisplayEdit({super.key, required this.std});
  Student std;

  final cont = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    cont.imagepicked = std.image;
    return Center(
      child: GetBuilder<SplashScreenController>(
        builder: (controller) {
          return Container(
            color: const Color.fromARGB(255, 190, 148, 191),
            height: 150,
            width: 150,
            child: Image.file(
              File(cont.imagepicked),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

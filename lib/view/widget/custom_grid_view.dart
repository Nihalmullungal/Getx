import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/studentcontroller.dart';
import 'package:student_app/view/edit_screen.dart';
import 'package:student_app/view/view_screen.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({super.key});
  final stdcontroller = Get.find<StudentController>();

  @override
  Widget build(BuildContext context) {
    return GetX<StudentController>(builder: (controller) {
      return stdcontroller.display.isNotEmpty
          ? GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: List.generate(
                  stdcontroller.display.length,
                  (index) => GestureDetector(
                        onTap: () => Get.off(() => ViewScreen(
                            stddetails: stdcontroller.display[index])),
                        child: Card(
                          color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                    File(stdcontroller.display[index].image)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                stdcontroller.display[index].name,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.to(() => EditScreen(
                                              student:
                                                  stdcontroller.display[index],
                                            ));
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Color.fromARGB(255, 37, 75, 106),
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        opendialog(index);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      )))
          : const Center(
              child: Text("No data"),
            );
    });
  }

  void opendialog(int index) {
    Get.dialog(AlertDialog(
      content: const Text("Are you sure?"),
      actions: [
        TextButton(
            onPressed: () {
              stdcontroller
                  .deletestudent(stdcontroller.display[index].id.toString());
              Get.back();
              Get.showSnackbar(const GetSnackBar(
                  message: "Deleted Successfully",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                  backgroundColor: Color.fromRGBO(255, 0, 0, 1)));
            },
            child: const Text("Yes")),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("No")),
      ],
    ));
  }
}

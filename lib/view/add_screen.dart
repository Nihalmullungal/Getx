import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/splashcontroller.dart';
import 'package:student_app/controller/studentcontroller.dart';
import 'package:student_app/model/student.dart';
import 'package:student_app/view/widget/custom_text_field.dart';
import 'package:student_app/view/widget/image_display.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final cont = Get.find<SplashScreenController>();
  final stdcontroller = Get.find<StudentController>();

  TextEditingController namec = TextEditingController();
  TextEditingController agec = TextEditingController();
  TextEditingController placec = TextEditingController();
  TextEditingController stdc = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: const Text(
                  "  Add Screen  ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            CustomTextField(
                addcontroller: namec,
                isnum: false,
                hint: "Enter name",
                regex: RegExp(r"^[a-zA-Z][a-zA-Z\- ]{2,28}$")),
            CustomTextField(
                addcontroller: agec,
                isnum: true,
                hint: "Enter age",
                regex: RegExp(r"^([4-9]|1[0-9]|2[0-5])$")),
            CustomTextField(
              addcontroller: placec,
              isnum: false,
              hint: "Enter place",
              regex: RegExp(r"^[a-zA-Z0-9\- ]{1,20}$"),
            ),
            CustomTextField(
              addcontroller: stdc,
              isnum: true,
              hint: "Enter standard",
              regex: RegExp(r"^([1-9]|1[0-2])$"),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageDisplay(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                  onPressed: () async {
                    await cont.imagepickerfromgallery();
                  },
                  child: const Text("Select a image")),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() &&
                        cont.imagepicked != "") {
                      final obj = await onsubmit();
                      stdcontroller.onadding(obj);
                      Get.showSnackbar(
                        const GetSnackBar(
                            backgroundColor: Color.fromARGB(255, 34, 255, 0),
                            duration: Duration(seconds: 2),
                            message: "Added Successfully",
                            snackPosition: SnackPosition.BOTTOM,
                            isDismissible: true),
                      );
                    } else if (cont.imagepicked == "") {
                      Get.snackbar("Oh Oh!!!", "please add photo",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: const Color.fromRGBO(255, 0, 0, 1));
                    }
                  },
                  child: const Text(
                    "submit",
                    style: TextStyle(color: Colors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<Student> onsubmit() async {
    final std = Student(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: namec.text,
        age: agec.text,
        image: cont.imagepicked,
        place: placec.text,
        std: stdc.text);
    namec.clear();
    agec.clear();
    cont.imageupdate();
    placec.clear();
    stdc.clear();
    return std;
  }
}

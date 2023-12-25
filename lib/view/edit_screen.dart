import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/splashcontroller.dart';
import 'package:student_app/controller/studentcontroller.dart';
import 'package:student_app/model/student.dart';
import 'package:student_app/view/home_screen.dart';
import 'package:student_app/view/widget/custom_text_field.dart';
import 'package:student_app/view/widget/image_display_edit.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key, required this.student});
  final Student student;

  final cont = Get.find<SplashScreenController>();
  final stdcontroller = Get.find<StudentController>();

  TextEditingController namec = TextEditingController();
  TextEditingController agec = TextEditingController();
  TextEditingController placec = TextEditingController();
  TextEditingController stdc = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    namec.text = student.name;
    agec.text = student.age;
    placec.text = student.place;
    stdc.text = student.std;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Edit Screen",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            CustomTextField(
                addcontroller: namec,
                isnum: false,
                hint: "name",
                regex: RegExp(r"^[a-zA-Z][a-zA-Z\- ]{2,28}$")),
            CustomTextField(
                addcontroller: agec,
                isnum: true,
                hint: "age",
                regex: RegExp(r"^([4-9]|1[0-9]|2[0-5])$")),
            CustomTextField(
                addcontroller: placec,
                isnum: false,
                hint: "place",
                regex: RegExp(r"^[a-zA-Z0-9\- ]{1,20}$")),
            CustomTextField(
                addcontroller: stdc,
                isnum: true,
                hint: "Standard",
                regex: RegExp(r"^([1-9]|1[0-2])$")),
            const SizedBox(
              height: 25,
            ),
            ImageDisplayEdit(
              std: student,
            ),
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
                    if (_formKey.currentState!.validate()) {
                      final obj = await onsubmit(student);
                      stdcontroller.onadding(obj);
                      Get.off(() => const HomeScreen());
                      Get.showSnackbar(const GetSnackBar(
                        message: "Updated Successfully",
                        duration: Duration(seconds: 2),
                        backgroundColor: Color.fromARGB(255, 0, 255, 21),
                      ));
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

  Future<Student> onsubmit(Student st) async {
    final std = Student(
        id: st.id,
        name: namec.text,
        age: agec.text,
        image: cont.imagepicked,
        place: placec.text,
        std: stdc.text);

    namec.clear();
    agec.clear();

    placec.clear();
    stdc.clear();
    return std;
  }
}

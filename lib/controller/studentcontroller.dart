import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_app/model/student.dart';

class StudentController extends GetxController {
  RxList<Student> display = <Student>[].obs;
  final DB_NAME = "STUDENT";
  Future<void> onadding(Student std) async {
    final student = await Hive.openBox<Student>(DB_NAME);
    student.put(std.id, std);
    await getall();
  }

  Future<void> getall() async {
    final student = await Hive.openBox<Student>(DB_NAME);
    display.clear();
    Future.forEach(student.values.toList(), (element) {
      display.add(element);
    });
  }

  Future<void> deletestudent(String id) async {
    final student = await Hive.openBox<Student>(DB_NAME);
    student.delete(id);
    getall();
  }

  Future<void> updatestudent(Student std) async {
    final student = await Hive.openBox<Student>(DB_NAME);
    student.put(std.id, std);
    getall();
  }

  Future<void> searchstudent(String name) async {
    final student = await Hive.openBox<Student>(DB_NAME);
    display.clear();
    Future.forEach(student.values.toList(), (element) {
      if (element.name.toLowerCase().contains(name.toLowerCase())) {
        display.add(element);
      }
    });
  }
}

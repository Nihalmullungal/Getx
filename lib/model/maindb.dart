import 'package:hive_flutter/adapters.dart';
import 'package:student_app/model/student.dart';

Future<void> maindb() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(StudentAdapter());
  }
}

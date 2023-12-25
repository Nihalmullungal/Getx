import 'package:hive_flutter/adapters.dart';
part 'student.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String age;

  @HiveField(3)
  String place;

  @HiveField(4)
  String std;

  @HiveField(5)
  String image;

  Student(
      {this.id,
      required this.name,
      required this.age,
      required this.image,
      required this.place,
      required this.std});
}

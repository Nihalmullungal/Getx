import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/model/student.dart';
import 'package:student_app/view/edit_screen.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key, required this.stddetails});
  final Student stddetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.off(() => EditScreen(student: stddetails));
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.file(
                    File(stddetails.image),
                    fit: BoxFit.cover,
                  )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Name : ${stddetails.name}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Age : ${stddetails.age}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Standard : ${stddetails.std}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Place : ${stddetails.place}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController addcontroller;
  final String hint;
  final RegExp regex;
  final bool isnum;

  const CustomTextField(
      {super.key,
      required this.addcontroller,
      required this.hint,
      required this.regex,
      required this.isnum});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: addcontroller,
        keyboardType: isnum ? TextInputType.number : TextInputType.name,
        validator: (value) {
          if (value == null || value.isEmpty || !regex.hasMatch(value.trim())) {
            return "enter a valid $hint";
          }
        },
        decoration: InputDecoration(
            hintText: hint,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}

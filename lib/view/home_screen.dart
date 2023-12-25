import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/studentcontroller.dart';
import 'package:student_app/view/add_screen.dart';
import 'package:student_app/view/widget/custom_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchcontroller = TextEditingController();
    final std = Get.find<StudentController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: ListView(
          children: [
            SearchBar(
              onChanged: (value) async {
                await std.searchstudent(value);
              },
              controller: searchcontroller,
              hintText: "Search Students",
              trailing: [
                IconButton(
                    onPressed: () {
                      searchcontroller.clear();
                      std.getall();
                    },
                    icon: const Icon(Icons.clear))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomGridView(),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

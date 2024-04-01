import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_samaya/view/admin_dept/controller/add_user-controller.dart';
import 'package:project_samaya/view/utils/input_field.dart';

class AddUser extends StatelessWidget {
  final AddUserController controller = Get.put(AddUserController());
  TextEditingController confirmPasswordController = TextEditingController();
  AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InputField(
                title: 'Name',
                controller: controller.nameController,
                hint: 'Utsav',
                widget: Text(''),
              ),
              InputField(
                  title: 'Email',
                  controller: controller.emailController,
                  hint: 'ilutsav@gmail.com',
                  widget: Text('')),
              InputField(
                  title: 'Password',
                  controller: controller.passwordController,
                  hint: '********',
                  widget: Text('')),
              InputField(
                  title: 'Confirm Password',
                  controller: confirmPasswordController,
                  hint: '********',
                  widget: Text('')),
            ]),
            SizedBox(
              height: 20,
            ),
            Text(
              'Department',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            DropdownButtonFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                items: controller.dropDownItems.map((listitem) {
                  return DropdownMenuItem<String>(
                      value: listitem.toString(), child: Text(listitem));
                }).toList(),
                onChanged: (newvalue) {
                  controller.setSelected(newvalue.toString());
                }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Add User')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

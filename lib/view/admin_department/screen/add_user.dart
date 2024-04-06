import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_samaya/view/admin_department/controller/add_user-controller.dart';
import 'package:project_samaya/widgets/input_field.dart';

class AddUser extends StatelessWidget {
  final AddUserController controller = Get.put(AddUserController());

  AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                InputField(
                  title: 'Name',
                  controller: controller.nameController,
                  hint: 'Utsav',
                  widget: const Text(''),
                ),
                InputField(
                    title: 'Email',
                    controller: controller.emailController,
                    hint: 'ilutsav@gmail.com',
                    widget: const Text('')),
                InputField(
                    title: 'Password',
                    controller: controller.passwordController,
                    hint: '********',
                    widget: const Text('')),
                InputField(
                    title: 'Confirm Password',
                    controller: controller.confirmPasswordController,
                    hint: '********',
                    widget: const Text('')),
              ]),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Department',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: controller.dropDownItems.map((listitem) {
                  return DropdownMenuItem<String>(
                    value: listitem.toString(),
                    child: Text(listitem),
                  );
                }).toList(),
                onChanged: (newvalue) {
                  controller.setSelected(newvalue.toString());
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Add User')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

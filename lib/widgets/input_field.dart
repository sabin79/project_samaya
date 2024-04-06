import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final Widget widget;

  const InputField(
      {super.key,
      required this.title,
      required this.controller,
      required this.hint,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black54),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 14.0),
              height: 52,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: false,
                      // cursorColor:
                      //     Get.isDarkMode ? Colors.grey[100] : Colors.grey[600],
                      //      readOnly: widget == null ? false : true,
                      controller: controller,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Get.isDarkMode
                                ? Colors.grey[300]
                                : Colors.grey[500]),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: context.theme.colorScheme.background,
                            width: 0,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: context.theme.colorScheme.background,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget,
                ],
              ),
            )
          ],
        ));
  }
}

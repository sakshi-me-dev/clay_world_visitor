import 'package:clay_world_scholl/views/utils/constants/string_constants.dart';
import 'package:clay_world_scholl/views/widgets/custom_button.dart';
import 'package:clay_world_scholl/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:clay_world_scholl/views/widgets/custom_drop_down_field.dart';

import '../../widgets/CustomAnimationWidget.dart';

class SubmissionScreen extends StatelessWidget {
  SubmissionScreen({super.key});

  final registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD7D9),
        title: const Padding(
          padding:  EdgeInsets.only(left: 70),
          child: Text(
                    "Visitor Info",
                    style: TextStyle(
          fontWeight: FontWeight.bold,
                    ),
                  ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: registerKey,
          child: SingleChildScrollView(
            child: CustomAnimationWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFieldTitle("Visitor Name"),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                      controller: TextEditingController(),
                      hintText: fullName,
                      suffixIcon: null,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'This field is required!';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(height: 20),
                  textFieldTitle("Visitor Number"),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                      hintText: phoneNumber,
                      suffixIcon: null,
                      isPassword: true,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'This field is required!';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(height: 20),
                  textFieldTitle("Visitor Email", isRequired: false),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                      controller: TextEditingController(),
                      hintText: emailHintText,
                      suffixIcon: null,
                      isPassword: true,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'This field is required!';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(height: 20),
                  textFieldTitle("Visitor Purpose", isRequired: true),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomDropDownField(
                    items: const [
                      "Curriculum Support",
                      "Admissions",
                      "Academic Competitions",
                      "other "
                    ],
                    value: "Curriculum Support",
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 60),
                  CustomButton(
                    buttonText: submit,
                    onPressed: () {
                      if (registerKey.currentState!.validate()) {}
                    },
                    suffixIcon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldTitle(String title, {bool isRequired = true}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: RichText(
          text: TextSpan(
        text: title,
        style: const TextStyle(
          color: Color(0xFF0F0F0F),
          fontSize: 16.0,
        ),
        children: [
          isRequired
              ? const TextSpan(
                  text: "*",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const TextSpan(),
        ],
      )),
    );
  }
}

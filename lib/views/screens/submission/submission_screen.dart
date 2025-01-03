import 'package:clay_world_scholl/views/utils/constants/string_constants.dart';
import 'package:clay_world_scholl/views/utils/app_text_styles.dart';
import 'package:clay_world_scholl/views/widgets/custom_button.dart';
import 'package:clay_world_scholl/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:clay_world_scholl/views/widgets/custom_drop_down_field.dart';

class SubmissionScreen extends StatelessWidget {
  SubmissionScreen({super.key});

  final registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: registerKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                visitorInfo,
                style: AppTextStyle.large(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              const Text(
                registerSubtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              textFieldTitle("Visitor Name"),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
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
                items: const ["Curriculum Support", "Admissions", "Academic Competitions", "other "],
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
    );
  }

  Widget textFieldTitle(String title, {bool isRequired = true}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: RichText(
          text: TextSpan(
        text: title,
        style: const TextStyle(
          color: Colors.black,
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

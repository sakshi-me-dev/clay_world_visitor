import 'package:clay_world_scholl/controllers/visitor/visitor_controller.dart';
import 'package:clay_world_scholl/models/visitors/visitor_data_model.dart';
import 'package:clay_world_scholl/views/utils/constants/string_constants.dart';
import 'package:clay_world_scholl/views/widgets/custom_button.dart';
import 'package:clay_world_scholl/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:clay_world_scholl/views/widgets/custom_drop_down_field.dart';

import '../../widgets/custom_animation_widget.dart';

class SubmissionScreen extends StatefulWidget {
  const SubmissionScreen({super.key});

  @override
  State<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> {
  final visitorKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  final purposes = [
    "Curriculum Support",
    "Admissions",
    "Academic Competitions",
    "other "
  ];

  var selectedPurpose = "Curriculum Support";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD7D9),
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
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
          key: visitorKey,
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
                      controller: nameController,
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
                      controller: numberController,
                      hintText: phoneNumber,
                      suffixIcon: null,
                      isPassword: false,
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
                      controller:emailController,
                      hintText: emailHintText,
                      suffixIcon: null,
                      isPassword: false,
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
                  items: purposes ,
                  value: selectedPurpose,
                  onChanged: (value) {
                    selectedPurpose = value!;
                    setState(() {});
                  },
                ),
                  const SizedBox(
                    height: 5,
                  ),

                 // user can add the other value by customtextfield
                 selectedPurpose == purposes.last? CustomTextField(
                      controller: otherController,
                      hintText: otherPurposeHintText,
                      suffixIcon: null,
                      isPassword: false,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'This field is required!';
                        } else {
                          return null;
                        }
                      }):Container(),

                  const SizedBox(height: 60),
                  CustomButton(
                    buttonText: submit,
                    onPressed: () async{
                      if (visitorKey.currentState!.validate()) {

                        var data = VisitorDataModel(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          number: numberController.text.trim(),
                          createdAt: DateTime.now().toString(),
                            updatedAt: DateTime.now().toString(),
                          // selected person manually  add the value /  pre-defined  option
                          option: selectedPurpose == purposes.last?otherController.text.trim():selectedPurpose
                        );
                        // add data in database
                        var visitor = await VisitorController().addVisitor(data);
                        await VisitorController().updateVisitorId(visitor.id);
                        Navigator.pop(context);
                      }
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

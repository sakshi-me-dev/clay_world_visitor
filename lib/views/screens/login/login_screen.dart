import 'package:clay_world_scholl/views/utils/constants/string_constants.dart';
import 'package:clay_world_scholl/views/utils/image_paths.dart';
import 'package:clay_world_scholl/views/utils/app_text_styles.dart';
import 'package:clay_world_scholl/views/widgets/custom_button.dart';
import 'package:clay_world_scholl/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../widgets/CustomAnimationWidget.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final loginKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: loginKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAnimationWidget(
                  duration: const Duration(seconds: 1),
                  beginOffset: const Offset(0.0, -1.0),
                  endOffset: Offset.zero,
                  child: Center(
                    child: Image.asset(
                      appLogoPath,
                      height: 200,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  login,
                  style: AppTextStyle.large(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  loginSubtitle,
                  style: AppTextStyle.normal(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50,),
                CustomAnimationWidget(
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: emailHintText,
                        suffixIcon: Icons.email,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'This field is required!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                          hintText: password,
                          suffixIcon: Icons.lock,
                          isPassword: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'This field is required!';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(height: 70),
                      CustomButton(
                        buttonText: login,
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                          if (loginKey.currentState!.validate()) {}
                        },
                        suffixIcon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:clay_world_scholl/views/utils/constants/string_constants.dart';
import 'package:clay_world_scholl/views/utils/image_paths.dart';
import 'package:clay_world_scholl/views/utils/app_text_styles.dart';
import 'package:clay_world_scholl/views/widgets/custom_button.dart';
import 'package:clay_world_scholl/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

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
                Center(
                  child: Image.asset(
                    appLogoPath,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  login,
                  style: AppTextStyle.large(),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10),

                // Subtitle
                Text(
                  loginSubtitle,
                  style: AppTextStyle.normal(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),
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
                const SizedBox(height: 60),
                CustomButton(
                  buttonText: login,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
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
          ),
        ),
      ),
    );
  }
}

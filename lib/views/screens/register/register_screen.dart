import 'package:clay_world_scholl/views/screens/login/login_screen.dart';
import 'package:clay_world_scholl/views/utils/constants/string_constants.dart';
import 'package:clay_world_scholl/views/utils/image_paths.dart';
import 'package:clay_world_scholl/views/utils/app_text_styles.dart';
import 'package:clay_world_scholl/views/widgets/custom_button.dart';
import 'package:clay_world_scholl/views/widgets/custom_rich_text.dart';
import 'package:clay_world_scholl/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: registerKey,
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
            
                // Title
                 Text(
                  REGISTER,
                  style: AppTextStyle.large(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
            
                const SizedBox(height: 10),
            
                // Subtitle
                const Text(
                  REGISTER_SUBTITLE,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
            
                const SizedBox(height: 30),
            
                 CustomTextField(
                  hintText: FULL_NAME,
                  suffixIcon: Icons.person,
                   validator: (text) {
                    if (text!.isEmpty) {
                      return 'This field is required!';
                    } else {
                      return null;
                    }
                  }
                ),
            
                const SizedBox(height: 20),
            
                 CustomTextField(
                  hintText: PHONE_NUMBER,
                  suffixIcon: Icons.phone_android,
                  isPassword: true,
                   validator: (text) {
                    if (text!.isEmpty) {
                      return 'This field is required!';
                    } else {
                      return null;
                    }
                  }
                ),
            
                const SizedBox(height: 20),
            
                 CustomTextField(
                  hintText: EMAIL_HINT_TEXT,
                  suffixIcon: Icons.email,
                  isPassword: true,
                   validator: (tetx) {
                    if (tetx!.isEmpty) {
                      return 'This field is required!';
                    } else {
                      return null;
                    }
                  }
                ),
            
                const SizedBox(height: 20),
            
                 CustomTextField(
                  hintText: PASSWORD,
                  suffixIcon: Icons.lock,
                  isPassword: true,
                   validator: (text) {
                    if (text!.isEmpty) {
                      return 'This field is required!';
                    } else {
                      return null;
                    }
                  }
                ),
            
                const SizedBox(height: 20),
            
                 CustomTextField(
                  hintText: CONFIRM_PASSWORD,
                  suffixIcon: Icons.lock,
                  isPassword: true,
                   validator: (text) {
                    if (text!.isEmpty) {
                      return 'This field is required!';
                    } else {
                      return null;
                    }
                  }
                ),
            
                const SizedBox(height: 60),
            
                CustomButton(
                  buttonText: REGISTER,
                  onPressed: () {
                    if (registerKey.currentState!.validate()) {
            
                    }
                  },
                  suffixIcon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(height: 50),
                CustomRichText(
                    text: ALREADY_REGISTER,
                    actionText: LOGIN,
                    onActionPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:clay_world_scholl/views/screens/register/register_screen.dart';
import 'package:clay_world_scholl/views/utils/constants/string_constants.dart';
import 'package:clay_world_scholl/views/utils/image_paths.dart';
import 'package:clay_world_scholl/views/utils/app_text_styles.dart';
import 'package:clay_world_scholl/views/widgets/custom_button.dart';
import 'package:clay_world_scholl/views/widgets/custom_rich_text.dart';
import 'package:clay_world_scholl/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

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
                  LOGIN,
                  style: AppTextStyle.large(),
                  textAlign: TextAlign.center,
                ),  
            
                const SizedBox(height: 10),
            
                // Subtitle
                 Text(
                  LOGIN_SUBTITLE,
                  style: AppTextStyle.normal(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),


                const SizedBox(height: 30),
            
                // Email TextField
                CustomTextField(
                  hintText: EMAIL_HINT_TEXT,
                  suffixIcon: Icons.email,
                  validator: (tetx) {
                    if (tetx!.isEmpty) {
                      return 'This field is required!';
                    } else {
                      return null;
                    }
                  },
                ),
            
                const SizedBox(height: 20),
            
                // Password TextField
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
                const SizedBox(height: 60),
                CustomButton(
                  buttonText: LOGIN,
                  onPressed: () {
                    if (loginKey.currentState!.validate()) {}
                  },
                  suffixIcon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(height: 50),
                CustomRichText(
                    text: DO_NOT_HAVE_ACCOUNT,
                    actionText: REGISTER,
                    onActionPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => RegisterScreen()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

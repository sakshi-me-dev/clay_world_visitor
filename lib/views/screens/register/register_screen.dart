import 'package:clay_world_scholl/views/screens/login/login_screen.dart';
import 'package:clay_world_scholl/views/utils/constants/string_constants.dart';
import 'package:clay_world_scholl/views/utils/image_paths.dart';
import 'package:clay_world_scholl/views/utils/app_text_styles.dart';
import 'package:clay_world_scholl/views/widgets/custom_button.dart';
import 'package:clay_world_scholl/views/widgets/custom_rich_text.dart';
import 'package:clay_world_scholl/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:clay_world_scholl/views/widgets/custome_drop_down_field.dart';

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
                   VISITOR_INFO,
                  style: AppTextStyle.large(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
            
                const SizedBox(height: 10),
            

                const Text(
                  REGISTER_SUBTITLE,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
            
                const SizedBox(height: 30),

                textFieldTitle("Visitor Name"),
                SizedBox(height: 5,),
                 CustomTextField(
                  hintText: FULL_NAME,
                  suffixIcon: null,
                   validator: (text) {
                    if (text!.isEmpty) {
                      return 'This field is required!';
                    } else {
                      return null;
                    }
                  }
                ),
            
                const SizedBox(height: 20),

                textFieldTitle("Visitor Number"),
                SizedBox(height: 5,),
                 CustomTextField(
                  hintText: PHONE_NUMBER,
                  suffixIcon: null,
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

                textFieldTitle("Visitor Email",isRequired: false),
                SizedBox(height: 5,),
                 CustomTextField(
                  hintText: EMAIL_HINT_TEXT,
                  suffixIcon:null,
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

                textFieldTitle("Visitor Purpose",isRequired: true),
                SizedBox(height: 5,),
                CustomDropDownField(items: ["A","B"],value: "A",onChanged: (value){},),
            
                const SizedBox(height: 60),
                CustomButton(
                  buttonText: SUBMIT,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldTitle(String title,{bool isRequired = true}){
    return RichText(text: TextSpan(
      text: title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      children: [
        isRequired?TextSpan(
          text: "*",
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ):TextSpan(),
      ],
    ));
  }
}

import 'package:clay_world_scholl/views/utils/constants/string_constants.dart';
import 'package:clay_world_scholl/views/utils/image_paths.dart';
import 'package:clay_world_scholl/views/utils/app_text_styles.dart';
import 'package:clay_world_scholl/views/widgets/custom_button.dart';
import 'package:clay_world_scholl/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/CustomAnimationWidget.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> passwordObscureNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    passwordObscureNotifier.dispose();
    isLoadingNotifier.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() async {
    isLoadingNotifier.value = true;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found with this email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password.';
      } else {
        errorMessage = e.message ?? 'An error occurred.';
      }
      errorDialog(errorMessage);
    } finally {
      isLoadingNotifier.value = false;
    }
  }

  errorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Failed'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                "Login",
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
              const SizedBox(
                height: 50,
              ),
              CustomAnimationWidget(
                child: Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailController,
                        hintText: emailHintText,
                        suffixIcon: const Icon(Icons.email),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'This field is required!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      ValueListenableBuilder(
                        valueListenable: passwordObscureNotifier,
                        builder: (context, customValue, child) {
                          return CustomTextField(
                            keyboardType: TextInputType.text,
                            isPassword: customValue,
                            controller: passwordController,
                            hintText: passwordHintText,
                            suffixIcon: IconButton(
                              onPressed: () {
                                passwordObscureNotifier.value = !customValue;
                              },
                              icon: customValue
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'This field is required!';
                              } else if (text.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 70),
                      ValueListenableBuilder(
                        valueListenable: isLoadingNotifier,
                        // add CircularProgressIndicator
                        builder: (context, isLoading, child) => isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : CustomButton(
                                backgroundColor: const Color(0xFFEF2B42),
                                buttonText: 'Login',
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        if (loginKey.currentState!.validate()) {
                                          login();
                                        }
                                      },
                              ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

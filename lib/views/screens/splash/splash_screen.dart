import 'package:clay_world_scholl/views/screens/home/home_screen.dart';
import 'package:clay_world_scholl/views/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/icons/app_icon.png"),
      ),
    );
  }

  @override
  void initState() {
    startSplash();
    super.initState();
  }

  startSplash() async {
    var isLoggedIn = firebaseAuth.currentUser;
    Future.delayed(const Duration(seconds: 3), () {
      if (isLoggedIn != null && mounted) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomeScreen()), (_) => false);
      } else {
        if (mounted) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => const LoginScreen()), (_) => false);
        }
      }
    });
  }
}

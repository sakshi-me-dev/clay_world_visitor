import 'package:flutter/material.dart';
import '../../utils/image_paths.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../submission/submission_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                personLogo,
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 140),
                child: Text(
                  "Add Visitor",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50,right: 30),
            child: Text(
              "Lorem Ipsum is a type of placeholder text commonly used in publishing",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Image.asset(
            welComeLogo,
            width: 300,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: CustomButton(
              buttonText: "Create",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SubmissionScreen()));
              },
              suffixIcon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

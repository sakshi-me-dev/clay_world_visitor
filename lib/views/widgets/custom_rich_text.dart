import 'package:clay_world_scholl/views/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onActionPressed;

  const CustomRichText({super.key,
    required this.text,
    required this.actionText,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          children: [
            TextSpan(
              text: actionText,
              style: const TextStyle(
                color: buttonColor,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = onActionPressed,
            ),
          ],
        ),
      ),
    );
  }
}
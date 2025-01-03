import 'package:flutter/material.dart';

import '../utils/constants/string_constants.dart'; // Ensure the constant is correctly imported

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFD7D9),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      title: const Padding(
        padding: EdgeInsets.only(top: 20), // Adjust the top padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Text(
              shohiaKhan, // Make sure this constant is properly imported
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7),
            Text(
              'sakshisingh@gmail.com',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110); // AppBar height
}

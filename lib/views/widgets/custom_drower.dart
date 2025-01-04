import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Sophia Khan",
              style: TextStyle(color: Color(0xFF0F0F0F), fontWeight: FontWeight.bold,),
            ),
            accountEmail: Text(
              "Sophiakhan@gmail.com",
              style: TextStyle(color: Color(0xFF0F0F0F)),
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person, size: 30),
            ),
            decoration: BoxDecoration(color: Color(0xFFFFD7D9)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          // const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}

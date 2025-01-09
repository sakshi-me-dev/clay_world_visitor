import 'package:clay_world_scholl/views/screens/login/login_screen.dart';
import 'package:clay_world_scholl/views/widgets/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          const CustomAppBar(),
          // const UserAccountsDrawerHeader(
          //   accountName: Text(
          //     "Sophia Khan",
          //     style: TextStyle(color: Color(0xFF0F0F0F), fontWeight: FontWeight.bold,),
          //   ),
          //   accountEmail: Text(
          //     "Sophiakhan@gmail.com",
          //     style: TextStyle(color: Color(0xFF0F0F0F)),
          //   ),
          //   currentAccountPicture: CircleAvatar(
          //     child: Icon(Icons.person, size: 30),
          //   ),
          //   decoration: BoxDecoration(color: Color(0xFFFFD7D9)),
          // ),
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
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text("Logout!"),
                        content: const Text(
                          "Are you sure? do you want to logout?",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        actions: [
                          ElevatedButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: const Text("No")),
                          ElevatedButton(onPressed: () async{
                            if(FirebaseAuth.instance.currentUser != null){
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const LoginScreen()), (_)=>false);
                            }
                          }, child: const Text("Sure")),
                        ],
                      ));
            },
          ),
        ],
      ),
    );
  }
}

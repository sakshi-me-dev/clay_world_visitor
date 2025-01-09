import 'package:flutter/material.dart';
import '../../utils/image_paths.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_drower.dart';
import '../submission/submission_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SubmissionScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              },
            ),
            Column(
              children: [
                InkWell(
                  overlayColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubmissionScreen(),
                        ));
                  },
                  child: Card(
                    color: const Color(0xFFE8F0FB),
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: Image.asset(personLogo),
                      ),
                      title: const Text(
                        "Add Visitor",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF0F0F0F)),
                      ),
                      subtitle: const Text(
                          "Lorem Ipsum is a type of placeholder text commonly used in publishing"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(welComeLogo),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}

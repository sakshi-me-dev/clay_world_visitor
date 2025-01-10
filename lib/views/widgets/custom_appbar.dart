import 'package:clay_world_scholl/controllers/auth/auth_controller.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressed;
   const CustomAppBar({super.key, this.onPressed, });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xFFFFD7D9),
      ),
      padding: const EdgeInsets.only(top: 35, left: 16, right: 16, ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          onPressed != null?Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFF0F0F0F),size: 30,),
              onPressed: onPressed,
            ),
          ):Container(),
          const SizedBox(width: 10),
          // Title and Email
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FutureBuilder(future: AuthController().getUserInfo(), builder: (_,snapshot){
                if(snapshot.hasData){
                  var userData = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData?.name??"Your name",
                        style: const TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userData?.email??"your@gmail.com",
                        style: const TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                }else{
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your name",
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "your@gmail.com",
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

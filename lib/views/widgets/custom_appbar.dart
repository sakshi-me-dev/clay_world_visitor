import 'package:clay_world_scholl/controllers/visitor/visitor_controller.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final void Function()? onPressed;
   CustomHeader({super.key, required this.onPressed, });

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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFF0F0F0F),size: 30,),
              onPressed: onPressed,
            ),
          ),
          const SizedBox(width: 10),
          // Title and Email
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: StreamBuilder(stream: VisitorController().getVisitorStream(""), builder: (_,snapshot){
                if(snapshot.hasData){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shophia Khan',
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'sakshisingh@gmail.com',
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                }else{
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shophia Khan',
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'sakshisingh@gmail.com',
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
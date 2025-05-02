import 'package:flutter/material.dart';

class Texting extends StatelessWidget {
  const Texting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Text(
            "I'm a boy",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "I'm a boy",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(Icons.access_alarm_outlined,size: 30,),
          Image.asset('assets/images/bbbbb.jpg'),
          
        ],
      ),
    ));
  }
}

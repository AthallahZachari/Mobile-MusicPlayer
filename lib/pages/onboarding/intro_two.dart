import 'package:flutter/material.dart';

class IntroTwo extends StatelessWidget{
  const IntroTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/onboarding_2.gif"),
          Text(
            "Let\'s get started!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
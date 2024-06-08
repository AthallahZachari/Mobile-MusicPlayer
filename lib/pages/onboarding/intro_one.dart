import 'package:flutter/material.dart';

class IntroOne extends StatelessWidget{
  const IntroOne({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/onboarding_1.gif"),
          Text(
            "Track Your Songs,\nGet results.",
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
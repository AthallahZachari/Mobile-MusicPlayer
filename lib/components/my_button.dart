import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final String text;
  final Function()? onTap;
  final Color color;
  final double borderRadius;
  final double width;
  final double height;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.width,
    required this.height,
    this.color = Colors.black,
    this.borderRadius = 15
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)
          )
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
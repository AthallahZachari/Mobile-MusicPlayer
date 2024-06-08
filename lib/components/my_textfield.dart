import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget{
  final String hintText;
  final bool obscureText;
  final Function(String) onChanged;

  MyTextfield({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.white),
          ), 
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color.fromARGB(41, 130, 130, 130)),
          ),
          fillColor: const Color.fromARGB(255, 233, 233, 233),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500], 
            fontSize: 14
          ),
        ),
        onChanged: (value) => onChanged(value),
      ),
    );
  }

}
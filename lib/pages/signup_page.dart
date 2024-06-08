import 'package:final_praktikum/components/my_button.dart';
import 'package:final_praktikum/components/my_textfield.dart';
import 'package:final_praktikum/pages/login_page.dart';
import 'package:final_praktikum/utils/validation.dart';
import 'package:final_praktikum/utils/encryption.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SignUp extends StatelessWidget{
  SignUp({super.key});

  String username = "";
  String password = "";
  String confirmPassword = "";
  bool isRegisterSuccess = false;

  final box = GetStorage();
  final favorite = GetStorage('favorite');

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 10),
                MyTextfield(
                  hintText: 'Username', 
                  obscureText: false, 
                  onChanged: (value) => {
                    username = value
                  }
                ),

                const SizedBox(height: 10),
                MyTextfield(
                  hintText: 'Password', 
                  obscureText: true, 
                  onChanged: (value) => {
                    password = value  
                  }
                ),

                const SizedBox(height: 10),
                MyTextfield(
                  hintText: 'Confirm Password', 
                  obscureText: true, 
                  onChanged: (value) => {
                    confirmPassword = value
                  }
                ),

                const SizedBox(height: 25),
                MyButton(
                  text: 'SignUp', 
                  width: MediaQuery.of(context).size.width*.9, 
                  height: 60,
                  color: Colors.indigo,
                  onTap: (){
                    String text = '';
                    if(!isValidated(username, "username")){
                      text = "Password should be at least 5 character consisted of uppercase, lowercase, number, and symbol. ";
                      isRegisterSuccess = false;
                    }
                    else if(isPasswordConfirmed(password, confirmPassword)){
                      if(!box.hasData(username.toLowerCase())){
                        String hashedPassword = hashPassword(password);
                        box.write(username.toLowerCase(), [hashedPassword, username]);
                        favorite.write(username.toLowerCase(), []);
                        text = "Signup Success!";
                        isRegisterSuccess = true;
                      }
                      else{
                        text = " Username is already taken!";
                        isRegisterSuccess = false;
                      }
                    }
                    else{
                      text = "Pleas re-enter the same password";
                      isRegisterSuccess = false;
                    }
                    SnackBar snackbar = SnackBar(
                      content: Text(text,),
                      backgroundColor: isRegisterSuccess? const Color.fromARGB(255, 59, 210, 64) : const Color.fromARGB(255, 177, 17, 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    if(isRegisterSuccess){
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                          builder: (context){
                            return LoginPage();
                          }
                        ),
                      );
                    }
                  }, //janlup diisi 
                ),

                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: .5,
                          color: Colors.grey[300],
                        ),
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or Signup With',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),                      
                        ),
                      ), 
                  
                      Expanded(
                        child: Divider(
                          thickness: .5,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/github.png', width: 100),
                      const SizedBox(width: 15),
                      Image.asset('images/search.png', width: 100),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have any account? Try '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }),
                          );
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
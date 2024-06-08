import 'package:final_praktikum/pages/signup_page.dart';
import 'package:final_praktikum/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:final_praktikum/components/my_button.dart';
import 'package:final_praktikum/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String username = "";
  String password = "";
  bool isLoggedIn = false;

  final box = GetStorage();
  final checkLogin = GetStorage('checkLogin');

  void updateLoginState(bool isSuccess, String message) {
    if (isSuccess) {
      checkLogin.write('isLoggedIn', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(Icons.lock_open, size: 100),
              const SizedBox(height: 10),
              MyTextfield(
                  hintText: 'Username',
                  obscureText: false,
                  onChanged: (value) => {
                        username = value,
                      }),
              const SizedBox(height: 6),
              MyTextfield(
                  hintText: 'Password',
                  obscureText: true,
                  onChanged: (value) => {
                        password = value,
                      }),
              const SizedBox(height: 25),
              MyButton(
                text: 'Log In',
                width: MediaQuery.of(context).size.width * .9,
                height: 60,
                color: Colors.indigo,
                onTap: () {
                  Navigator.pushReplacement( 
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SearchPage(username: username);
                    }),
                  );
                },
              ),
              const SizedBox(height: 30),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or Log In with',
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
              const SizedBox(height: 100),
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
                      const Text('Don\'t have any account? Try '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return SignUp();
                            }),
                          );
                        },
                        child: const Text(
                          'Sign In',
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
      )),
    );
  }
}

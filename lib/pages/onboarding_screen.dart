import 'package:final_praktikum/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:final_praktikum/pages/test.dart';
import 'package:final_praktikum/pages/onboarding/intro_one.dart';
import 'package:final_praktikum/pages/onboarding/intro_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: [
              IntroOne(),
              IntroTwo(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /* Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  )
                ), */
                Text("  "),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: const WormEffect(
                    dotHeight: 7,
                    dotWidth: 7,
                    activeDotColor: Colors.blueGrey
                  ),
                ),
                onLastPage ?
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context){
                        //return HomePage();
                        return SignUp();
                      })
                    );
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ) : 
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    " ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/widgets/Uihelper.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Uihelper.customImg(img: 'logo.png', height: 40),
                      SizedBox(width: 4),
                      Uihelper.customTxt(
                        text: 'Collabio',
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Uihelper.customTxt(
                        text: 'Together,',
                        fontSize: 50,
                        fontWeight: FontWeight.w400,
                      ),
                      Uihelper.customTxt(
                        text: 'we can acheive more',
                        fontSize: 42,
                        fontWeight: FontWeight.w200,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  customAuthBtn.emailBtn(),
                  SizedBox(height: 15),
                  customAuthBtn.googleBtn(),
                ],
              ),
              Uihelper.customTxt(text: 'Already have an account? Log In'),
            ],
          ),
        ),
      ),
    );
  }
}

class customAuthBtn {
  static Widget emailBtn() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.envelope, color: Colors.black, size: 30),
          SizedBox(width: 10),
          Uihelper.customTxt(
            text: 'Sign Up with Email',
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  static Widget googleBtn() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 9, 128, 225),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.google, color: Colors.white, size: 30),
          SizedBox(width: 10),
          Uihelper.customTxt(
            text: 'Sign Up with Google',
            fontSize: 24,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

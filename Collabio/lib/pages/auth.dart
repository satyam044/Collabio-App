import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/api/google_signin_api.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/widgets/Uihelper.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  void _onPhoneSignUpPressed() async {}

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
                      SizedBox(width: 8),
                      Uihelper.customTxt(
                        text: 'Collabio',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                        text: 'we can achieve more',
                        fontSize: 42,
                        fontWeight: FontWeight.w200,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onPhoneSignUpPressed,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    elevation: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.phone,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Uihelper.customTxt(
                        text: 'Sign Up with Phone',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Uihelper.customTxt(
                text: 'Already have an account? Log In',
                fontSize: 16,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

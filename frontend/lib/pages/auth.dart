import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/widgets/Uihelper.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  void _onEmailSignUpPressed() {
    
  }

  void _onGoogleSignUpPressed() {
    
  }

  void _onPhoneSignUpPressed() {
    
  }

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
              SizedBox(height: 100),
              Column(
                children: [
                  customAuthBtn.emailBtn(onPressed: _onEmailSignUpPressed),
                  SizedBox(height: 15),
                  customAuthBtn.googleBtn(onPressed: _onEmailSignUpPressed),
                  SizedBox(height: 15),
                  customAuthBtn.phoneBtn(onPressed: _onPhoneSignUpPressed),
                ],
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

class customAuthBtn {
  static Widget emailBtn({required VoidCallback onPressed}) {
    return _buildAuthBtn(
      icon: FontAwesomeIcons.envelope,
      text: 'Sign Up with Email',
      backgroundColor: Colors.red,
      onPressed: onPressed,
    );
  }

  static Widget googleBtn({required VoidCallback onPressed}) {
    return _buildAuthBtn(
      icon: FontAwesomeIcons.google,
      text: 'Sign Up with Google',
      backgroundColor: const Color.fromARGB(255, 9, 128, 225),
      onPressed: onPressed,
    );
  }

  static Widget phoneBtn({required VoidCallback onPressed}) {
    return _buildAuthBtn(
      icon: FontAwesomeIcons.phone,
      text: 'Sign Up with Phone',
      backgroundColor: Colors.green,
      onPressed: onPressed,
    );
  }

  static Widget _buildAuthBtn({
    required IconData icon,
    required String text,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 16),
          elevation: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, color: Colors.white, size: 30),
            SizedBox(width: 10),
            Uihelper.customTxt(
              text: text,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

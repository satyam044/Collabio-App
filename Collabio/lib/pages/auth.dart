import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/signup.dart';
import 'package:frontend/widgets/Uihelper.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  void _onEmailSignUpPressed(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  // void _onPhoneSignUpPressed(BuildContext context) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => BottomNavbarWidget()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
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
            Column(
              children: [
                CustomAuthBtn.emailBtn(
                  onPressed: () => _onEmailSignUpPressed(context),
                ),
                SizedBox(height: 12),
                // CustomAuthBtn.phoneBtn(
                //   onPressed: () => _onPhoneSignUpPressed(context),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAuthBtn {
  static Widget emailBtn({required VoidCallback onPressed}) {
    return _buildAuthBtn(
      icon: FontAwesomeIcons.envelope,
      text: 'Sign Up with Email',
      backgroundColor: Colors.red,
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

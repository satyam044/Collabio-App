import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/widgets/Uihelper.dart';
import 'package:frontend/widgets/bottom_navbar_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static _onPhoneSignUpPressed(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavbarWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavbarWidget()),
                );
              },
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Uihelper.customTxt(
                    text: 'Skip',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8),
                  FaIcon(FontAwesomeIcons.arrowRight, color: Colors.grey, size: 14,),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 60),
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
            ElevatedButton(
              onPressed: () => _onPhoneSignUpPressed(context),
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
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

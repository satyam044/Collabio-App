import 'package:flutter/material.dart';
import 'package:frontend/widgets/Uihelper.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Uihelper.customImg(img: 'logo.png', height: 40),
                  SizedBox(width: 4,),
                  Uihelper.customTxt(
                    text: 'Collabio',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Uihelper.customTxt(
                    text: 'Together,',
                    fontSize: 60,
                    fontWeight: FontWeight.w100,
                  ),
                  Uihelper.customTxt(
                    text: 'we can acheive more',
                    fontSize: 52,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}

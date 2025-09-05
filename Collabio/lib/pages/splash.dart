import 'package:flutter/material.dart';
import 'package:frontend/pages/auth.dart';
import 'package:frontend/widgets/Uihelper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        (context),
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Uihelper.customImg(img: 'logo.png', height: 120),
          Uihelper.customTxt(text: 'Collabio', fontSize: 32, fontWeight: FontWeight.bold)
        ],
      )),
    );
  }
}

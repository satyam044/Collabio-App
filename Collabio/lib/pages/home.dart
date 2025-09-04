import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/widgets/Uihelper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Center(child: FaIcon(FontAwesomeIcons.search)),
        title: Uihelper.customTxt(text: 'Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.bell, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Uihelper.customTxt(text: 'Suggestions', fontSize: 20),
            SizedBox(height: 10,),
            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.amber,
                        ),
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(10),
                          child: Uihelper.customImg(
                            img: 'logo.png',
                            height: 80,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Uihelper.customTxt(
                        text: 'Satyam',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
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

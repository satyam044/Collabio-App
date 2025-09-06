import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/widgets/Uihelper.dart';

class ChatPage extends StatelessWidget {
  final int user;
  ChatPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Row(
          children: [
            SizedBox(width: 8),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 4),
            CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xFF2C5364),
              child: FaIcon(
                FontAwesomeIcons.user,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Uihelper.customTxt(
                    text: "User $user",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  Uihelper.customTxt(
                    text: "Active Now",
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.phoneVolume, color: Colors.green),
            onPressed: () {},
          ),
          SizedBox(width: 8),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.video, color: Colors.blue),
            onPressed: () {},
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}

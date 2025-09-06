import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/widgets/Uihelper.dart';

class ProfilePage extends StatelessWidget {
  final bool? isMe;
  final int? user;
  ProfilePage(this.isMe, {this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            size: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Uihelper.customTxt(
                      text: "40k",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    Uihelper.customTxt(
                      text: "Followers",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 58,
                  backgroundColor: const Color(0xFF2C5364),
                  child: const FaIcon(
                    FontAwesomeIcons.user,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                Column(
                  children: [
                    Uihelper.customTxt(
                      text: "120",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    Uihelper.customTxt(
                      text: "Following",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Uihelper.customTxt(
                  text: isMe! ? "John Abraham" : "User $user",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                Uihelper.customTxt(
                  text: isMe! ? "@johnabraham" : "@user$user",
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          !isMe!
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Uihelper.profilePageBtn(
                      color: Colors.blue,
                      icon: FontAwesomeIcons.userPlus,
                      name: "Follow",
                    ),
                    SizedBox(width: 10),
                    Uihelper.profilePageBtn(
                      color: Color(0xFF0F2027),
                      icon: FontAwesomeIcons.message,
                      name: "Message",
                    ),
                  ],
                )
              : Center(
                  child: Uihelper.profilePageBtn(
                    color: Color(0xFF0F2027),
                    icon: FontAwesomeIcons.edit,
                    name: "Edit Profile",
                  ),
                ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Uihelper.customTxt(text: "Artist"),
          ),
          SizedBox(height: 10),
          Divider(height: 1),
        ],
      ),
    );
  }
}

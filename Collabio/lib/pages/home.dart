import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/chat.dart';
import 'package:frontend/pages/profile.dart';
import 'package:frontend/widgets/Uihelper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Uihelper.customImg(img: 'logo.png', height: 36),
            SizedBox(width: 8),
            Uihelper.customTxt(
              text: 'Collabio',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(true)),
                );
              },
              icon: FaIcon(
                FontAwesomeIcons.user,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: kToolbarHeight + 50),
            Card(
              color: Colors.white.withOpacity(0.1),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Uihelper.customTxt(
                      text: 'Suggestions',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (_, __) => SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [Colors.amber, Colors.orangeAccent],
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 34,
                                  backgroundColor: Color(0xFF2C5364),
                                  child: FaIcon(
                                    FontAwesomeIcons.user,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'User$index',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24, top: 18, bottom: 8),
                      child: Uihelper.customTxt(
                        text: 'Chats',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        itemCount: 20,
                        separatorBuilder: (_, __) => SizedBox(height: 0),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(index),
                                ),
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: ListTile(
                                leading: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProfilePage(false, user: index),
                                      ),
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Color(0xFF2C5364),
                                    child: FaIcon(
                                      FontAwesomeIcons.user,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                title: Uihelper.customTxt(
                                  text: "User $index",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                                subtitle: Uihelper.customTxt(
                                  text: "Last Message...",
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                                trailing: Uihelper.customTxt(
                                  text: "2m ago",
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

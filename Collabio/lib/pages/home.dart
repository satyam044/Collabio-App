import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/add_friends.dart';
import 'package:frontend/widgets/Uihelper.dart';
import 'package:frontend/widgets/bottom_navbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Uihelper.customImg(img: 'logo.png', height: 30),
            SizedBox(width: 8),
            Uihelper.customTxt(
              text: 'Collabio',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddFriendsPage()),
                );
              },
              icon: FaIcon(FontAwesomeIcons.userPlus, size: 20),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Uihelper.customTxt(text: 'Suggestions', fontSize: 20),
                SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.amber,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Uihelper.customImg(
                                  img: 'logo.png',
                                  height: 44,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'User$index',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 12),
                    child: Uihelper.customTxt(
                      text: 'Chats',
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(
                              'assets/images/logo.png',
                            ),
                          ),
                          title: Uihelper.customTxt(
                            text: "User $index",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          subtitle: Uihelper.customTxt(text: "Last Message..."),
                          trailing: Uihelper.customTxt(
                            text: "2m ago",
                            color: Colors.grey,
                            fontSize: 12,
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
    );
  }
}

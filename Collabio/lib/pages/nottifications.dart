import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/widgets/Uihelper.dart';

class NottificationsPage extends StatelessWidget {
  const NottificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Uihelper.customImg(img: 'logo.png', height: 36),
            SizedBox(width: 8),
            Uihelper.customTxt(
              text: 'Nottifications',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Expanded(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 0),
              itemCount: 20,
              separatorBuilder: (_, __) => SizedBox(height: 0),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xFF2C5364),
                        child: FaIcon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      title: Uihelper.customTxt(
                        text: "User $index",
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      subtitle: Uihelper.customTxt(
                        text: "Started Following You",
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      trailing: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0F2027),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.userPlus,
                          size: 16,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

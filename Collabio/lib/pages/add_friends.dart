import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/widgets/Uihelper.dart';

class AddFriendsPage extends StatelessWidget {
  const AddFriendsPage({super.key});

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
        title: Text(
          'Add Friends',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 18.0,
              ),
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 14,
                    ),
                    border: InputBorder.none,
                    hintText: "Search users...",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FaIcon(
                        FontAwesomeIcons.search,
                        color: Colors.white70,
                      ),
                    ),
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(192, 220, 220, 220),
                      fontSize: 18,
                    ),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Uihelper.customTxt(text: "Find Friends", fontSize: 22),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 15,
                separatorBuilder: (_, __) => SizedBox(height: 0),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 18,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xFF2C5364),
                            child: FaIcon(
                              FontAwesomeIcons.user,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: 18),
                          Expanded(
                            child: Text(
                              'User ${index + 1}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C5364),
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
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
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

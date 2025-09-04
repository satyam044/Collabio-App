import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/widgets/Uihelper.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sheetPosition = 0.8;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Center(child: FaIcon(FontAwesomeIcons.search)),
          title: Uihelper.customTxt(text: 'Home'),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(FontAwesomeIcons.bell, size: 24),
            ),
          ],
        ),
        body: Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: sheetPosition <= 0.3
                  ? _suggestionsFullView()
                  : _suggestionsRow(),
            ),
      
            // Chats Drawer
            NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                setState(() {
                  sheetPosition = notification.extent;
                });
                return true;
              },
              child: DraggableScrollableSheet(
                initialChildSize: 0.8,
                minChildSize: 0.1,
                maxChildSize: 1.0,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(
                              'assets/images/logo.png',
                            ),
                          ),
                          title: Text(
                            "User $index",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text("Last message..."),
                          trailing: Text(
                            "2m ago",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
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

  // Suggestions in a horizontal row
  Widget _suggestionsRow() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Uihelper.customTxt(text: 'Suggestions', fontSize: 20),
          SizedBox(height: 10),
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.amber,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Uihelper.customImg(
                              img: 'logo.png',
                              height: 60,
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
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
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
    );
  }

  // Suggestions take full screen (vertical scroll)
  Widget _suggestionsFullView() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.amber,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Uihelper.customImg(img: 'logo.png', height: 60),
                ),
              ),
              SizedBox(width: 16),
              Uihelper.customTxt(
                text: 'User $index',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/widgets/Uihelper.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final Random _random = Random();

  final List<String> fallbackImages = [
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d",
    "https://images.unsplash.com/photo-1522770179533-24471fcdba45",
    "https://images.unsplash.com/photo-1518709268805-4e9042af9f23",
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
    "https://images.unsplash.com/photo-1494526585095-c41746248156",
    "https://images.unsplash.com/photo-1468071174046-657d9d351a40",
    "https://images.unsplash.com/photo-1500534623283-312aade485b7",
    "https://images.unsplash.com/photo-1485827404703-89b55fcc595e",
    "https://images.unsplash.com/photo-1462331940025-496dfbfc7564",
  ];

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = List.generate(30, (index) {
      return fallbackImages[_random.nextInt(fallbackImages.length)];
    });

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
          Uihelper.customTxt(
            text: "John Abraham",
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          Uihelper.customTxt(
            text: "@johnabraham",
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.grey[600],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.profileIcons(icon: FontAwesomeIcons.message),
              const SizedBox(width: 20),
              Uihelper.profileIcons(icon: FontAwesomeIcons.phoneVolume),
              const SizedBox(width: 20),
              Uihelper.profileIcons(icon: FontAwesomeIcons.video),
              const SizedBox(width: 20),
              Uihelper.profileIcons(icon: FontAwesomeIcons.ellipsisVertical),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(height: 1),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Uihelper.customTxt(
                    text: "Shared Media",
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MasonryGridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: imageUrls.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              imageUrls[index],
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      height: 150,
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  },
                            ),
                          );
                        },
                      ),
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

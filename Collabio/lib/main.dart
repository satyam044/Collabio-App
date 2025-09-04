import 'package:flutter/material.dart';
import 'package:frontend/pages/auth.dart';
import 'package:frontend/pages/splash.dart';
import 'package:frontend/themes/theme_provider.dart';
import 'package:frontend/widgets/Uihelper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Uihelper.theme(context),
      home: AuthPage(),
    );
  }
}

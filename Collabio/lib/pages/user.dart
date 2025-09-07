import 'package:flutter/material.dart';
import 'package:frontend/service/api_service.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List users = [];
  String? token; // store auth token after login

  @override
  void initState() {
    super.initState();
    // example: auto login -> then fetch users
    loginAndFetchUsers();
  }

  /// Example login + fetch users
  void loginAndFetchUsers() async {
    final res = await ApiService.loginUser(
      email: "test@gmail.com",
      password: "123456",
    );

    showSnackBar(res["message"]);

    if (res["success"]) {
      setState(() {
        token = res["token"];
      });
      fetchUsers();
    }
  }

  void fetchUsers() async {
    if (token == null) return;
    final data = await ApiService.getUsers(token!);

    if (data["success"]) {
      setState(() {
        users = data["users"];
      });
    } else {
      showSnackBar(data["message"]);
    }
  }

  void registerNewUser() async {
    final res = await ApiService.registerUser(
      email: "newuser@gmail.com",
      password: "123456",
      name: "Satyam",
      userName: "satyam044",
      bio: "Flutter + Node.js dev",
    );

    showSnackBar(res["message"]);

    if (res["success"]) {
      // optional: auto-login newly registered user
      loginAndFetchUsers();
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(users[index]['name'] ?? "No name")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: registerNewUser,
        child: const Icon(Icons.add),
      ),
    );
  }
}

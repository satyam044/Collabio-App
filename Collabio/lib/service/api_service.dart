import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String baseUrl = dotenv.env['API_BASE_URL'] ?? "";

  /// Fetch all users (GET /api/auth/user/users)
  static Future<Map<String, dynamic>> getUsers(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/api/auth/user/users"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // protectRoute needs token
      },
    );

    return jsonDecode(response.body);
  }

  /// Register user (POST /api/auth/user/register)
  static Future<Map<String, dynamic>> registerUser({
    required String email,
    required String password,
    required String name,
    required String userName,
    String? bio,
    String? profilePic,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/auth/user/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
        "name": name,
        "userName": userName,
        "bio": bio ?? "",
        "profilePic": profilePic ?? "",
      }),
    );

    return jsonDecode(response.body);
  }

  /// Login user (POST /api/auth/user/login)
  static Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/auth/user/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    return jsonDecode(response.body);
  }
}

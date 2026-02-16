import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl = "https://api.escuelajs.co/api/v1";

  /// ---------------- SIGN UP ----------------
  static Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {

    final response = await http.post(
      Uri.parse("$baseUrl/users/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "avatar": "https://i.pravatar.cc/150?img=3"
      }),
    );

    if (response.statusCode == 201) {
      return true;
    }
    else {
      print('Registration error:${response.statusCode}');
      print('body:${response.body}');
      return false;
    }
  }

  /// ---------------- LOGIN ----------------
  static Future<String?> loginUser({
    required String email,
    required String password,
  }) async {

    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200 ||response.statusCode == 400) {
      final data = jsonDecode(response.body);
      print('email:${email }');
      print('password:${password }');
      return data["access_token"];
    } else {
      return null;
    }
  }
}

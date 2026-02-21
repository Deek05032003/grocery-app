import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/forgetPassword_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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
        "avatar": "https://i.pravatar.cc/150?img=3",
      }),
    );
      if (response.statusCode == 201) {

      return true;
    } else {
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
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );
      String? token;
      if (token != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);
      }

      if (response.statusCode == 201 ||
          response.statusCode == 200 ||
          response.statusCode == 400) {
        final data = jsonDecode(response.body);
        print("API Response: ${response.body}");
        print('email:${email}');
        print('password:${password}');
        print('token from api:${data["access_token"]}');
        return data["access_token"];
      } else {
        return null;
      }
    }
    catch(e){
      print('Error:${e.toString()}');
      return null;
    }
  }

  //--------------- Forgot Password ----------------
  static Future<bool> forgetPassword({required String email}) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}

class TokenManager {

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    print("Token Saved Globally: $token");
  }

  static Future<String?> getToken() async {
    // apiCount++;
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }
}
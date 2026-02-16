// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiClient {
//   static const String baseUrl =
//       'https://api.escuelajs.co/api/v1';
//
//   static Future<dynamic> get(String endpoint) async {
//     try {
//       final response =
//       await http.get(Uri.parse(baseUrl + endpoint));
//       print('STATUS CODE: ${response.statusCode}');
//       print('RAW RESPONSE BODY: ${response.body}');
//       if (response.statusCode == 200) {
//         print('call api');
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Server error');
//       }
//     } catch (e) {
//       throw Exception('API error: $e');
//     }
//   }
// }

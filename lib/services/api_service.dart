import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:3000/api";

  /// =======================
  /// 🟢 REGISTER
  /// =======================
  static Future<Map<String, dynamic>> register(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/register');

    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return {
        "success": false,
        "message": "Error: ${res.statusCode} - ${res.body}"
      };
    }
  }

  /// =======================
  /// 🟢 LOGIN
  /// =======================
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return {
        "success": false,
        "message": "Error: ${res.statusCode} - ${res.body}"
      };
    }
  }

  /// =======================
  /// 🟢 GET LESSONS
  /// =======================
  static Future<List<dynamic>> fetchLessons() async {
    final url = Uri.parse('$baseUrl/lessons');

    final res = await http.get(url);

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception("Error fetching lessons: ${res.statusCode}");
    }
  }
}

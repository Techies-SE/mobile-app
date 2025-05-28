
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static Future<Map<String, String>> getHeaders() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    return{
      'Content-Type' : 'application/json',
      if(token != null) 'Authorization' : 'Bearer $token',
    };
  }

  static Future<http.Response> get(String endPoint) async{
    final header = await getHeaders();
    final response = await http.get(
      Uri.parse('http://localhost:3000$endPoint'),
      headers: header,
    );
    return response;
  }
}

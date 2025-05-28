import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralService extends ChangeNotifier {
  bool isLoading = false;

  String _hnNumber = '';
  String _name = '';
  String _citizenId = '';
  String _phoneNum = '';

  String get hnNumber => _hnNumber;
  String get name => _name;
  String get citizenId => _citizenId;
  String get phoneNum => _phoneNum;

  Future<void> fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) {
      print("No token found! Redirecting to login...");
      return;
    }
    final url = 'http://localhost:3000/profile';
    try {
      isLoading = true;
      notifyListeners();

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['user'];
        _hnNumber = data['hn_number'];
        notifyListeners();
        _name = data['name'];
        notifyListeners();
        _citizenId = data['citizen_id'];
        notifyListeners();
        _phoneNum = data['phone_no'];
        notifyListeners();
        print("Profile data loaded successfully: $data");
      } else {
        print("Failed to load profile: ${response.statusCode}");
        //setState(() => isLoading = false);
      }
    } catch (e) {
      print("Error fetching profile: $e");
      //setState(() => isLoading = false);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<dynamic> _recommendation = [];
  List<dynamic> get recommendation => _recommendation;
  void setRecommendation(List<dynamic> value){
    _recommendation = value;
    notifyListeners();
  }
}

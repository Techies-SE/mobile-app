import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/profile/help.dart';
import 'package:patient_app/profile/privacy_policy.dart';
import 'package:patient_app/profile/profile_details.dart';
import 'package:patient_app/profile/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? hnNum;
  String? name;
  String? citizenId;
  String? phoneNum;
  bool isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      print("No token found! Redirecting to login...");
      return;
    }

    final url = 'http://localhost:3000/profile';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['user'];
        
        setState(() {
          hnNum = data['hn_number'];
          name = data['name'];
          citizenId = data['citizen_id'];
          phoneNum = data['phone_no'];
          isLoading = false;
        });

        print("Profile data loaded successfully: $data");
      } else {
        print("Failed to load profile: ${response.statusCode}");
        setState(() => isLoading = false);
      }
    } catch (e) {
      print("Error fetching profile: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading spinner
          : Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: ListView(
                children: [
                  SizedBox(height: 30),
                  ListTiles(
                    icon: Icons.person_outlined,
                    title: 'Profile',
                    function: () {
                      if (hnNum == null || name == null || phoneNum == null || citizenId == null) {
                        print("Profile data not available yet.");
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileDetails(
                            hnNum: hnNum!,
                            fullName: name!,
                            phoneNumber: phoneNum!,
                            citizenId: citizenId!,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 40),
                  ListTiles(
                    icon: CupertinoIcons.book,
                    title: 'Privacy Policy',
                    function: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                    },
                  ),
                  SizedBox(height: 40),
                  ListTiles(
                    icon: CupertinoIcons.question_circle,
                    title: 'Help',
                    function: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Help()));
                    },
                  ),
                  SizedBox(height: 40),
                  ListTiles(
                    icon: Icons.settings,
                    title: 'Setting',
                    function: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
                    },
                  ),
                  SizedBox(height: 40),
                  ListTiles(
                    icon: Icons.logout,
                    title: 'Log out',
                    function: () {},
                  )
                ],
              ),
            ),
    );
  }
}


class ListTiles extends StatelessWidget {
  const ListTiles({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });

  final IconData icon;
  final String title;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: cancelButtonColor,
        child: Icon(
          icon,
          size: 22,
          color: mainBgColor,
        ),
      ),
      title: Text(title),
      trailing: IconButton(
        onPressed: function,
        icon: Icon(
          CupertinoIcons.right_chevron,
          size: 28,
          color: mainBgColor,
        ),
      ),
    );
  }
}

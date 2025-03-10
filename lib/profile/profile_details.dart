import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Profile',
          style: appbarTestStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile avatar
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xffD9F2EF),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: mainBgColor,
                          width: 2.0,
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        color: mainBgColor,
                        size: 60,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: mainBgColor,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 24),

              // Name card
              Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              
              SizedBox(height: 6),
              Text(
                "Patient",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              
              SizedBox(height: 30),
              
              // Profile information card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: mainBgColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      
                      _buildInfoItem(
                        CupertinoIcons.phone_fill, 
                        "Phone Number", 
                        "06123456",
                      ),
                      Divider(height: 24),
                      
                      _buildInfoItem(
                        CupertinoIcons.creditcard_fill, 
                        "Citizen ID", 
                        "Hi12345",
                      ),
                      Divider(height: 24),
                      
                      _buildInfoItem(
                        CupertinoIcons.calendar_badge_plus, 
                        "Date of Birth", 
                        "30 July 2000",
                      ),
                      Divider(height: 24),
                      
                      _buildInfoItem(
                        CupertinoIcons.mail_solid, 
                        "Email", 
                        "johndoe@example.com",
                      ),
                      Divider(height: 24),
                      
                      _buildInfoItem(
                        CupertinoIcons.location_solid, 
                        "Address", 
                        "123 Medical Center, Health District",
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 30),
              
              // Update button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainBgColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  // icon: Icon(Icons.edit),
                  label: Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildInfoItem(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xffD9F2EF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: mainBgColor,
            size: 20,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
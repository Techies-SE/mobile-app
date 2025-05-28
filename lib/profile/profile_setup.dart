import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/main_screen.dart';
import 'package:patient_app/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PatientProfileSetup extends StatefulWidget {
  const PatientProfileSetup({Key? key}) : super(key: key);

  @override
  _PatientProfileSetupState createState() => _PatientProfileSetupState();
}

class _PatientProfileSetupState extends State<PatientProfileSetup> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Variables to store user input
  String _selectedGender = 'male';
  String _selectedBloodType = 'A+';
  DateTime _selectedDate = DateTime.now();
  double _bmi = 0;

  // Options for dropdowns
  final List<String> _genders = ['male', 'female'];
  final List<String> _bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  // Calculate BMI when height and weight are entered
  void _calculateBMI() {
    if (_heightController.text.isNotEmpty &&
        _weightController.text.isNotEmpty) {
      try {
        final height =
            double.parse(_heightController.text) / 100; // Convert cm to m
        final weight = double.parse(_weightController.text);
        setState(() {
          _bmi = weight / (height * height);
        });
      } catch (e) {
        // Handle parsing errors
      }
    }
  }

  // Function to pick date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF3F51B5), // Indigo
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Calculate age based on date of birth
        final age = DateTime.now().difference(_selectedDate).inDays ~/ 365;
        _ageController.text = age.toString();
      });
    }
  }

  // Get BMI category and color
  Map<String, dynamic> _getBmiInfo() {
    if (_bmi <= 0) {
      return {'category': 'N/A', 'color': Colors.grey};
    } else if (_bmi < 18.5) {
      return {'category': 'Underweight', 'color': Colors.blue};
    } else if (_bmi < 25) {
      return {'category': 'Normal', 'color': Colors.green};
    } else if (_bmi < 30) {
      return {'category': 'Overweight', 'color': Colors.orange};
    } else {
      return {'category': 'Obese', 'color': Colors.red};
    }
  }

  // Build decorated input field with label
  Widget _buildInputField({
    required String label,
    required Widget child,
    String? iconPath,
    Color iconColor = mainBgColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Row(
            children: [
              Icon(
                _getIconForLabel(label),
                size: 18,
                color: iconColor,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: mainBgColor,
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: child,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Get icon for field label
  IconData _getIconForLabel(String label) {
    switch (label) {
      case 'Gender':
        return Icons.person;
      case 'Blood Type':
        return Icons.bloodtype;
      case 'Age':
        return Icons.cake;
      case 'Date of Birth':
        return Icons.calendar_today;
      case 'Height':
        return Icons.height;
      case 'Weight':
        return Icons.monitor_weight;
      case 'BMI':
        return Icons.favorite;
      default:
        return Icons.info;
    }
  }

  //set up profile
  void setupProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);

      final response = await http.put(
        Uri.parse('http://localhost:3000/details/000000003'),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'name': 'Han Min Thaw',
          'citizen_id': '1234567891011',
          'phone_no': '0610371574',
          'gender': _selectedGender,
          'blood_type': _selectedBloodType,
          'age': _ageController.text,
          'date_of_birth': formattedDate,
          'weight': _weightController.text,
          'height': _heightController.text,
          'bmi': _bmi,
        }),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Profile saved successfully!'),
            backgroundColor: const Color(0xFF3F51B5),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (route) => false,
        );
      } else {
        print('error ${response.body}');
      }
    } catch (e) {
      print('Error fetchin $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bmiInfo = _getBmiInfo();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Patient Profile Setup',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Complete Your Profile',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: mainBgColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Please provide your health information below',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Form Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    // Gender Selection
                    _buildInputField(
                      label: 'Gender',
                      child: DropdownButtonFormField<String>(
                        value: _selectedGender,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        items: _genders.map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedGender = newValue;
                            });
                          }
                        },
                      ),
                    ),

                    // Blood Type Selection
                    _buildInputField(
                      label: 'Blood Type',
                      child: DropdownButtonFormField<String>(
                        value: _selectedBloodType,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        items: _bloodTypes.map((String bloodType) {
                          return DropdownMenuItem<String>(
                            value: bloodType,
                            child: Text(bloodType),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedBloodType = newValue;
                            });
                          }
                        },
                      ),
                    ),

                    // Date of Birth
                    _buildInputField(
                      label: 'Date of Birth',
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            suffixIcon:
                                Icon(Icons.calendar_today, color: mainBgColor),
                          ),
                          child: Text(
                            DateFormat('MMMM dd, yyyy').format(_selectedDate),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),

                    // Age Field (auto-calculated but can be manually adjusted)
                    _buildInputField(
                      label: 'Age',
                      child: TextFormField(
                        controller: _ageController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          suffixText: 'years',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter age';
                          }
                          return null;
                        },
                      ),
                    ),

                    // Height Field
                    _buildInputField(
                      label: 'Height',
                      child: TextFormField(
                        controller: _heightController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          suffixText: 'cm',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter height';
                          }
                          return null;
                        },
                        onChanged: (_) => _calculateBMI(),
                      ),
                    ),

                    // Weight Field
                    _buildInputField(
                      label: 'Weight',
                      child: TextFormField(
                        controller: _weightController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          suffixText: 'kg',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter weight';
                          }
                          return null;
                        },
                        onChanged: (_) => _calculateBMI(),
                      ),
                    ),

                    // BMI Display
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: bmiInfo['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: bmiInfo['color'], width: 1.5),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: bmiInfo['color'],
                                size: 22,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'BMI',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: bmiInfo['color'],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _bmi > 0 ? _bmi.toStringAsFixed(1) : 'N/A',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: bmiInfo['color'],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            bmiInfo['category'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: bmiInfo['color'],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle form submission
                            setupProfile();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainBgColor,
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Save Profile',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

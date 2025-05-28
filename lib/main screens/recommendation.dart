import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/services/api_service.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/services/general_service.dart';
import 'package:provider/provider.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({super.key, required this.lab_test_id});
  final int lab_test_id;

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  List<dynamic> recom = [];
  bool isLoading = false;

  Future<void> _fetchRecom() async {
    try {
      setState(() => isLoading = true);
      final response = await ApiService.get('/patients/lab-test/${widget.lab_test_id}/recommendations');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        setState(() {
          recom = data['data'];
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchRecom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Recommendation',
          style: appbarTestStyle,
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : recom.isEmpty
              ? Center(
                  child: Text(
                    'No recommendations found.',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListView.separated(
                    itemCount: recom.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final item = recom[index];
                      final labTestDate = DateFormat('MMMM d, yyyy').format(DateTime.parse(item['lab_test_date']));
                      final doctorName = item['doctor_name'] ?? 'N/A';
                      final specialization = item['specialization'] ?? 'General';
                      final testName = item['test_name'] ?? 'Test';
                      final recommendationText = item['generated_recommendation'] ?? '';

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Header row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/images/robot.png', width: 24, height: 24),
                                      const SizedBox(width: 10),
                                      Text(
                                        testName,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    labTestDate,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),

                              /// Doctor info
                              Row(
                                children: [
                                  Icon(Icons.person_outline, size: 18, color: mainBgColor),
                                  const SizedBox(width: 6),
                                  Text(
                                    '$doctorName • $specialization',
                                    style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700]),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),

                              /// Recommendation title
                              Text(
                                'Recommendations',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: mainBgColor,
                                ),
                              ),
                              const SizedBox(height: 12),

                              /// Recommendation content
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: SelectableText(
                                  recommendationText.replaceAll(r'\n', '\n'),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: textColorSecondary,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}

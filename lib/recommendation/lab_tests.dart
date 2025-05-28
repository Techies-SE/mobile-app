import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/main%20screens/recommendation.dart';
import 'package:patient_app/medical_checkup/medical_checkup_detail.dart';
import 'package:patient_app/services/api_service.dart';
import 'package:patient_app/services/general_service.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class RecommendationLabTests extends StatefulWidget {
  const RecommendationLabTests({super.key});

  @override
  State<RecommendationLabTests> createState() => _RecommendationLabTestsState();
}

class _RecommendationLabTestsState extends State<RecommendationLabTests> {
  List<dynamic> labTests = [];
  bool? isLoading;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final generalService =
          Provider.of<GeneralService>(context, listen: false);
      generalService.fetchProfile().then((_) {
        // Only attempt to fetch lab tests if HN number is available after profile fetch
        if (generalService.hnNumber.isNotEmpty) {
          _fetchLabResults();
        } else {
          print(
              'HN number is empty after profile fetch, skipping lab tests fetch');
        }
      });
    });
  }

  Future<void> _fetchLabResults() async {
    final generalService = Provider.of<GeneralService>(context, listen: false);
    try {
      setState(() {
        isLoading = true;
      });
      final response = await ApiService.get(
          '/patients/lab-tests/000000003');
      //print('it is above the if');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // print('it is in the if');
        final data = json.decode(response.body);
        setState(() {
          labTests = data['data'];
          //generalService.setRecommendation(labTests);
          //print('Lab Test: $labTests');
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('Error $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final generalService = Provider.of<GeneralService>(context);
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
      body: generalService.isLoading == true && isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(
                top: 25,
                right: 28,
                left: 28,
              ),
              child: Column(
                children: [
                  // SizedBox(
                  //   width: 260,
                  //   height: 40,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       enabled: true,
                  //       filled: true,
                  //       fillColor: Color(0xffE9E7E2),
                  //       contentPadding: EdgeInsets.zero,
                  //       prefixIcon: Icon(
                  //         Icons.search,
                  //         size: 20,
                  //       ),
                  //       hintText: 'Search',
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //         borderSide: BorderSide.none,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '2025',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: textColorSecondary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: labTests.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        final labTestDetail = labTests[index];
                        DateTime dateTime = DateTime.parse(labTestDetail['lab_test_date']);
                        final DateFormat formatter = DateFormat('MMMM d, yyyy');
                        String labTestDate = formatter.format(dateTime);
                        return ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.white,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                labTestDetail['test_name'],
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                labTestDate,
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          trailing: Icon(Icons.chevron_right_outlined),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (context) => MedicalCheckupDetail(
                                //     title: labTestDetail['test_name'], 
                                //     lab_test_id: labTestDetail['lab_test_id'],
                                //     time: labTestDate,
                                //     ),
                                builder: (context)=> Recommendation(
                                  lab_test_id: labTestDetail['lab_test_id'],
                                )
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

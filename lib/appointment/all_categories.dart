import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patient_app/constants.dart';
import '../components/category_card.dart';

class AllCategories extends StatefulWidget {
  final List? departmentList;
  const AllCategories({super.key, required this.departmentList});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  // List of available images
  final List<String> availableImages = [
    'tooth.png',
    'heart.png',
    'lung.png',
    'stethoscope.png',
    'brain.png',
    'stomach.png',
    'syringe.png'
  ];

  // Function to randomly assign images to departments
  String getRandomImage() {
    final random = Random();
    final index = random.nextInt(availableImages.length);  // Random index
    return availableImages[index];  // Return random image path
  }

  @override
  Widget build(BuildContext context) {
    print('from all categories : ${widget.departmentList}');
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Appointment',
          style: appbarTestStyle,
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 260,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  enabled: true,
                  filled: true,
                  fillColor: Color(0xffE9E7E2),
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 30,
          ),
           Flexible(
                child: GridView.builder(
                  itemCount: widget.departmentList!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                ),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final department = widget.departmentList![index];
                    String image = getRandomImage();
                    return CategoryCard(image: image, color: _getColorForDepartment(department['name']), categoryName: department['name'], department: department['name'], departmentId: department['id'],);
                  },
                  
                  // children: [
                  //   CategoryCard(
                  //     department: 'Dentistry',
                  //       image: 'tooth.png',
                  //       color: Color(0xffDC9497),
                  //       categoryName: 'Dentistry'),
                  //   CategoryCard(
                  //     department: 'Cardiology',
                  //       image: 'heart.png',
                  //       color: Color(0xff93C19E),
                  //       categoryName: 'Cardiology'),
                  //   CategoryCard(
                  //     department: 'Pulmonology',
                  //       image: 'lung.png',
                  //       color: Color(0xffF5AD7E),
                  //       categoryName: 'Pulmonology'),
                  //       CategoryCard(
                  //     department: 'General',
                  //       image: 'stethoscope.png',
                  //       color: Color(0xffACA1CD),
                  //       categoryName: 'General'),
                  //   CategoryCard(
                  //     department: 'Neurology',
                  //       image: 'brain.png',
                  //       color: Color(0xff4D9B91),
                  //       categoryName: 'Neurology'),
                  //   CategoryCard(
                  //     department: 'Gastroenterology',
                  //       image: 'stomach.png',
                  //       color: Color(0xff4B5563),
                  //       categoryName: 'Gastroenterology'),
                  //       CategoryCard(
                  //   department: 'Laboratory',
                  //     image: 'lab.png',
                  //     color: Color(0xffDEB6B5),
                  //     categoryName: 'Laboratory'),
                  // CategoryCard(
                  //   department: 'Vaccination',
                  //     image: 'syringe.png',
                  //     color: Color(0xff89CCDB),
                  //     categoryName: 'Vaccination'),
                  // ],
                 ),
              ),
          ],
        ),
      ),
    );
  }
  Color _getColorForDepartment(String departmentName) {
    switch (departmentName) {
      case 'Dentistry':
        return Color(0xffDC9497);
      case 'Cardiology':
        return Color(0xff93C19E);
      case 'Pulmonology':
        return Color(0xffF5AD7E);
      case 'General':
        return Color(0xffACA1CD);
      case 'Neurology':
        return Color(0xff4D9B91);
      case 'Gastroenterology':
        return Color(0xff4B5563);
      case 'Laboratory':
        return Color(0xffDEB6B5);
      case 'Vaccination':
        return Color(0xff89CCDB);
      default:
        return Colors.grey;  // Default color if department name is not recognized
    }
  }
}

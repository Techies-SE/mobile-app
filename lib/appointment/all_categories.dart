import 'package:flutter/material.dart';
import 'package:patient_app/constants.dart';
import '../components/category_card.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
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
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 0.8,
                  crossAxisCount:3,
                  children: [
                    CategoryCard(
                      department: 'Dentistry',
                        image: 'tooth.png',
                        color: Color(0xffDC9497),
                        categoryName: 'Dentistry'),
                    CategoryCard(
                      department: 'Cardiology',
                        image: 'heart.png',
                        color: Color(0xff93C19E),
                        categoryName: 'Cardiology'),
                    CategoryCard(
                      department: 'Pulmonology',
                        image: 'lung.png',
                        color: Color(0xffF5AD7E),
                        categoryName: 'Pulmonology'),
                        CategoryCard(
                      department: 'General',
                        image: 'stethoscope.png',
                        color: Color(0xffACA1CD),
                        categoryName: 'General'),
                    CategoryCard(
                      department: 'Neurology',
                        image: 'brain.png',
                        color: Color(0xff4D9B91),
                        categoryName: 'Neurology'),
                    CategoryCard(
                      department: 'Gastroenterology',
                        image: 'stomach.png',
                        color: Color(0xff4B5563),
                        categoryName: 'Gastroenterology'),
                        CategoryCard(
                    department: 'Laboratory',
                      image: 'lab.png',
                      color: Color(0xffDEB6B5),
                      categoryName: 'Laboratory'),
                  CategoryCard(
                    department: 'Vaccination',
                      image: 'syringe.png',
                      color: Color(0xff89CCDB),
                      categoryName: 'Vaccination'),
                  ],
                 ),
              ),
          ],
        ),
      ),
    );
  }
}

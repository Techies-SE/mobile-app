import 'package:flutter/material.dart';
import '../components/category_card.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
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
          Spacer(
            flex: 1,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryCard(
                department: 'tooth',
                  image: 'tooth.png',
                  color: Color(0xffDC9497),
                  categoryName: 'Dentistry'),
              CategoryCard(
                department: 'heart',
                  image: 'heart.png',
                  color: Color(0xff93C19E),
                  categoryName: 'Cardiology'),
              CategoryCard(
                department: 'lung',
                  image: 'lung.png',
                  color: Color(0xffF5AD7E),
                  categoryName: 'Pulmonology'),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryCard(
                department: 'stethoscope',
                  image: 'stethoscope.png',
                  color: Color(0xffACA1CD),
                  categoryName: 'General'),
              CategoryCard(
                department: 'brain',
                  image: 'brain.png',
                  color: Color(0xff4D9B91),
                  categoryName: 'Neurology'),
              CategoryCard(
                department: 'stomach',
                  image: 'stomach.png',
                  color: Color(0xff4B5563),
                  categoryName: 'Gastroenterology'),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryCard(
                department: 'lab',
                  image: 'lab.png',
                  color: Color(0xffDEB6B5),
                  categoryName: 'Laboratory'),
              SizedBox(
                width: 50,
              ),
              CategoryCard(
                department: 'syringe',
                  image: 'syringe.png',
                  color: Color(0xff89CCDB),
                  categoryName: 'Vaccination'),
            ],
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/category_card.dart';
import 'appointment_provider.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppointmentProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  provider.controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                icon: Icon(
                  CupertinoIcons.back,
                ),
              ),
              Spacer(),
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
                flex: 2,
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryCard(
                  image: 'tooth.png',
                  color: Color(0xffDC9497),
                  categoryName: 'Dentistry'),
              CategoryCard(
                  image: 'heart.png',
                  color: Color(0xff93C19E),
                  categoryName: 'Cardiology'),
              CategoryCard(
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
                  image: 'stethoscope.png',
                  color: Color(0xffACA1CD),
                  categoryName: 'General'),
              CategoryCard(
                  image: 'brain.png',
                  color: Color(0xff4D9B91),
                  categoryName: 'Neurology'),
              CategoryCard(
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
                  image: 'lab.png',
                  color: Color(0xffDEB6B5),
                  categoryName: 'Laboratory'),
              SizedBox(
                width: 50,
              ),
              CategoryCard(
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

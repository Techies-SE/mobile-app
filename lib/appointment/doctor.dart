import 'package:flutter/material.dart';
import 'package:patient_app/appointment/doctor_card.dart';
import 'package:patient_app/constants.dart';

class Doctor extends StatefulWidget {
  const Doctor({super.key, required this.department});
  final String department;

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  int? isSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.department,
          style: appbarTestStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: isSelected == null ? null : () {},
              style: TextButton.styleFrom(
                  backgroundColor:
                      isSelected == null ? Colors.grey : mainBgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                'Book',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: Center(
          child: Column(
            children: [
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
                height: 15,
              ),
              Flexible(
                child: GridView.builder(
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.1,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = index;
                          });
                        },
                        child: DoctorCard(
                          image: 'assets/images/nathan.png',
                          name: 'Dr. Nathan',
                          isSelected: isSelected == index,
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

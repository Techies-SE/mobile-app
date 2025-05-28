import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:patient_app/main_screen.dart';
import 'package:patient_app/services/api_service.dart';
import 'package:patient_app/services/noti_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ReservationScreen extends StatefulWidget {
  final int doctorId;
  final bool reschedule;
  int? appointmentId;
  ReservationScreen({super.key, required this.doctorId, required this.reschedule, this.appointmentId });

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  TextEditingController notesController = TextEditingController();

  String? doctorName;
  String? specialization;
  // Selected date and time
  DateTime selectedDate = DateTime.now();
  String? selectedTime;
  DateTime focusedDay = DateTime.now();

  // Available time slots
  List<String> availableTimeSlots = [];
  bool isLoadingSlots = false;

  Set<DateTime> availableDates = {};

  @override
  void initState() {
    super.initState();
    fetchDoctorProfile();
    fetchAvailableSlots(selectedDate);
  }

  @override
  void dispose() {
    super.dispose();
    notesController.dispose();
  }

// fixed the method in backend
  Future<void> fetchDoctorProfile() async {
    try {
      final response = await ApiService.get('/doctors/id=${widget.doctorId}');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final result = jsonDecode(response.body);
        final data = result;
        setState(() {
          doctorName = data['name'];
          specialization = data['specialization'];
        });
      }else{
        print('error ${response.body}');
      }
    } catch (e) {
      print('Error fetching doctor profile: $e');
    }
  }

// fixed the method in backend
  Future<void> fetchAvailableSlots(DateTime date) async {
    setState(() {
      isLoadingSlots = true;
      availableTimeSlots = [];
      selectedTime = null; // Reset selected time when new date is selected
    });

    try {
      // Format the date as required by the API (YYYY-MM-DD)
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      final response = await ApiService.get(
          '/slots/id=${widget.doctorId}/date=$formattedDate');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body);
        List<String> slots = List<String>.from(data['available_slots']);

        // Format slots to 24-hour format (HH:mm)
        List<String> formattedSlots = slots.map((slot) {
          return slot; // No AM/PM formatting, keeping it in "HH:mm"
        }).toList();

        setState(() {
          availableTimeSlots = formattedSlots;
          isLoadingSlots = false;
        });
      } else {
        setState(() {
          availableTimeSlots = [];
        });
      }
    } catch (e) {
      print('Error fetching available slots: $e');
      setState(() {
        availableTimeSlots = [];
        isLoadingSlots = false;
      });
    } finally {
      setState(() {
        isLoadingSlots = false;
      });
    }
  }

// fixed the method in backend
  Future<void> confirmAppointment() async {
    if (selectedTime != null) {
      try {
       SharedPreferences prefs = await SharedPreferences.getInstance();
       String? token = prefs.getString('token');
        final appointmentData = {
          'doctor_id': widget.doctorId,
          'appointment_date': DateFormat('yyyy-MM-dd').format(selectedDate),
          'appointment_time': selectedTime,
          'notes' : notesController.text
        };

        // Log the appointment data
        print("Confirming appointment with data: $appointmentData");
        final response = await http.post(
            Uri.parse('http://localhost:3000/patients/appointments/confirmation'),
            body: jsonEncode(appointmentData),
            headers: {
               'Content-Type': 'application/json',
               'Authorization': 'Bearer $token',
             },);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final data = jsonDecode(response.body);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(data['message'])));
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
                (Route<dynamic> route) => false);
          });
        } else {
          // Handle error response
          final data = jsonDecode(response.body);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(data['message'])));
        }
      } catch (e) {
        print('Error confirming appointment: $e');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to confirm appointment.")));
      }
    }
  }

  Future<void> rescheduleApp() async {
    if (selectedTime != null) {
      try {
        final body = {
          'hn_number':
              "000000003", // Replace with the actual HN number variable if available
          'doctor_id': widget.doctorId,
          'appointment_date': DateFormat('yyyy-MM-dd').format(selectedDate),
          'appointment_time': selectedTime,
          // 'notes' : notesController.text
        };

        // Log the appointment data
        print("Confirming appointment with data: $body");
        final response = await http.patch(
            Uri.parse('http://localhost:3000/appointments/${widget.appointmentId}/reschedule'),
            body: jsonEncode(body),
            headers: {'Content-Type': 'application/json'});
        if (response.statusCode >= 200 && response.statusCode < 300) {
          final data = jsonDecode(response.body);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(data['message'])));
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
                (Route<dynamic> route) => false);
          });
        } else {
          // Handle error response
          final data = jsonDecode(response.body);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(data['message'])));
        }
      } catch (e) {
        print('Error confirming appointment: $e');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to confirm appointment.")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Book Appointment",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // Notification logic would go here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Info
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Colors.teal, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(33),
                      child: Image.asset(
                        'assets/images/doctor.png', // Replace with actual image
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.person, size: 40),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      doctorName != null
                          ? Text(
                              doctorName!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              "Loading...",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      specialization != null
                          ? Text(
                              specialization!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            )
                          : const Text(
                              "Loading...",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                    ],
                  ),
                ],
              ),
          
              const SizedBox(height: 24),
          
              // Select Date Section
              const Text(
                "Select Date",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              const SizedBox(height: 8),
          
              // Real Calendar
              TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime.now()
                    .add(const Duration(days: 30)), // Allow booking 30 days ahead
                focusedDay: focusedDay,
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedDate = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                  fetchAvailableSlots(selectedDay);
                },
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  leftChevronIcon:
                      const Icon(Icons.chevron_left, color: Colors.black),
                  rightChevronIcon:
                      const Icon(Icons.chevron_right, color: Colors.black),
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: const TextStyle(color: Colors.red),
                  outsideTextStyle:
                      TextStyle(color: Colors.grey.withOpacity(0.5)),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(fontWeight: FontWeight.w500),
                  weekendStyle:
                      TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
                ),
              ),
          
              const SizedBox(height: 24),
          
              // Time Slots Section
              const Text(
                "Available Time Slots",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              const SizedBox(height: 16),
          
              // Time Slots Grid
              isLoadingSlots
                  ? const Center(child: CircularProgressIndicator())
                  : availableTimeSlots.isEmpty
                      ? const Center(
                          child: Text("No available slots for this date"))
                      : Wrap(
                          spacing: 8,
                          runSpacing: 12,
                          children: availableTimeSlots.map((time) {
                            final bool isSelected = time == selectedTime;
          
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTime = time;
                                });
                              },
                              child: Container(
                                width: 100,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.blue
                                        : Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: isSelected
                                      ? Colors.blue.withOpacity(0.1)
                                      : Colors.white,
                                ),
                                child: Text(
                                  time,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:
                                        isSelected ? Colors.blue : Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
          
              // const Spacer(),
          
              const SizedBox(height: 24),
          
              // Notes Section
              const Text(
                "Appointment Notes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              const SizedBox(height: 16),
          
              // Notes Text Field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: notesController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "Write any important notes for your appointment...",
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 30,),
          
              // Appointment Summary
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      selectedTime != null
                          ? "Appointment: ${DateFormat('MMM d, yyyy').format(selectedDate)} at $selectedTime"
                          : "Select date and time to book",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 16),
          
              // Confirm Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: selectedTime != null
                      ? () {
                          if(widget.reschedule == false){
                            confirmAppointment();
                            NotiService().scheduleNoti(
                            title: "Booking Reminder!",
                            body: 'You have an Appointment today!',
                            hour: 15,
                            min: 33,
                          );
                          }else{
                            rescheduleApp();
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    disabledBackgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Confirm Appointment",
                    style: TextStyle(
                      color: Colors.white,
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
}

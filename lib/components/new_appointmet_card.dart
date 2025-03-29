import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class NewAppointmetCard extends StatefulWidget {
  const NewAppointmetCard({
    super.key,
    required this.drName,
    required this.category,
    required this.status,
  });

  final String drName;
  final String category;
  final String status;

  @override
  State<NewAppointmetCard> createState() => _NewAppointmetCardState();
}

class _NewAppointmetCardState extends State<NewAppointmetCard> {
  late Color borderColor;
  late Color statusColro;
  late Color statusTextColor;

  void setColor() {
    switch (widget.status.toLowerCase()) {
      case 'scheduled':
        borderColor = Color(0xffE3FCEF);
        statusColro = Color(0xffE3FCEF);
        statusTextColor = Color(0xff047857);
        break;
      case 'reschedule':
        borderColor = Color(0xffEBFDA9);
        statusColro = Color(0xffEBFDA9);
        statusTextColor = Color(0xff938506);
        break;
      case 'canceled':
        borderColor = Color(0xffF7CFCF);
        statusColro = Color(0xffFCE3E3);
        statusTextColor = Color(0xff780404);
        break;
      case 'completed':
        borderColor = Color(0xffA9E8FD);
        statusColro = Color(0xffFCE3E3);
        statusTextColor = Color(0xff043778);
        break;
      case 'pending':
        borderColor = Color(0xffFEF8DD);
        statusColro = Color(0xffFEF8DD);
        statusTextColor = Color(0xffB55610);
      default:
        borderColor = mainBgColor;
        statusColro = Colors.white;
        statusTextColor = Colors.black;
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setColor();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            width: 2,
            color:
                borderColor, //Color(0xffF7CFCF) for cancelled Color(0xffA9E8FD) for completed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.drName,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Card(
                    color: statusColro,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4),
                      child: Text(
                        widget.status,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: statusTextColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                widget.category,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff595959),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.calendar),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      'Mar 15,2025.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff595959),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(CupertinoIcons.clock),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      '2:00 PM',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff595959),
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.status.toLowerCase() != 'pending') ...[
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          minimumSize: Size(132, 28),
                          //backgroundColor: cancelButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: mainBgColor),
                          )),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: mainBgColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          minimumSize: Size(132, 28),
                          backgroundColor: mainBgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: mainBgColor),
                          )),
                      child: Text(
                        widget.status.toLowerCase() == 'reschedule'
                            ? 'Confirm'
                            : widget.status.toLowerCase() == 'completed'
                                ? 'Add Review'
                                : 'Reschedule',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

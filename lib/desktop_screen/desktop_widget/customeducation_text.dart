import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String mainText, subText, text, text1;
  const CustomTextWidget(
      {super.key,
      required this.mainText,
      required this.subText,
      required this.text,
      required this.text1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.6),
                  blurRadius: 5,
                  spreadRadius: 3)
            ],
            border: Border.all(color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: GoogleFonts.prata(
                    textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                )),
              ),
              Text(
                subText,
                style: GoogleFonts.prata(
                    textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                )),
              ),
              Text(
                text,
                style: GoogleFonts.prata(
                    textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                )),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              Text(
                text1,
                style: GoogleFonts.prata(
                    textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.011,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

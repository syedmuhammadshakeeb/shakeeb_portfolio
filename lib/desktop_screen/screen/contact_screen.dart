import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakeeb_portfolio/desktop_screen/desktop_widget/contact_column.dart';
import 'package:shakeeb_portfolio/desktop_screen/desktop_widget/contact_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 13,
          ),
          Text(
            'Personal Contact',
            style: GoogleFonts.prata(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.045,
                    fontWeight: FontWeight.w400)),
          ),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 850) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 8,
                    horizontal: MediaQuery.of(context).size.height / 5),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ContactInfo(), ContactField()],
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 8,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContactInfo(),
                    SizedBox(
                      height: 50,
                    ),
                    ContactField()
                  ],
                ),
              );
            }
          })
        ],
      ),
    );
  }
}

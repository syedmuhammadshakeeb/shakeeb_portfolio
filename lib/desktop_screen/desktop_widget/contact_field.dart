import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ContactField extends StatefulWidget {
  const ContactField({super.key});

  @override
  State<ContactField> createState() => _ContactFieldState();
}

class _ContactFieldState extends State<ContactField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.2,
      width: MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: GoogleFonts.prata(
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade700),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade700),
                    borderRadius: BorderRadius.circular(5))),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: GoogleFonts.prata(
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade700),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade700),
                    borderRadius: BorderRadius.circular(5))),
          ),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
                hintText: 'Message',
                hintStyle: GoogleFonts.prata(
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade700),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade700),
                    borderRadius: BorderRadius.circular(5))),
          ),
          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                'Submit',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}

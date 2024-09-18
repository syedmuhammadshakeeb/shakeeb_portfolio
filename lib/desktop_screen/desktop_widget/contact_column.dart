import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  Future<void> profiles(String url) async {
    if (await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw Exception('No Link Found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lets Work Togeather',
          style: GoogleFonts.prata(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.037,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mail:',
              style: GoogleFonts.prata(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.027,
                      fontWeight: FontWeight.bold)),
            ),
            InkWell(
              onTap: () {
                profiles('mailto:shakeeb12a@gmail.com');
              },
              child: Text(
                'shakeeb12a@gmail.com',
                style: GoogleFonts.prata(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Linkdin:',
              style: GoogleFonts.prata(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.027,
                      fontWeight: FontWeight.bold)),
            ),
            InkWell(
              onTap: () {
                profiles('https://www.linkedin.com/in/syedshakeeb01/');
              },
              child: Text.rich(TextSpan(
                  text: 'Linkdin Profile:',
                  style: GoogleFonts.prata(
                      textStyle: TextStyle(
                          color: Colors.green.shade700,
                          fontSize: MediaQuery.of(context).size.height * 0.020,
                          fontWeight: FontWeight.w500)),
                  children: [
                    TextSpan(
                      text: 'Syed Shakeeb',
                      style: GoogleFonts.prata(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.020,
                              fontWeight: FontWeight.w500)),
                    )
                  ])),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address:',
              style: GoogleFonts.prata(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.027,
                      fontWeight: FontWeight.bold)),
            ),
            Text(
              'Karachi, Pakistan',
              style: GoogleFonts.prata(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.020,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        )
      ],
    );
  }
}

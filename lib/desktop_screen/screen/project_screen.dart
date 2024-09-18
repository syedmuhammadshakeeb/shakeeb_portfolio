import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakeeb_portfolio/desktop_screen/desktop_widget/projectwidget.dart';

import 'package:shakeeb_portfolio/screen_utils.dart';

import 'package:url_launcher/url_launcher.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  Future<void> profiles(String url) async {
    if (await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw Exception('No Url found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Text(
              'Personal Projects',
              style: GoogleFonts.prata(
                textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.045,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.width10(context) * 2.1,
                  vertical: AppDimensions.height10(context) * 2.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Wrap(
                    runAlignment: WrapAlignment.spaceAround,
                    alignment: WrapAlignment.center,
                    spacing: AppDimensions.width10(context) * 2.0,
                    children: [
                      CustomContainer(
                        ontap: () {
                          profiles(
                              'https://drive.google.com/file/d/16ODaQyHv5_FQKbH89iJ9LLgGpAt40Xl7/view?usp=drive_link');
                        },
                        ontap1: () {
                          profiles(
                              'https://github.com/syedmuhammadshakeeb/burger_crunch');
                        },
                        image: 'assets/burgercrunch.png',
                        tail:
                            'A Fast Food App, which helps you to find your desire fast food with user friendly inaterface.',
                        head: 'Burger_crunch',
                      ),
                      CustomContainer(
                        ontap: () {
                          profiles('url');
                        },
                        ontap1: () {
                          profiles(
                              'https://github.com/syedmuhammadshakeeb/shop_up');
                        },
                        image: 'assets/shopup.png',
                        tail:
                            'Shop Up is an E-commerce App which helps buying good quality product with sleek user interface',
                        head: 'Shop Up',
                      ),
                      CustomContainer(
                        ontap: () {
                          profiles('url');
                        },
                        ontap1: () {
                          profiles(
                              'https://github.com/syedmuhammadshakeeb/blogify');
                        },
                        image: 'assets/blogify.png',
                        tail:
                            'A Blog posting App help writer to write their blog using firebase for data manupolation. ',
                        head: 'Blogify',
                      ),
                      CustomContainer(
                        ontap: () {
                          profiles('url');
                        },
                        ontap1: () {
                          profiles(
                              'https://github.com/syedmuhammadshakeeb/chat_app');
                        },
                        image: 'assets/chat.png',
                        tail:
                            'A text based chat app user can sent message via one to one chat system.',
                        head: 'Chat App',
                      ),
                      CustomContainer(
                        ontap: () {
                          profiles(
                              'https://drive.google.com/file/d/16fumZb_BFNhcBWvBTTQpk98NTB4240VF/view?usp=drive_link');
                        },
                        ontap1: () {
                          profiles('url');
                        },
                        image: 'assets/doctorPatient.png',
                        tail:
                            'A Doctor patient app with online appoinment via video call with pharmacy.',
                        head: 'Doctor Patient',
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

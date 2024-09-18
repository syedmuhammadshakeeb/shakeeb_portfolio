import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakeeb_portfolio/desktop_screen/desktop_widget/appbar.dart';
import 'package:shakeeb_portfolio/desktop_screen/screen/contact_screen.dart';
import 'package:shakeeb_portfolio/desktop_screen/screen/desktop.dart';
import 'package:shakeeb_portfolio/desktop_screen/screen/experience_education.dart';
import 'package:shakeeb_portfolio/desktop_screen/screen/project_screen.dart';
import 'package:shakeeb_portfolio/desktop_screen/screen/skills_screen.dart';
import 'package:shakeeb_portfolio/screen_utils.dart';
import 'package:shakeeb_portfolio/utils/data.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  final List<double> _sectionOffsets = [];
  late AnimationController controller;
  bool isPlay = false;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateSectionOffsets();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _calculateSectionOffsets() {
    double offset = 0.0;
    for (int i = 0; i < 5; i++) {
      _sectionOffsets.add(offset);
      offset += MediaQuery.of(context).size.height;
      // Assuming each section's height
    }
  }

  void _scrollToSection(int index) {
    if (index >= 0 && index < _sectionOffsets.length) {
      scrollController.animateTo(
        _sectionOffsets[index],
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> profiles(String url) async {
    if (await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw Exception('No Url found');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Syed Shakeeb',
                  style: GoogleFonts.prata(
                      textStyle: const TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        profiles('https://github.com/syedmuhammadshakeeb');
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.github,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        profiles('https://www.linkedin.com/in/syedshakeeb01/');
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: DataSet.menuNames.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.width10(context) * 1.0,
                              vertical: AppDimensions.height10(context) * 1.0),
                          child: GestureDetector(
                            onTap: () {
                              _scrollToSection(index);
                            },
                            child: Material(
                              elevation: 5,
                              color: Colors.transparent,
                              child: Container(
                                  height: AppDimensions.height10(context) * 5.0,
                                  width: AppDimensions.width10(context) * 25.0,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.transparent,
                                            blurRadius: 5,
                                            spreadRadius: 3),
                                      ]),
                                  child: Center(
                                    child: Text(
                                      DataSet.menuNames[index],
                                      style: GoogleFonts.prata(
                                        textStyle: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    2.1,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: AppDimensions.height10(context) * 2.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Home',
                                style: GoogleFonts.prata(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.normal,
                                )),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Contact',
                                style: GoogleFonts.prata(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.normal,
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.width10(context) * 2.0),
                        child: const Divider(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.0,
                      ),
                      Text(
                        '© 2024 Shakeeb-Dev™. All Rights Reserved.',
                        style: GoogleFonts.prata(
                            textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              ListView(
                controller: scrollController,
                children: [
                  const DesktopScreen(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 9),
                    child: const Divider(
                      color: Colors.white,
                    ),
                  ),
                  const SkillsScreen(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 9),
                    child: const Divider(
                      color: Colors.white,
                    ),
                  ),
                  const ExperienceEducationScreen(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 9),
                    child: const Divider(
                      color: Colors.white,
                    ),
                  ),
                  const ProjectScreen(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 9),
                    child: const Divider(
                      color: Colors.white,
                    ),
                  ),
                  const ContactScreen(),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 9),
                      child: const Divider(
                        color: Colors.white,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LayoutBuilder(builder: (context, constraints) {
                          if (constraints.maxWidth > 650) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal:
                                      MediaQuery.of(context).size.width / 9),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Syed Shakeeb',
                                    style: GoogleFonts.prata(
                                        textStyle: const TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Home',
                                        style: GoogleFonts.prata(
                                            textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.normal,
                                        )),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Contact',
                                        style: GoogleFonts.prata(
                                            textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.normal,
                                        )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          profiles(
                                              'https://github.com/syedmuhammadshakeeb');
                                        },
                                        child: const FaIcon(
                                          FontAwesomeIcons.github,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          profiles(
                                              'https://www.linkedin.com/in/syedshakeeb01/');
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.linkedin,
                                          color: Colors.blue.shade900,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Syed Shakeeb',
                                    style: GoogleFonts.prata(
                                        textStyle: const TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Home',
                                        style: GoogleFonts.prata(
                                            textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.normal,
                                        )),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Contact',
                                        style: GoogleFonts.prata(
                                            textStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.normal,
                                        )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          profiles(
                                              'https://github.com/syedmuhammadshakeeb');
                                        },
                                        child: const FaIcon(
                                          FontAwesomeIcons.github,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          profiles(
                                              'https://www.linkedin.com/in/syedshakeeb01/');
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.linkedin,
                                          color: Colors.blue.shade900,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 4),
                          child: const Divider(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '© 2024 Shakeeb-Dev™. All Rights Reserved.',
                          style: GoogleFonts.prata(
                              textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 0,
                  child: AppbarWidget(
                    isPlay: isPlay,
                    controller: controller,
                    size: size,
                  )),
            ],
          )),
    );
  }
}

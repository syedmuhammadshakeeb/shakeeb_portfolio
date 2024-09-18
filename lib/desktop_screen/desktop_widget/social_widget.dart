import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakeeb_portfolio/utils/data.dart';

import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatefulWidget {
  final Size size;
  const SocialWidget({super.key, required this.size});

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  bool hover = false;
  List icons = [
    FontAwesomeIcons.linkedin,
    FontAwesomeIcons.github,
    FontAwesomeIcons.whatsapp,
    FontAwesomeIcons.instagram
  ];

  List<bool> ishover = List.generate((4), (index) => false);
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    slideAnimation =
        Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero)
            .animate(controller);
    Timer(const Duration(seconds: 0), () {
      controller.forward();
    });
    super.initState();
  }

  Future<void> profiles(String url) async {
    if (await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw Exception('No Url found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 960) {
        return SlideTransition(
          position: slideAnimation,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: widget.size.width / 13),
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MouseRegion(
                  onEnter: (_) => setState(() {
                    hover = true;
                  }),
                  onExit: (_) => setState(() {
                    hover = false;
                  }),
                  child: InkWell(
                    onTap: () {
                      profiles(
                          'https://drive.google.com/file/d/1REBqCmOO2evdG6ebluc8tO0laUhZ3kL5/view?usp=drive_link');
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: hover
                              ? Colors.blueGrey.shade900
                              : Colors.blueGrey.shade700,
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                              right: BorderSide(
                                  color:
                                      hover ? Colors.blueGrey : Colors.white),
                              bottom: BorderSide(
                                  color:
                                      hover ? Colors.blueGrey : Colors.white))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Download CV',
                            style: GoogleFonts.prata(
                                textStyle: TextStyle(
                                    fontSize: widget.size.height * 0.022,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal)),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.download,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: icons.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MouseRegion(
                            onEnter: (_) => setState(() {
                              ishover[index] = true;
                            }),
                            onExit: (_) => setState(() {
                              ishover[index] = false;
                            }),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: InkWell(
                                onTap: () {
                                  profiles(DataSet.links[index]);
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: ishover[index]
                                        ? Colors.blueGrey.shade900
                                        : Colors.blueGrey.shade700,
                                    border: Border(
                                        right: BorderSide(
                                            color: ishover[index]
                                                ? Colors.blueGrey
                                                : Colors.white),
                                        bottom: BorderSide(
                                            color: ishover[index]
                                                ? Colors.blueGrey
                                                : Colors.white)),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: FaIcon(
                                      icons[index],
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        );
      } else {
        return SlideTransition(
          position: slideAnimation,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: widget.size.width / 13),
            height: 150,
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  onEnter: (_) => setState(() {
                    hover = true;
                  }),
                  onExit: (_) => setState(() {
                    hover = false;
                  }),
                  child: InkWell(
                    onTap: () {
                      profiles(
                          'https://drive.google.com/file/d/1REBqCmOO2evdG6ebluc8tO0laUhZ3kL5/view?usp=drive_link');
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: hover
                              ? Colors.blueGrey.shade900
                              : Colors.blueGrey.shade700,
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                              right: BorderSide(
                                  color:
                                      hover ? Colors.blueGrey : Colors.white),
                              bottom: BorderSide(
                                  color:
                                      hover ? Colors.blueGrey : Colors.white))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Download CV',
                            style: GoogleFonts.prata(
                                textStyle: TextStyle(
                                    fontSize: widget.size.height * 0.022,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal)),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.download,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: icons.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MouseRegion(
                            onEnter: (_) => setState(() {
                              ishover[index] = true;
                            }),
                            onExit: (_) => setState(() {
                              ishover[index] = false;
                            }),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: InkWell(
                                onTap: () {
                                  profiles(DataSet.links[index]);
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: ishover[index]
                                        ? Colors.blueGrey.shade900
                                        : Colors.blueGrey.shade700,
                                    border: Border(
                                        right: BorderSide(
                                            color: ishover[index]
                                                ? Colors.blueGrey
                                                : Colors.white),
                                        bottom: BorderSide(
                                            color: ishover[index]
                                                ? Colors.blueGrey
                                                : Colors.white)),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: FaIcon(
                                      icons[index],
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        );
      }
    });
  }
}

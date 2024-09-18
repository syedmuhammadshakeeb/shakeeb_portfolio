import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakeeb_portfolio/screen_utils.dart';

// ignore: must_be_immutable
class AppbarWidget extends StatefulWidget {
  final Size size;
  bool isPlay;

  final AnimationController controller;
  AppbarWidget(
      {super.key,
      required this.size,
      required this.isPlay,
      required this.controller});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  List<bool> ishover = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 50,
          width: widget.size.width,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: AppDimensions.width10(context) * 3.1,
                top: AppDimensions.width10(context) * 1.1),
            child: ListTile(
                leading: Text(
                  'S. M. Shakeeb',
                  style: GoogleFonts.prata(
                      textStyle: const TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w400,
                  )),
                ),
                trailing: Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.isPlay == false) {
                          widget.controller.forward();
                          widget.isPlay = true;
                          Scaffold.of(context).openDrawer();
                        } else {
                          widget.controller.reverse();
                          widget.isPlay = false;
                        }
                      });
                    },
                    icon: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: widget.controller),
                    color: Colors.white,
                  );
                })),
          ),
        ),
      ),
    );
  }
}

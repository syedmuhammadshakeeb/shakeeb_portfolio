import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HesderText extends StatefulWidget {
  final Size size;
  const HesderText({super.key, required this.size});

  @override
  State<HesderText> createState() => _HesderTextState();
}

class _HesderTextState extends State<HesderText>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 950) {
        return SlideTransition(
          position: slideAnimation,
          child: Container(
            height: widget.size.height / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: GoogleFonts.prata(
                    textStyle: TextStyle(
                      fontSize: widget.size.height * 0.035,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText('Hi I Am Shakeeb...'),
                    ],
                  ),
                ),
                Text(
                  'Front-End Flutter Developer',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: widget.size.height * 0.035,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                SizedBox(
                  width: widget.size.width / 3,
                  child: Text(
                    'As a skilled Flutter developer, I build high-performance, cross-platform mobile apps with a focus on UI/UX design and state management. I have a strong track record of delivering successful projects.',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: widget.size.height * 0.018,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    )),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return SlideTransition(
          position: slideAnimation,
          child: Container(
            height: widget.size.height / 3.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: GoogleFonts.prata(
                    textStyle: TextStyle(
                      fontSize: widget.size.height * 0.035,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText('Hi I Am Shakeeb...'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Front-End Flutter Developer',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: widget.size.height * 0.032,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
                Text(
                  'As a skilled Flutter developer, I build high-performance, cross-platform mobile apps with a focus on UI/UX design and state management. I have a strong track record of delivering successful projects.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: widget.size.height * 0.018,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  )),
                )
              ],
            ),
          ),
        );
      }
    });
  }
}

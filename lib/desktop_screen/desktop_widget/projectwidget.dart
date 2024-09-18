import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakeeb_portfolio/screen_utils.dart';

class CustomContainer extends StatefulWidget {
  final String image, head, tail;
  final VoidCallback ontap, ontap1;

  const CustomContainer(
      {super.key,
      required this.image,
      required this.head,
      required this.tail,
      required this.ontap,
      required this.ontap1});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? animation;
  Animation<double>? scaleanimation;

  bool isHover = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    animation = Tween(begin: const Offset(0, -0.1), end: Offset.zero)
        .animate(controller!);
    scaleanimation = Tween<double>(begin: 1, end: 1.05).animate(controller!);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
          controller?.forward();
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
          controller?.reverse();
        });
      },
      child: ScaleTransition(
        scale: scaleanimation!,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  height: AppDimensions.height10(context) * 30.1,
                  width: AppDimensions.height10(context) * 30.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey.shade700.withOpacity(0.4),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover)),
                      ),
                      const Divider(
                        color: Colors.white,
                        endIndent: 20,
                        indent: 20,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.head,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.prata(
                                      textStyle: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: widget.ontap,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                isHover ? Colors.white : null,
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.android,
                                            color: isHover
                                                ? Colors.green
                                                : Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: widget.ontap1,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                isHover ? Colors.white : null,
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.github,
                                            color: isHover
                                                ? Colors.black
                                                : Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.tail,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.prata(
                                  textStyle: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.2,
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.w200,
                              )),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

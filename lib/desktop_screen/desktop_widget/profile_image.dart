import 'dart:async';

import 'package:flutter/material.dart';

class ProfileImage extends StatefulWidget {
  final Size size;
  const ProfileImage({super.key, required this.size});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    Timer(const Duration(seconds: 0), () {
      controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 950) {
        return ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            height: widget.size.height / 2,
            width: widget.size.width / 2,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff083053), width: 4),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 20,
                      color: Color(0xff083053),
                      spreadRadius: 10)
                ],
                shape: BoxShape.circle,
                image: const DecorationImage(
                    image: AssetImage('assets/profile.jpg'),
                    fit: BoxFit.fitHeight)),
          ),
        );
      } else {
        return ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            height: widget.size.height / 2,
            width: widget.size.width / 2,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff083053), width: 4),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 20,
                      color: Color(0xff083053),
                      spreadRadius: 10)
                ],
                shape: BoxShape.circle,
                image: const DecorationImage(
                    image: AssetImage('assets/profile.jpg'),
                    fit: BoxFit.fitWidth)),
          ),
        );
      }
    });
  }
}

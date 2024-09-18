import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shakeeb_portfolio/desktop_screen/desktop_widget/headre_text.dart';
import 'package:shakeeb_portfolio/desktop_screen/desktop_widget/profile_image.dart';
import 'package:shakeeb_portfolio/desktop_screen/desktop_widget/social_widget.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  late AssetImage image;

  @override
  void initState() {
    image = const AssetImage('assets/bg.jpg');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 960) {
        return Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width / 14),
                    child: HesderText(
                      size: size,
                    ),
                  ),
                  ProfileImage(
                    size: size,
                  )
                ],
              ),
              SocialWidget(
                size: size,
              ),
            ],
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.only(top: size.height / 9),
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileImage(
                        size: size,
                      ),
                      HesderText(
                        size: size,
                      ),
                    ],
                  ),
                ),
                SocialWidget(
                  size: size,
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}

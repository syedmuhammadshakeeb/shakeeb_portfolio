import 'package:flutter/material.dart';
import 'package:shakeeb_portfolio/desktop_screen/desktop_widget/education.dart';

class ExperienceEducationScreen extends StatefulWidget {
  const ExperienceEducationScreen({super.key});

  @override
  State<ExperienceEducationScreen> createState() =>
      _ExperienceEducationScreenState();
}

class _ExperienceEducationScreenState extends State<ExperienceEducationScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 950) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const EducationSection(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
              ),
              const ExperienceSection()
            ],
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  EducationSection(),
                  SizedBox(
                    height: 30,
                  ),
                  ExperienceSection()
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}

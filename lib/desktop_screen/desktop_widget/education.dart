import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakeeb_portfolio/desktop_screen/desktop_widget/customeducation_text.dart';

import 'package:timeline_tile/timeline_tile.dart';

class EducationWidget extends StatelessWidget {
  final bool isFirst;
  final bool islast;
  final Widget child;
  const EducationWidget(
      {super.key,
      required this.isFirst,
      required this.islast,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: TimelineTile(
        isFirst: isFirst,
        isLast: islast,
        afterLineStyle: const LineStyle(color: Colors.white),
        beforeLineStyle: const LineStyle(color: Colors.white),
        indicatorStyle: IndicatorStyle(
            color: Colors.white,
            iconStyle: IconStyle(
                iconData: Icons.done,
                color: Colors.blueGrey.shade900,
                fontSize: 15)),
        endChild: child,
      ),
    );
  }
}

class EducationSection extends StatefulWidget {
  const EducationSection({
    super.key,
  });

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation = Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero)
        .animate(controller);

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: SlideTransition(
          position: animation,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.4,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade300.withOpacity(0.3),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Education',
                    style: GoogleFonts.prata(
                        textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const EducationWidget(
                    isFirst: true,
                    islast: false,
                    child: CustomTextWidget(
                      mainText: 'BS Software Engineering',
                      subText: 'University of Karachi',
                      text: '02/2022  Present..',
                      text1: '',
                    )),
                const EducationWidget(
                    isFirst: false,
                    islast: false,
                    child: CustomTextWidget(
                      mainText: 'Intermediate',
                      subText: 'Govt. Dehli College',
                      text: '03/2019   03/2021',
                      text1: '',
                    )),
                const EducationWidget(
                    isFirst: false,
                    islast: true,
                    child: CustomTextWidget(
                      mainText: 'Metriculation',
                      subText: 'Ali Foundation Academy',
                      text: '05/2017  05/2019',
                      text1: '',
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation = Tween<Offset>(begin: const Offset(1, -1), end: Offset.zero)
        .animate(controller);
    controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: SlideTransition(
          position: animation,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.4,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade300.withOpacity(0.3),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Experience',
                    style: GoogleFonts.prata(
                        textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const EducationWidget(
                    isFirst: true,
                    islast: false,
                    child: CustomTextWidget(
                      mainText: 'Intern Flutter Developer',
                      subText: 'Quanrio LLP',
                      text: '03/2024  07/2024',
                      text1:
                          'Continuously explored and implemented new technologies to enhance development efficiency, while collaborating closely with QA testers to ensure thorough testing and effective bug resolution.',
                    )),
                const EducationWidget(
                    isFirst: false,
                    islast: true,
                    child: CustomTextWidget(
                      mainText: 'Data Entry Operator',
                      subText: 'Z-G Tech Solution',
                      text: '03/2022   04/2023',
                      text1:
                          'Generated reports, managed data storage and backups, maintained accurate database records, and ensured data integrity and security by adhering to company policies.',
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

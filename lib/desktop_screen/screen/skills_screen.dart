import 'package:flutter/material.dart';
import 'package:shakeeb_portfolio/desktop_screen/desktop_widget/skills_widget.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          SizedBox(
            height: size.height / 7,
          ),
          SkillsWidget(
            size: size,
          ),
        ],
      ),
    );
  }
}

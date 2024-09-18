import 'package:shakeeb_portfolio/desktop_screen/screen/contact_screen.dart';
import 'package:shakeeb_portfolio/desktop_screen/screen/experience_education.dart';
import 'package:shakeeb_portfolio/desktop_screen/screen/project_screen.dart';
import 'package:shakeeb_portfolio/desktop_screen/screen/skills_screen.dart';

class DataSet {
  static const List menuNames = [
    'Home',
    'Skills',
    'About',
    'Project',
    'Contact',
  ];

  static const List<String> isColor = [
    'assets/flutter.png',
    'assets/dart.png',
    'assets/getx.png',
    'assets/provider.png',
    'assets/firebase.png',
    'assets/sqlite.jpg',
    'assets/mvc.jpg',
    'assets/mvvm.png',
    'assets/solid.png',
    'assets/git.png',
    'assets/github.png',
  ];
  static const List<String> text = [
    'Flutter',
    'Dart',
    'Getx',
    'Provider',
    'Firebase',
    'SqLite',
    'MVC',
    'MVVM',
    'SOLID',
    'GIT',
    'GITHUB',
  ];
  static const List<String> links = [
    'https://www.linkedin.com/in/syedshakeeb01/',
    'https://github.com/syedmuhammadshakeeb',
    'https://wa.me/923101301446',
    'https://www.instagram.com/syed_shakeeb_01/',
  ];
  static const List pages = [
    ProjectScreen(),
    SkillsScreen(),
    ExperienceEducationScreen(),
    ContactScreen(),
  ];
}

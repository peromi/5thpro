import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget small;
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width >= 300 && MediaQuery.of(context).size.width < 600;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  Responsive(
      {required this.small, required this.mobile, required this.tablet, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop;
        } else if (constraints.maxWidth >= 800 && constraints.maxWidth < 1200) {
          return tablet;
        } else if (constraints.maxWidth >= 600 && constraints.maxWidth < 800) {
          return mobile;
        }else{
          return small;
        }
      },
    );
  }
}

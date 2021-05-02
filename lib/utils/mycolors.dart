import 'package:flutter/material.dart';

Color darkblue = Color(0xFF003B75);
Color darkgreen = Color(0xFF00E699);
Color lightblue = Color(0xFF006699);
Color deepblue = Color(0xFF002866);
Color darpink = Color(0xFFE61A62);
Color darkyellow = Color(0xFFFFC333);
Color sharpgreen = Color(0xFF25D366);
Color sharpblue = Color(0xFF0088CC);
Color twitter = Color(0xFF1DA1F3);
Color facebook = Color(0xFF0071F6);



Color darkedblue = Color(0xFF002564);


double setwidth = 1080;

List<String> clients = [
  "andela.png",
  "konga.png",
  "sporty.png",
  "microsoft.png",
  "zenith.png"
];

List<String> network = [
  "img3.png",
  "img1.png",
  "img4.png",
  "img5.png",
  "img2.png"
];

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width >= 600 &&
    MediaQuery.of(context).size.width < 800;

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= 800 &&
    MediaQuery.of(context).size.width < 1200;

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1200;


String getUrl ="http://localhost:8000/api/";

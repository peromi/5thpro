import 'package:fifthproweb/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5thpro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Mont",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context)=>Home()
      },

    );
  }
}

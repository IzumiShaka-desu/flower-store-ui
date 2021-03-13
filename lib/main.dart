import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veluv/ui/screen/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      title: 'Veluve flower store',
      debugShowCheckedModeBanner: false,
    );
  }
}

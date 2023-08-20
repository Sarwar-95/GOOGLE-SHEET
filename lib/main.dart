import 'package:flutter/material.dart';
import 'package:google_sheet/mainscreen.dart';
import 'package:google_sheet/sheet_google.dart';


void main() async {
  SheetGoogle.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

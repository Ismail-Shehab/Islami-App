import 'package:flutter/material.dart';

class Quran extends StatefulWidget {
  static String ROUTE_NAME = 'quran';

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
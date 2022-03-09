// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/radio.dart';
import 'package:flutter_application_1/bottomNavBar.dart';
import 'package:flutter_application_1/tasbeeh.dart';
import 'package:flutter_application_1/ahadeth.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    routes: {
      BottomNavBar.ROUTE_NAME :(context) => BottomNavBar(),
      QuranRadio.ROUTE_NAME :(context) => QuranRadio(),
      Tasbeeh.ROUTE_NAME :(context) => Tasbeeh(),
      Ahadeth.ROUTE_NAME :(context) => Ahadeth(),
    },
    initialRoute: BottomNavBar.ROUTE_NAME,
    
  ));
}


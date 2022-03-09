// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ahadeth.dart';
import 'package:flutter_application_1/quran.dart';
import 'package:flutter_application_1/tasbeeh.dart';

import 'Radio.dart';

class BottomNavBar extends StatefulWidget {
  static String ROUTE_NAME = 'homeScreen';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {


  // the index of the selected navigation bar's Icon 
  int bottomNavBarIconIndx = 3;

  // this function will change the color of the selected image.asset icons
  // because selectedItemColor doesn't work on image.asset icons
  Color iconColor (int iconIndex){
    if(iconIndex == bottomNavBarIconIndx){ return Colors.black;}else { return Color(0xfff8f8f8);}
  }

  // array of bodies 
  // every body contains the content of the selected icon
  final screens = [
    QuranRadio(),
    Tasbeeh(),
    Ahadeth(),
    Quran()

  ];
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[bottomNavBarIconIndx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarIconIndx,
        
        onTap: (index) => setState(() => bottomNavBarIconIndx = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffb7935f),
        selectedItemColor: Color(0xff242424),
        showUnselectedLabels: false,
        iconSize: 30,
        selectedFontSize: 18,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/iconRadio.png', color: iconColor(0)),
            label: 'الراديو',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/iconSebha.png', color: iconColor(1)),
            label: 'السبحة'
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/iconHadeth.png', color: iconColor(2)),
            label: 'الأحاديث',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/iconQuran.png', color: iconColor(3)),
            label: 'القرآن'
          ),
        ]
      ),
      
    );
  }
}
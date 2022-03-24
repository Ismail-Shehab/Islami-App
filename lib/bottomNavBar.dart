import 'package:flutter/material.dart';
import 'package:flutter_application_1/ahadeth.dart';
import 'package:flutter_application_1/quran.dart';
import 'package:flutter_application_1/tasbeeh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Radio.dart';

class BottomNavBar extends StatefulWidget { 
  static String ROUTE_NAME = 'homeScreen';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {


  // the index of the selected navigation bar's Icon 
  int bottomNavBarIconIndx = 0; 

  // this function will change the color of the selected image.asset icons
  // because selectedItemColor doesn't work on image.asset icons
  Color iconColor (int iconIndex){
    Color primaryColor = Theme.of(context).focusColor;
    if(iconIndex == bottomNavBarIconIndx){ return primaryColor;}else { return const Color(0xfff8f8f8);} 
  }

  // array of bodies 
  // every body contains the content of the selected icon
  final screens = [
    Quran(),
    Ahadeth(),
    Tasbeeh(),
    QuranRadio(),
  ];
  


  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).focusColor == const Color(0xfffacc1d);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(


            // the background Image


            image: AssetImage(
              isDarkMode ? 'assets/images/dark_bg.png' :
              'assets/images/light_bg.png'),
            fit: BoxFit.fill
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Text(


                // the title

                AppLocalizations.of(context)!.islami,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(

              // the content body


              child: screens[bottomNavBarIconIndx], 
            )
          ]
        )
      ),

      // the bottom Navigation bar

      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: bottomNavBarIconIndx, 
        onTap: (index) => setState(() => bottomNavBarIconIndx = index), 
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedFontSize: 18,
        items: [
          BottomNavigationBarItem(

            // the Quraan icon
            icon: Image.asset('assets/images/icon_quran.png', color: iconColor(0), scale: 1.2),
            // the Quraan text
            label: AppLocalizations.of(context)!.quraan, 
          ),
          BottomNavigationBarItem(
            // the Ahadeth icon
            icon: Image.asset('assets/images/icon_hadeth.png', color: iconColor(1), scale: 1.2), 
            // the Ahadeth text
            label: AppLocalizations.of(context)!.ahadeth, 
          ),
          BottomNavigationBarItem(
            // the Sebha icon
            icon: Image.asset('assets/images/icon_sebha.png', color: iconColor(2), scale: 1.2), 
            // the Sebha text
            label: AppLocalizations.of(context)!.tasbeh 
          ),
          BottomNavigationBarItem( 
            // the Radio Icon
            icon: Image.asset('assets/images/icon_radio.png', color: iconColor(3)),
            // the Radio text
            label: AppLocalizations.of(context)!.radio,
          ),
        ]
      ),
      
    );
  }
}
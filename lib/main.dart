// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/radio.dart';
import 'package:flutter_application_1/bottomNavBar.dart';
import 'package:flutter_application_1/tasbeeh.dart';
import 'package:flutter_application_1/ahadeth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main(List<String> args) {
  runApp(MaterialApp(
                            // light mode
    theme: ThemeData(
      canvasColor: Color.fromARGB(166, 255, 255, 255),
      focusColor: Colors.black,
      dividerColor: Styling.mainColor,
      primaryColor: Styling.mainColor,
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Styling.mainColor,
        selectedItemColor: Colors.black,
        

      )
    ),
                            // dark mode
    darkTheme: ThemeData(
      canvasColor: Color.fromARGB(207, 20, 26, 46),
      appBarTheme: AppBarTheme(
        color: Colors.white
      ),
      focusColor: Color(0xfffacc1d),
      dividerColor: Color(0xfffacc1d),
      primaryColor: Color(0xfffacc1d),
      textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xff141a2e),
        selectedItemColor: Color(0xfffacc1d),
        

      )
    ),
    localizationsDelegates: const[
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,

    ],
    supportedLocales: const[
    Locale('en', ''), // English, no country code
    Locale('ar', ''), // Spanish, no country code
  ],
    
    routes: {
      BottomNavBar.ROUTE_NAME :(context) => BottomNavBar(),
      QuranRadio.ROUTE_NAME :(context) => QuranRadio(),
      Tasbeeh.ROUTE_NAME :(context) => Tasbeeh(),
      Ahadeth.ROUTE_NAME :(context) => Ahadeth(),
    },
    initialRoute: BottomNavBar.ROUTE_NAME,
    
  ));
}



class Styling {
  static Color mainColor = Color(0xffb7935f);
}


import 'dart:math';

import 'package:flutter/material.dart';

class Tasbeeh extends StatefulWidget {
  static String ROUTE_NAME = 'tasbeeh';

  @override
  State<Tasbeeh> createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> {
    int tasbehCount = 0; 
    List<String> azkar = [
      'سبحان الله',
      'الحمد لله',
      'لا إله إلا الله',
      'الله اكبر',
      'لا حول ولا قوة إلا بالله'];
    int azkarTracker = 0; 
    // the angle the sebha will rotate by every click
    double angle = 0;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).focusColor == const Color(0xfffacc1d);
    // the width of the device
    double displayWidth = MediaQuery.of(context).size.width;
    // the height of the device
    double displayHeight = MediaQuery.of(context).size.height;
     
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
          // start of the sebha's head
          Padding(
            padding: EdgeInsets.only(left: displayWidth *.105),
            child: Image(
              image: AssetImage(
                isDarkMode? 'assets/images/head_sebha_dark.png':'assets/images/head_sebha_logo.png'),
              width: 70,
            ),
          ),
          // end of the sebha's head

          // make the sebha's body clickable
          InkWell(
            onTap:() {
              sebhaClicked();
            },
            child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .103),
            child:Transform.rotate(
              angle: angle,
              // start of the sebha's body
              child: Image(
                image: AssetImage(
                isDarkMode? 'assets/images/body_sebha_dark.png' :  'assets/images/body_sebha_logo.png'
                ),
                width: 200,)
            ),
              // end of the sebha's body
          ),
          )
          
          
          ]
        ),
        
        Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * .06),
          child: const Text('عدد التسبيحات', style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
        ),

        // start of the counter
        
        Container(
          decoration: BoxDecoration(
            color: isDarkMode ? const Color.fromARGB(255, 18, 23, 41) : const Color(0xffcab497),
            borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.symmetric(vertical: displayHeight * 0.03, horizontal: displayWidth * 0.045),
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
          
          child: Text(
            tasbehCount.toString(), 
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900
            ),),
        ),
        // end of the counter

        // start of azkar container
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(50)
          ),
          padding: EdgeInsets.symmetric(vertical: displayHeight * 0.007, horizontal: displayWidth * 0.045),
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
          
          child: Text(
            azkar[azkarTracker],
            
            style: TextStyle(
              color: Theme.of(context).canvasColor,
              fontSize: 20,
              fontWeight: FontWeight.w900
            ),),
        ),
        // end of azkar container
      ],
    );
    
  }

  // this function will work when the sebha's body is clicked
  // it increases the counter of tasbeh by 1 every click
  // it changes the azkar every 33 clicks
  // it will reshow the azkar from the beginning if the user clicked throw every zekr 33 times till the end
  // and it will rotate the sebha's body to track every count
  void sebhaClicked() {

    tasbehCount++;
    if (tasbehCount % 33 == 0) {
      azkarTracker++;
    if (azkarTracker == azkar.length) {
      azkarTracker = 0;
    }
    }
    angle += pi / 180 * (360/33);
    setState(() {
      
    });
  }
 
}

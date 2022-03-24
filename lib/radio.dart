import 'package:flutter/material.dart';

class QuranRadio extends StatefulWidget {
  static String ROUTE_NAME = 'radio';

  @override
  State<QuranRadio> createState() => _QuranRadioState();
}

class _QuranRadioState extends State<QuranRadio> {
  
  IconData radioIcon = Icons.play_arrow_rounded;
  
  @override
  Widget build(BuildContext context) {
    
    // the width of the device
    double displayWidth = MediaQuery.of(context).size.width;
    
    return Column(

      children:  [
        const Spacer(flex: 16,),
        Image(
            image: const AssetImage('assets/images/radio_image.png'),
            width: displayWidth * .88,
          ),
        const Spacer(flex: 6,),
        const Text('إذاعة القرآن الكريم',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
        const Spacer(flex: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 5,),
            Icon(
              Icons.skip_previous,
              size: 28,
              color: Theme.of(context).primaryColor,
              ),
            const Spacer(flex: 2,),
            InkWell(
              onTap: playClicked,
              child: Icon(radioIcon,
                size: 60,
                color: Theme.of(context).primaryColor,),
            ),
            const Spacer(flex: 2,),
            Icon(Icons.skip_next,
              size: 34,
              color: Theme.of(context).primaryColor,
              ),
            const Spacer(flex: 5,),
          ],
        ),
        const Spacer(flex: 8,),
      ],
    );
  }
  void playClicked () {
    IconData play =  Icons.play_arrow_rounded;
    IconData pause = Icons.pause_rounded;
    radioIcon == play ? radioIcon = pause : radioIcon = play ;
    setState(() {
      
    });
  }
}
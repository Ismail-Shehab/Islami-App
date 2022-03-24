import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethContent extends StatefulWidget { 

  
  static String ROUTE_NAME = 'hadeth content';
  final String hadeth;
  final ThemeData themeColor;
  const HadethContent(this.hadeth, this.themeColor);
  @override
  State<HadethContent> createState() => _HadethContent();
}

class _HadethContent extends State<HadethContent> {
  
@override
  
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.themeColor.focusColor;
    Color? headerColor = widget.themeColor.textTheme.bodyText2!.color;
    
    bool isDarkMode = textColor == const Color(0xfffacc1d);
    return Scaffold(
      // extends the body behind the appBar to make sure that the background
      // covers the full device's screen
      extendBodyBehindAppBar: true,
      // make the scaffold background color transparent so it doesn't cover the body
      backgroundColor: Colors.transparent,

                                              // start of the appBar
      appBar: AppBar(
        // make the AppBar background color transparent so it doesn't cover the body
        backgroundColor: Colors.transparent,
        elevation: 0,
        // make the back arrow icon at the appBar clickable
        leading: InkWell(
          onTap: () {
            // once clicked the user will be directed to the previous page
            Navigator.pop(context);
          },
          // the back arrow icon at the appBar's leading
          child: Icon(Icons.arrow_back, color: headerColor,)
          ),
        centerTitle: true,
        // the appBar title
        title: Text(AppLocalizations.of(context)!.islami, 
        textAlign: TextAlign.center,
            style: TextStyle(
              color: headerColor,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
        ),
      ),
                                              // end of the appBar




                                              // start of the body
      body: Container(
        // the body padding
        padding: const EdgeInsets.fromLTRB(20, 0, 25, 0), 
        width: double.infinity,
        // the body background image
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isDarkMode? 'assets/images/dark_bg.png':'assets/images/light_bg.png'),
              fit: BoxFit.fill
            ),
        ),
        alignment: Alignment.center,
          child: Column(
            children: [
              // the space between the appBar title and the hadeth's content-box 
              const Expanded(
                flex: 12,
                child: Text(''),
              ),
                                            // the hadeth's content-box              
              Expanded(
                flex: 65,
                child: Container(

                  // the content-box decoration
                  decoration: BoxDecoration(
                    color: widget.themeColor.canvasColor, 
                    borderRadius: BorderRadius.circular(22)

                  ),
                  height: double.infinity,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 40), 
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      // the hadth's name 
                      Text(widget.hadeth.split('\n')[0], 
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: textColor,                                  
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      Divider(
                        indent: 40,
                        endIndent: 40,
                        color: Styling.mainColor,
                        thickness: 1,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20),),
                      Text(
                        // the hadeth body 
                        widget.hadeth.split('\n').skip(1).toString(),
                      
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20
                      ),),
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 10,
                child: Text(''),
              ),
            ],
          ),
        ),
    );
  }

  
}
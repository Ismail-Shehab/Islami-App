// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers,, non_constant_identifier_names 

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class HadethContent extends StatefulWidget { /* cspell: disable-line */

  
  static String ROUTE_NAME = 'hadeth content';/* cspell: disable-line */
  final String hadeth;/* cspell: disable-line */
  const HadethContent(this.hadeth);/* cspell: disable-line */
  @override
  State<HadethContent> createState() => _HadethContent();/* cspell: disable-line */
}

class _HadethContent extends State<HadethContent> {/* cspell: disable-line */
@override
  
  @override
  Widget build(BuildContext context) {
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
          child: const Icon(Icons.arrow_back, color: Colors.black,)
          ),
        centerTitle: true,
        // the appBar title
        title: const Text('إسلامي', /* cspell: disable-line */
        textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
        ),
      ),
                                              // end of the appBar




                                              // start of the body
      body: Container(
        // the body padding
        padding: const EdgeInsets.fromLTRB(20, 0, 25, 0), /* cspell: disable-line */
        width: double.infinity,
        // the body background image
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/light_bg.png'), fit: BoxFit.fill),
        ),
        alignment: Alignment.center,
          child: Column(
            children: [
              // the space between the appBar title and the hadeth's content-box /* cspell: disable-line */
              const Expanded(
                flex: 12,
                child: Text(''),
              ),
                                            // the hadeth's content-box              /* cspell: disable-line */
              Expanded(
                flex: 65,
                child: Container(

                  // the content-box decoration
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(166, 255, 255, 255), /* cspell: disable-line */
                    borderRadius: BorderRadius.circular(22)

                  ),
                  height: double.infinity,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 40), /* cspell: disable-line */
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      // the hadth's name /* cspell: disable-line */
                      Text(widget.hadeth.split('\n')[0], /* cspell: disable-line */
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
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
                        // the hadeth body /* cspell: disable-line */
                        widget.hadeth.split('\n').skip(1).toString(),/* cspell: disable-line */
                      
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
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
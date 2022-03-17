// ignore_for_file:  use_key_in_widget_constructors, prefer_typing_uninitialized_variables, annotate_overrides, no_logic_in_create_state, non_constant_identifier_names, must_call_super
/* cSpell:disable */


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/quran.dart';

class SuraContent extends StatefulWidget {
  static String ROUTE_NAME = 'sura content';

  // the sura index passed from the quran page
  final int suraIndex;

  const SuraContent(this.suraIndex);

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  String sura = '';

  
  fetchSuraData() async{
    String response;

    // get the sura as a string from the txt file
    response = await rootBundle.loadString('assets/text/quran/${widget.suraIndex+1}.txt');

    // turn the sura as a string to a sura as a list of ayat
    List ayaList = response.trim().split("\n");
    String ayaOutput = '';

    // turn the list of aya into a string of aya but the aya number after each aya
    for (var i = 0; i < ayaList.length; i++) {
      ayaOutput += '${ayaList[i].trim()} (${i+1}) ' ;
    }

    setState(() {
      sura = ayaOutput;
    });
  }
  
  @override

  // call the function called fetchSuraData() once this page is loaded
  void initState() {
    fetchSuraData();
  }
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
        title: const Text('إسلامي', 
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
        padding:const EdgeInsets.fromLTRB(20, 0, 25, 0), 
        // the body width 
        width: double.infinity,
        // the body background image
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/light_bg.png'), fit: BoxFit.fill),
        ),
        alignment: Alignment.center,
          child: Column(
            children: [
              // the space between the appBar title and the sura's content-box
              const Expanded(
                flex: 12,
                child: Text(''),
              ),
                                            // the sura's content-box
              Expanded(
                flex: 65,
                child: Container(
                  // the content-box decoration
                  decoration: BoxDecoration(
                    color:const  Color.fromARGB(166, 255, 255, 255), 
                    borderRadius: BorderRadius.circular(22)

                  ),
                  height: double.infinity,
                  width: double.infinity,
                  padding:const EdgeInsets.fromLTRB(20, 40, 20, 40), 
                  child: ListView(
                    padding:const EdgeInsets.all(0),
                    children: [
                      // the sura's name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 80,
                            child: Text('سورة ${Quran.SuraNames[widget.suraIndex]}', 
                                textAlign: TextAlign.right,
                                style:const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                          ),
                          const Expanded(
                            flex: 5,
                            child: Text('')
                          ),
                          // the icon beside the sura's name
                          Expanded(
                            flex: 30,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: const Icon(Icons.play_circle))
                          ),
                            
                          

                        ],
                      ),
                      Divider(
                        indent: 40,
                        endIndent: 40,
                        color: Styling.mainColor,
                        thickness: 1,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20),),
                      // the sura body
                      Text(sura,
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
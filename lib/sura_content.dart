import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuraContent extends StatefulWidget {
  static String ROUTE_NAME = 'sura content';

  // the sura index passed from the quran page
  final int suraIndex;
  // the sura name passed from the quran page
  final String suraName;
  
  // the current theme passed from the quran page
  final ThemeData themeColor;

  const SuraContent(this.suraIndex, this.themeColor, this.suraName);

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
  @override
  Widget build(BuildContext context) {
    Color? headerColor = widget.themeColor.textTheme.bodyText2!.color;
    Color? contentColor = widget.themeColor.focusColor;
    bool isDarkMode = contentColor == const Color(0xfffacc1d);
    bool isArabic = AppLocalizations.of(context)!.islami == 'إسلامى';
    
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
          child:  Icon(Icons.arrow_back, color: headerColor,)
          ),
        
        centerTitle: true,
        // the appBar title
        title: Text(isArabic? 'إسلامى' : 'Islami', 
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
        padding:const EdgeInsets.fromLTRB(20, 0, 25, 0), 
        // the body width 
        width: double.infinity,
        // the body background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
               isDarkMode ? 'assets/images/dark_bg.png': 'assets/images/light_bg.png'),
            fit: BoxFit.fill),
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
                    color: widget.themeColor.canvasColor, 
                    borderRadius: BorderRadius.circular(22)

                  ),
                  height: double.infinity,
                  width: double.infinity,
                  padding:const EdgeInsets.fromLTRB(20, 40, 20, 40), 
                  child: ListView(
                    padding:const EdgeInsets.all(0),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width * 0.12,),
                      // the icon beside the sura's name
                           Icon(Icons.play_circle,color: contentColor),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                            
                          
                      // the sura's name
                           Text('سورة ${widget.suraName}',
                                style: TextStyle(
                                  color: contentColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                
                          ),)
                          
                            
                          

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
                      style: TextStyle(
                        color: contentColor,
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
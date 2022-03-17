// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/hadeth_content.dart';/* cspell: disable-line */
import 'package:flutter_application_1/main.dart';
import 'package:flutter/services.dart' show rootBundle;

class Ahadeth extends StatefulWidget {
  static String ROUTE_NAME = 'ahadeth';

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  String ahadeth = '';
  late List ahadethList = [];
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('assets/text/ahadeth.txt');
    ahadethList = responseText.trim().split('#');
    setState(() {
      ahadeth = responseText;
    });
  }
  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
            padding: EdgeInsets.fromLTRB(0,7,0,0), /* cspell: disable-line */
            
                                                    // start of the ahadeth page
            
            children: [
                                              // start of ahadeth logo 
              
              Image(image: AssetImage('assets/images/hadeth_logo.png'), width: 180, height: 180,), /* cspell: disable-line */
                                              // end of ahadeth logo

                                              // start of table header
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: Styling.mainColor,
                      width: 2.5
                    )
                  )
                ),
                child: Text(
                  'الأحاديث', /* cspell: disable-line */
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ),
                                          // end of table header

            ListView.builder(                                
              padding: EdgeInsets.all(0),
              itemCount: ahadethList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) { 
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context) => HadethContent(ahadethList[index].trim())/* cspell: disable-line */
                      ))
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'الحديث رقم ${index+1}', /* cspell: disable-line */
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                  ),
                );
              },
            )



            ]                                   
    );
  }
}
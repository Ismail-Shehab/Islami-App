import 'package:flutter/material.dart';
import 'package:flutter_application_1/hadeth_content.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            padding: const EdgeInsets.fromLTRB(0,7,0,0), 
            
                                                    // start of the ahadeth page
            
            children: [
                                              // start of ahadeth logo 
              
              const Image(image: AssetImage('assets/images/hadeth_logo.png'), width: 180, height: 180,), 
                                              // end of ahadeth logo

                                              // start of table header
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2.5
                    )
                  )
                ),
                child: Text(
                  // the list header text
                  AppLocalizations.of(context)!.ahadeth, 
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ),
                                          // end of table header

            ListView.builder(                                
              padding: const EdgeInsets.all(0),
              itemCount: ahadethList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) { 
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context) => HadethContent(ahadethList[index].trim(), Theme.of(context))
                      ))
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'الحديث رقم ${index+1}', 
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Quran extends StatefulWidget {
  static String ROUTE_NAME = 'quran';
  

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  // list of sura names
  List<String> suraNames = [
    "الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"
  ];

  // list of number of ayas in every sura
  List<int> suraAyatNum = 
    [
      7,286,200,176,120,165,206,75,129,109,123,111,43,52,99,128,111,110,98,
      135,112,78,118,64,77,227,93,88,69,60,34,30,73,54,45,83,182,88,75,85,54,
      53,89,59,37,35,38,29,18,45,60,49,62,55,78,96,29,22,24,13,14,11,11,18,12,
      12,30,52,52,44,28,28,20,56,40,31,50,40,46,42,29,19,36,25,22,17,19,26,30,
      20,15,21,11,8,8,19,5,8,8,11,11,8,3,9,5,4,7,3,6,3,5,4,5,6,
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
                                                                          // start of the Quran page
            // removing the padding because it has a initial value of 8 
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            children: [
                                                        // start of Quran logo 
              Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Image(image: AssetImage('assets/images/qur2an_screen_logo.png'), width: 180, height: 180,)
              ),
                                                        // end of Quran logo 



                                                        // start of Quran table
                                                        


                                // start table's headers
              IntrinsicHeight(
                child: Row(
                  children: [
                    buildHeaders('عدد الآيات'),
                    VerticalDivider(
                      width: 2,
                      thickness: 2,
                      color: Color(0xffb7935f),
                    ),
                    buildHeaders('اسم السورة'),
                  ],
                ),
              ),
                              // end of table's headers



                              // start of table's content
              ListView.builder(
                // removing the padding because it has a initial value of 8
                padding: EdgeInsets.all(0),
                // adding shrink wrap to give the listview the height of it's child
                shrinkWrap: true,
                // disable the scrolling to able the parent listview to scroll while the child in the viewport
                physics: NeverScrollableScrollPhysics(),
                // give the listview the number of elements it's going to build
                itemCount: suraNames.length,
                itemBuilder: (context, i) {


                  // row styling
                  return  Container(
                      decoration: BoxDecoration(
                        // row's border styling
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xffb7935f),
                            width: 1,
                            style: BorderStyle.solid,
                          )
                        )
                      ),
                      child: IntrinsicHeight(
                        // row content
                        child: Row(
                            children: [
                              // sura name
                              buildSuraList(suraAyatNum, i),
                              VerticalDivider(
                                color: Color(0xffb7935f),
                                thickness: 2,
                                width: 2,
                              ),
                              // the number of ayat in the sura
                              buildSuraList(suraNames, i)
                            ],
                          ),
                      ),
                    
                  );
                }
              )
                              // end of table's content
              
              
              
            ],
          
        );
  }


  // a widget that takes a list and the index
  // and returns the value of the element with that index from the given list
  // (suraAyatNum, 0) returns 7
  // (suraNames, 0) returns "الفاتحه"
  Widget buildSuraList (List sura, int index) => Expanded(
    child:  Container(
      // the padding between the cell and the text inside
      padding: EdgeInsets.all(3),
      child: Text(
        "${sura[index]}",
        // the cell's text alignment
        textAlign: TextAlign.center,
        style: TextStyle(
        // the cell's text font size
        fontSize: 19,
        // the cell's text font weight
        fontWeight: FontWeight.w900
        ),
      ),
    ),
  );


  // a widget that takes String
  // and creates a header name with that string
  Widget buildHeaders (String header) => Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // the headers borders from top and bottom only
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        // header border's color
                        color: Color(0xffb7935f),
                        // header border's width
                        width: 2
                         ))
                  ),
                  child: Text(
                        header,
                        // the header's text alignment
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        // the header's font size
                            fontSize: 25,
                        // the header's font weight
                            fontWeight: FontWeight.w500,
                          )
                        ),
                ),
  );
}
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:stock_manager/WebCrawling.dart';
import 'package:stock_manager/drawer.dart';
import './style.dart' as style;
// import 'package:sizer/sizer.dart';
import './Content.dart';
import "package:http/http.dart" as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import "dart:convert";



List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Article"),value: "Article"),
    DropdownMenuItem(child: Text("Video"),value: "Video"),
    DropdownMenuItem(child: Text("Img"),value: "Img"),
  ];
  return menuItems;
}

void main() {
  runApp(
    MaterialApp(
      theme: style.theme,
      home: MyApp()
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num = 0;
  var selected = 'Article';
  var scroll = ScrollController();
  var listCount = 0;
  var listKeyword = [];
  var listOption = [];
  var keyword;
  var link;
  var title;
  var thumb;
  var get = [false];
  var images;


  getVideoData() async {
    var data;
    data = await(http.get(Uri.parse("https://search.naver.com/search.naver?where=image&sm=tab_jum&query=$keyword")));
    if (data.statusCode == 200){
      final document = parse(data.body);
      images = document.getElementsByClassName('image _listImage')
          .where((e) => e.attributes.containsKey('src'))
          .map((e) => e.attributes['src'])
          .toList();
      setState(() {
        get[listCount-1] = true;
        get.add(false);
      });
    }
  }

  getImgData() async {
    var data;
    data = await(http.get(Uri.parse("https://search.naver.com/search.naver?where=image&sm=tab_jum&query=$keyword")));
    if (data.statusCode == 200){
      final document = parse(data.body);
      images = document.querySelectorAll('.thumb > img')
          .where((e) => e.attributes.containsKey('src'))
          .map((e) => e.attributes['src'])
          .toList();
      setState(() {
        get[listCount-1] = true;
        get.add(false);
      });
    }
  }

  getArticleData() async {
    var data;
    data = await(http.get(Uri.parse("https://search.naver.com/search.naver?where=news&sm=tab_jum&query=$keyword")));
    if (data.statusCode == 200){
      final document = parse(data.body);
      link = document.getElementsByClassName('news_tit')
          .where((e) => e.attributes.containsKey('href'))
          .map((e) => e.attributes['href'])
          .toList();
      title = document.getElementsByClassName('news_tit')
          .where((e) => e.attributes.containsKey('href'))
          .map((e) => e.innerHtml)
          .toList();
      thumb = document.getElementsByClassName('thumb api_get')
          .where((e) => e.attributes.containsKey('src'))
          .map((e) => e.attributes['src'])
          .toList();
      setState(() {
        get[listCount-1] = true;
        get.add(false);
      });
      // print(temp);
      // print(document.getElementsByClassName("xuvV6b BGxR7d"));
    } else {
      throw Exception();
    }

  }

  Keyword(e){
    setState(() {
      keyword = e;
    });
  }


  addKeyword(){
    setState(() {
      listKeyword.add(keyword);
      listOption.add(selected);
      listCount += 1;
    });
  }



  removeKeyword(keyword, option){
    setState(() {
      listKeyword.remove(keyword);
      listOption.remove(option);
      listCount -= 1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('StockManager'),
        // actions: [
        //   TextButton(
        //       onPressed: (){
        //       },
        //       child: FaIcon(FontAwesomeIcons.plus)
        //   ),
        //
        // ]
      ),
      body:Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 8,
                    child: TextFormField(
                      onChanged: (String? e){
                        Keyword(e);
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Keyword',
                      ),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    flex: 4,
                      child: DropdownButton(
                        value: selected,
                        onChanged: (e){
                          setState(() {
                            selected = e.toString();
                          });
                        },
                        items: dropdownItems,
                      )
                  ),
                  Flexible(
                    flex:2,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: Size.fromHeight(60),
                        ),
                        onPressed: () {
                          if(keyword != '' && keyword != null){
                            addKeyword();
                            listOption[listCount-1] == 'Article'
                                ? getArticleData()
                                : listOption[listCount-1] == 'Img'
                                ? getImgData()
                                : listOption[listCount-1] == 'Video'
                                ? getVideoData()
                                : null;
                            // WebCrawling(keyword:keyword, selected:selected);
                          }
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.search, size: 40)
                        ),
                      )
                    ),
                  ],
                ),
              ),
            Expanded(
              child: ListView.builder(
                  controller: scroll,
                  shrinkWrap: true,
                  itemCount: listCount,
                  itemBuilder: (context, index){
                    return get[index] ? Content(listKeyword : listKeyword, listOption : listOption, title : title, link : link, thumb : thumb, images : images,
                      removeKeyword: removeKeyword, externalIndex: index) : CircularProgressIndicator();
                  }
              ),
            )
          ],
        )
      ),
      drawer: Draw(),
    );
  }
}






import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock_manager/drawer.dart';
import './style.dart' as style;
import 'package:sizer/sizer.dart';
import './Content.dart';

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
                        onChanged: (String? e){},
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
                    return Content(listKeyword : listKeyword, listOption : listOption,
                      removeKeyword: removeKeyword, index: index);
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






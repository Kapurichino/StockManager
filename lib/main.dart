import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock_manager/drawer.dart';
import './style.dart' as style;
import 'package:sizer/sizer.dart';

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("None"),value: "None"),
    DropdownMenuItem(child: Text("Video"),value: "Video"),
    DropdownMenuItem(child: Text("Article"),value: "Article"),
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
  var selectedNum = 'None';
  var scroll = ScrollController();

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
        actions: [
          TextButton(
              onPressed: (){
              },
              child: FaIcon(FontAwesomeIcons.plus)
          ),

        ]
      ),
      body:Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 8,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Keyword',
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                      child: DropdownButton(
                        value: selectedNum,
                        onChanged: (String? e){
                          setState(() {
                            selectedNum = e!;
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
                            shape: RoundedRectangleBorder(
                          )
                        ),
                        onPressed: (){

                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.search, size: 40),
                        )
                    )
                  )
                ],
              )
            ),
            Expanded(
              child: ListView.builder(
                controller: scroll,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                    ),
                  );
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



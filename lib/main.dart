import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock_manager/drawer.dart';
import './StyledAppBar.dart' as appbar;
import './style.dart' as style;

void main() {
  runApp(
    MaterialApp(
      theme: style.theme,
      home: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

      ),
      drawer: Draw(),
    );
  }
}


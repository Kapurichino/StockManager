import 'package:flutter/material.dart';

var theme = ThemeData(
    appBarTheme: AppBarTheme(
      color:Colors.white,
      elevation: 3,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(color: Colors.black, fontSize:20),
    ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.black,
    )
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      fixedSize: Size(20,80)
    )
  )



);
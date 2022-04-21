import 'package:flutter/material.dart';
import 'package:flutter_kalpesh_artivatic/common/app_strings.dart';
import 'package:flutter_kalpesh_artivatic/screens/home_page_screen.dart';

/*
Title:Entry Point of a App
Purpose:Entry Point of a App
Author:Kalpesh Khandla
Created On: 21 April 2022
Last Edited On: 21 April 2022
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appNameTxt,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageScreen(),
    );
  }
}

import 'package:dio/dio.dart';
import 'dart:convert';


/*
Title:API Manager
Purpose:Data Request & Response Handler
Author:Kalpesh Khandla
Created On: 21 April 2022
Last Edited On: 21 April 2022
*/


Future<dynamic> getresponse(String url) async {
  try {
   
    Response response = await Dio().get(url);
    print("RESPONSE STATUS CODE : ${response.statusCode}");
  
    if (response.statusCode == 200) {
      print("RES LINE 12 ${response.data}");
      
        return response.data;
    
    } else {
      print("API CALL ELSE PART NOT Response");
      
    }
  } catch (e) {
    print(e);
  }
}
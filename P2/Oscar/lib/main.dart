// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:p2_ds/page/edit_profile_page.dart';
import 'page/profile_page.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  static const String title = 'User Profile';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: ProfilePage(),
    );
  }
}




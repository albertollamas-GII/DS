import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:twitter_app/vista/pages/bottom_navbar.dart';



AppBar buildAppBar(BuildContext context, construct){
  return AppBar(
    leading: 
      const BackButton(
        color: Colors.black, 
      ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}




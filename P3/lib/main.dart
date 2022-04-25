import 'package:flutter/material.dart';
import 'package:twitter_app/vista/pages/splash.dart';
import 'controlador/controlador.dart';
import 'vista/pages/login.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Universitter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}

import 'package:flutter/material.dart';
import 'controlador/ControladorLuis.dart';
import 'vista/pages/login.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  ControladorLuis controlador = new ControladorLuis();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nombre Aplicacion kk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(controlador),
    );
  }
}


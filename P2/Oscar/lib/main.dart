import 'package:flutter/material.dart';
import 'controlador/Controlador_luis.dart';
import 'vista/pages/login.dart';


void main(){
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget{

  ControladorLuis controlador = ControladorLuis();

  MyApp({Key? key}) : super(key: key);

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


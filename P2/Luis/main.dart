import 'package:flutter/material.dart';
import 'package:untitled2/Controlador/ControladorLuis.dart';
import 'package:untitled2/auth/signup.dart';
import 'package:untitled2/auth/register.dart';


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
      home: SignUp(controlador),
    );
  }
}
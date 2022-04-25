import 'package:flutter/material.dart';
import 'controlador/controlador.dart';
import 'vista/pages/login.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  late Controlador controlador;

  @override
  Widget build(BuildContext context) {

    controlador = Controlador();

    return MaterialApp(
      title: 'Universitter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(controlador),
    );
  }
}

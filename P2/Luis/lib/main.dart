import 'package:flutter/material.dart';
import '../vista/Home.dart';
import '../vista/bottom_navbar.dart';
import 'controlador/controladorLuis.dart';
import 'vista/login.dart';
import 'vista/register.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  late ControladorLuis controlador;

  @override
  Widget build(BuildContext context) {

    controlador = ControladorLuis();

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
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Container(
//             margin: EdgeInsets.only(top: 15),
//             width: 70,
//             child: Image.asset('assets/universitter.png') ,
//           ),
//           centerTitle: true,
//         ),
//         bottomNavigationBar: BottomNavBarView(),
//         ),  
//     );

//   }
// }

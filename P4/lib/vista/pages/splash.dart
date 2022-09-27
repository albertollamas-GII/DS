import 'package:flutter/material.dart';
import '../../controlador/controlador.dart';
import '../pages/login.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);
  late Controlador controlador = Controlador();

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Login(widget.controlador)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      body: Center(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset(
              "assets/universitter.png",
              )
            ),
              
            Text("Universitter",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ],
      ),
    ),);
  }
}

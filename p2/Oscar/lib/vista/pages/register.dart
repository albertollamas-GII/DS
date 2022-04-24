import 'package:flutter/material.dart';
import '../../controlador/Controlador_luis.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget{

  ControladorLuis controlador;

  Register(this.controlador, {Key? key}) : super(key: key);


  @override
  _RegisterState createState() => _RegisterState();

}

class _RegisterState extends State<Register> {

  String nombre = "";
  String apellidos = "";
  String nombreUsuario = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff15ac63),
        elevation: 8,
        title: const Text("Registrate"),
      ),
      body:Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Column(
            children: [
              Image.asset(
                "Universitter.PNG",
                height: 200,
              ),
              Form(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 15,left: 15, right: 15),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child:Column(
                          children: [
                            const Text(
                              "Introduce tus datos de registro",
                              style: TextStyle(
                                fontSize: 19
                              )),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Nombre',
                              ),
                              onChanged: (val) => setState(() {
                                nombre = val;
                              }),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Apellidos',
                              ),
                              onChanged: (val) => setState(() {
                                apellidos = val;
                              }),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Nombre de Usuario(\'Como te veran el resto de usuarios\')',
                              ),
                              onChanged: (val) => setState(() {
                                nombreUsuario = val;
                              }),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                              ),
                              onChanged: (val) => setState(() {
                                email = val;
                              }),
                            ),
                            TextFormField(
                              //obscureText: true,
                              decoration: const InputDecoration(
                                hintText: "Contraseña",
                              ),
                              onChanged: (val) => setState(() {
                                password = val;
                              }),
                            )
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom:25)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              child: const Text("Confirmar"),
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff15ac63),
                              ),
                              onPressed: () => clickConfirmationButton(context)
                          )
                        ],
                      )
                    ],
                  )
              ),
            ],
          )
      )
    );
  }

  void clickConfirmationButton(BuildContext context){

  }
}
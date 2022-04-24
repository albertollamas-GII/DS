import 'package:flutter/material.dart';
import '../../controlador/ControladorLuis.dart';

class Login extends StatefulWidget{

  ControladorLuis controlador;

  Login(this.controlador);

  @override
  _SignUpState createState() => _SignUpState();

}

class _SignUpState extends State<Login>{

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff15ac63),
        elevation: 8,
        title: Text("Iniciar Sesion"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          children: [
            Image.asset(
              "Universitter.PNG",
              height: 200,
            ),
            Text("Introduce tus datos de sesion: "),
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
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: 'Email',
                            ),
                            onChanged: (val) => setState(() {
                              email = val;
                            }),
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Enter Password Here",
                              labelText: "Password",
                              icon: Icon(Icons.password),
                            ),
                            onChanged: (val) => setState(() {
                              password = val;
                            }),
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom:25)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          child: Text("Registrate aqui", style : TextStyle(color : Colors.black)),
                          onPressed: () => clickRegistrarseButton(context),
                          style: ElevatedButton.styleFrom(
                            primary : Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                        ),
                        ElevatedButton(
                            child: Text("Confirmar"),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff15ac63),
                            ),
                            onPressed: () => clickLoginButton(context)
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

  void clickLoginButton(BuildContext context){ //ESTO VA EN EL MODELO
    widget.controlador.ConfirmacionLogin(email,password,context);
  }

  void clickRegistrarseButton(BuildContext context){ //ESTO VA EN EL MODELO
    widget.controlador.ClickRegistro(context);
  }


}
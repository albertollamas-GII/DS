// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:twitter_app/vista/pages/home.dart';
import '../vista/pages/register.dart';
import '../vista/pages/login.dart';

class ControladorLuis {
  void ConfirmacionRegistro(String nombre, String apellido, String nombreUsuario, String email, String password, BuildContext context){
    //AlmacenUsuarios.add(new Usuario(nombre,apellido,nombreUsuario,email, password);)
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return new Login(this);
        }
    ));
  }

  void ConfirmacionLogin(String email, String password, BuildContext context){
    if(email == "luisito" && password == "1234"){ //AQUI SE DEBE HACER LA COMPROBACION DE SI ESTA EN EL SISTEMA O NO!
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context){
            return new Home(); // Esto es en verdad a la pagina principal
          }
      ));
    }
  }
  
  void ClickRegistro(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return new Register(this);
        }
    ));
  }
  
  
}


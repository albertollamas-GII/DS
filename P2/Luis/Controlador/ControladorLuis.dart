import 'package:flutter/material.dart';
import 'package:untitled2/auth/signup.dart';
import 'package:untitled2/modelo/usuario.dart';
import '../auth/register.dart';

class ControladorLuis {
  void ConfirmacionRegistro(String nombre, String apellido, String nombreUsuario, String email, String password, BuildContext context){
    //AlmacenUsuarios.add(new Usuario(nombre,apellido,nombreUsuario,email, password);)
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return new SignUp(this);
        }
    ));
  }

  void ConfirmacionLogin(String email, String password, BuildContext context){
    if(email == "luisito" && password == "1234"){ //AQUI SE DEBE HACER LA COMPROBACION DE SI ESTA EN EL SISTEMA O NO!
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context){
            return new Register(this); // Esto es en verdad a la pagina principal
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


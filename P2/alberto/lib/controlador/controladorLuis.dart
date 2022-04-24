import 'package:flutter/material.dart';
import '../modelo/coleccionUsuarios.dart';
import '../vista/bottom_navbar.dart';
import '../modelo/usuario.dart';
import '../vista/login.dart';
import '../vista/register.dart';
import '../modelo/coleccionUsuarios.dart';

class ControladorLuis  {

  late ColeccionUsuarios coleccionUsuarios;

  ControladorLuis(){
    coleccionUsuarios = ColeccionUsuarios();
    Usuario usu = Usuario("luis", "luis", "luis", "luis", "luis");
    coleccionUsuarios.addUsuario(usu);
  }


  void ConfirmacionRegistro(String nombre, String apellido, String nombreUsuario, String email, String password, BuildContext context){
    if(nombre != "" && apellido != "" && nombreUsuario != "" && email != "" && password != ""){
      coleccionUsuarios.addUsuario(Usuario(nombre,apellido,nombreUsuario,email, password));
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context){
            return Login(this);
          }
      ));
    }else{
      crearAlerta("Rellena todos los campos para registrate", context);
    }

  }

  void ConfirmacionLogin(String nombreUsuario, String password, BuildContext context){
    Usuario? usu = coleccionUsuarios.buscarPorNombreUsuario(nombreUsuario);
    if(usu != null) {
      if (usu.getPassword() == password) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) {
              return BottomNavBarView(usu.getSeguidos());
            }
        ));
      } else {
        crearAlerta("ContraseñaIncorrecta", context);
      }
    }else{
      crearAlerta("El usuario no existe", context);
    }
  }
  
  void ClickRegistro(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return Register(this);
        }
    ));
  }

  void crearAlerta(String alerta, BuildContext context){
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(alerta)
          );
        }
    );
  }
  
  
}


// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../modelo/publicacion.dart';
import '../modelo/usuario.dart';
import '../vista/pages/bottom_navbar.dart';
import '../vista/pages/login.dart';
import '../vista/pages/register.dart';
import '../modelo/coleccion_usuarios.dart';
import '../modelo/sesion.dart';

class ControladorLuis  {

  late ColeccionUsuarios coleccionUsuarios;
  late Sesion _sesion;

  ControladorLuis(){
    coleccionUsuarios = ColeccionUsuarios();
  }

  Sesion getSesion(){
    return _sesion;
  }

  void modificaUsuario(Usuario usuario){
    coleccionUsuarios.remUsuario(_sesion.usuario);
    coleccionUsuarios.addUsuario(usuario);
    _sesion.usuario = usuario;
  }
  
  void ConfirmacionRegistro(String nombre, String apellido, String nombreUsuario, String email, String password, BuildContext context){
    if(nombre != "" && apellido != "" && nombreUsuario != "" && email != "" && password != ""){
      coleccionUsuarios.addUsuario(Usuario(nombreUsuario,email, password));
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context){
            return Login(this);
          },
      ));
    }else{
      crearAlerta("Rellena todos los campos para registrate", context);
    }

  }

  void ConfirmacionLogin(String nombreUsuario, String password, BuildContext context){
    Usuario? usu = coleccionUsuarios.buscarPorNombreUsuario(nombreUsuario);
    if(usu != null) {
      if (usu.getPassword() == password) {
        _sesion = Sesion(usu);
        irNavBarSeguidos(usu,context);
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

  void irNavBarSeguidos(Usuario usuario, BuildContext context){

    List<Publicacion> publicaciones = [];
    for(var usu in usuario.getSeguidos()){
      print(usu.getNombreUsuario());
      for(var pub in usu.getTablon()){
        print(pub.getTexto());
        publicaciones.add(pub);
      }
    }

    print("Numero de objetos " + (publicaciones.length).toString());

    publicaciones.sort((a, b) => a.getFecha().compareTo(b.getFecha()));

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return BottomNavBarView(publicaciones, this);
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


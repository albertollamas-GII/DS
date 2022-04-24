import 'package:flutter/material.dart';
import 'package:twitter/modelo/coleccionUsuarios.dart';
import 'package:twitter/modelo/publicacion.dart';
import 'package:twitter/modelo/sesion.dart';
import '../vista/bottom_navbar.dart';
import '../modelo/usuario.dart';
import '../vista/login.dart';
import '../vista/register.dart';
import '../modelo/coleccionUsuarios.dart';

class Controlador  {

  late ColeccionUsuarios coleccionUsuarios;
  late Sesion _sesion;

  Controlador(){
    coleccionUsuarios = ColeccionUsuarios();
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

  Usuario? BuscarUsuarioPorNombre(String nombre){
    return coleccionUsuarios.buscarPorNombreUsuario(nombre);
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

  void irNavBar(Usuario usuario, BuildContext context){
    List<Publicacion> publicaciones = [];
    for(var pub in usuario.getTablon()){
      publicaciones.add(pub);
    }

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return BottomNavBarView(publicaciones,this);
        }
    ));
  }

  void irNavBarSeguidos(Usuario usuario, BuildContext context){

    List<Publicacion> publicaciones = [];
    for(var usu in usuario.getSeguidos()){
      for(var pub in usu.getTablon()){
        publicaciones.add(pub);
      }
    }

    publicaciones.sort((a, b) => a.getFecha().compareTo(b.getFecha()));

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return BottomNavBarView(publicaciones,this);
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

  List<String> getNombresUsuarios(){
    return coleccionUsuarios.getAllNames();
  }
  
  
}


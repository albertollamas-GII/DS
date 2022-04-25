import 'package:flutter/material.dart';
import '../modelo/filtroPalabras.dart';
import '../modelo/gestorFiltros.dart';
import '../modelo/coleccionUsuarios.dart';
import '../modelo/publicacion.dart';
import '../vista/pages/bottom_navbar.dart';
import '../modelo/usuario.dart';
import '../vista/pages/login.dart';
import '../vista/pages/register.dart';
import 'dart:math';

class Controlador  {

  late ColeccionUsuarios coleccionUsuarios;
  late Usuario _sesion;
  late AdminFiltros adminFiltros;
  late FiltroPalabras fPalabras;


  Controlador(){
    coleccionUsuarios = ColeccionUsuarios();
    adminFiltros = new AdminFiltros();
    fPalabras = new FiltroPalabras();
    adminFiltros.setFiltro(fPalabras);
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
        _sesion = usu;
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

  Usuario getSesion(){
    return _sesion;
  }

  void setSesion(String nombreUsuario, String email, String about){
    _sesion.setNombreUsuario(nombreUsuario);
    _sesion.setEmail(email);
    _sesion.setAbout(about);
  }

  Publicacion publicarPost(String texto, Usuario autor){
    List<String> imagenes = ["assets/universitter.png", "assets/etsiit.jpeg", "assets/imagen5.jpeg"];
    var rng = Random();

    Publicacion post = new Publicacion(imagenes[rng.nextInt(3)],texto, autor);
    
    adminFiltros.setTarget(post);
    adminFiltros.ejecutar();
    _sesion.addPublicacion(post); 
    return post;
  }

  
  
}


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twitter_app/modelo/user.dart';
import '../modelo/filtroPalabras.dart';
import '../modelo/gestorFiltros.dart';
import '../modelo/publication.dart';
import '../vista/pages/bottom_navbar.dart';
import '../modelo/user.dart';
import '../vista/pages/login.dart';
import '../vista/pages/register.dart';
import 'dart:math';
import '../modelo/filtroMaxPalabras.dart';

class Controlador  {

  late User _sesion;
  late GestorFiltros gestorFiltros;
  late FiltroPalabras fPalabras;
  late FiltroMaxPalabras fNumPalabras;

  Controlador(){
    gestorFiltros = GestorFiltros();
    fPalabras = FiltroPalabras();
    fNumPalabras = FiltroMaxPalabras();
    gestorFiltros.setFiltro(fPalabras);
    gestorFiltros.setFiltro(fNumPalabras);
  }


  void ConfirmacionRegistro(String nombre, String apellido, String nombreUsuario, String email, String password, BuildContext context){
    if(nombre != "" && apellido != "" && nombreUsuario != "" && email != "" && password != ""){
      User.createUser(name: nombre, surname: apellido, username: nombreUsuario, email: email, password: password, about: "");
      //AÑADIR A LA BASE DE DATOS
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context){
            return Login(this);
          }
      ));
    }else{
      crearAlerta("Rellena todos los campos para registrate", context);
    }

  }

  Future<User> BuscarUsuarioPorNombre(String nombre) async{
    return User.getUserNombre(nombre);
  }

  void ConfirmacionLogin(String nombreUsuario, String password, BuildContext context) async{
    User usu = await BuscarUsuarioPorNombre(nombreUsuario);
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

  void irNavBar(User usuario, BuildContext context) async{
    List<Publication> publicaciones = [];
    for(var pub in await usuario.getTablon()){
      publicaciones.add(pub);
    }

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return BottomNavBarView(publicaciones,this);
        }
    ));
  }

  void irNavBarSeguidos(User usuario, BuildContext context)async{

    List<Publication> publicaciones = [];
    for(var usu in await usuario.getSeguidos()){
      var usu2 = await User.getUserNombre(usu);
      for(var pub in await usu2.getTablon()){
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

  Future<List<String>> getNombresUsuarios() async{
    return User.getAllUser() ;
  }

  User getSesion(){
    return _sesion;
  }

  void iniSesion(User usu){
    _sesion = usu;
  }

  void setSesion(String nombreUsuario, String email, String about){
    _sesion.setNombreUsuario(nombreUsuario);
    _sesion.setEmail(email);
    _sesion.setAbout(about);
  }

  Publication publicarPost(String texto, User autor){
    List<String> imagenes = ["assets/universitter.png", "assets/etsiit.jpeg", "assets/imagen5.jpeg"];
    var rng = Random();
    var imagen = imagenes[rng.nextInt(3)];
    var hora = DateTime.now();
    var username = autor.id;

    Publication post = Publication.fromJson(jsonDecode("{\"img\": \"$imagen\", \"user_id\": $username, \"date\": \"$hora\", \"description\": \"$texto\"}"));
    //AÑADIR A LA BASE DE DATOS

    gestorFiltros.setTarget(post);
    gestorFiltros.ejecutar();
    _sesion.publicar(post);
    return post;
  }

  void seguir(usu,nombre) async {
    var usu_aux = await BuscarUsuarioPorNombre(nombre);
    if( usu_aux != null){
      usu.seguir(usu_aux);
    }
  }
}


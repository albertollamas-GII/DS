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
    return await User.getUser(nombre);
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

  void irNavBar(User usuario, BuildContext context){
    List<Publication> publicaciones = [];
    for(var pub in usuario.getTablon() as List<Publication>){
      publicaciones.add(pub);
    }

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return BottomNavBarView(publicaciones,this);
        }
    ));
  }

  void irNavBarSeguidos(User usuario, BuildContext context){

    List<Publication> publicaciones = [];
    for(var usu in usuario.getSeguidos() as List<User>){
      for(var pub in usu.getTablon() as List<Publication>){
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
    return User.getAllUser() as List<String>;
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

    Publication post = Publication.fromJson(jsonDecode("{img: imagenes[rng.nextInt(3)], user: autor, date: DateTime.now(), text: texto}"));
    //AÑADIR A LA BASE DE DATOS
    
    gestorFiltros.setTarget(post);
    gestorFiltros.ejecutar();
    _sesion.publicar(post);
    return post;
  }

  void seguir(usu,nombre){
    var usu_aux = this.BuscarUsuarioPorNombre(nombre);
    if( usu_aux != null){
      usu.seguir(usu_aux);
    }
  }
}


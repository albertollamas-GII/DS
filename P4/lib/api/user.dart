
import 'dart:convert';
import 'publication.dart';

import 'package:http/http.dart' as http;

class User {
  //int _id;
  String name;
  String surname;
  String username;
  String email;
  String password;
  String img;
  String about;

  static const  String _baseAddress='clados.ugr.es';

  static const  String _applicationName='DS2_4/api/v1/';

  Usuario(String nombre, String apellidos, String nombreUsuario, String passwordn, String emailn){
    img = 'assets/default_profile_image.png';
    name = nombre;
    surname = apellidos;
    username = nombreUsuario;
    email = emailn;
    password = passwordn;
    about = "";
    createUser(name: name, surname: surname, username: username, email: email, password: password, about: about);
  }

  @override
  String toString()
  {
    return "name: '$name', surname: '$surname', username: '$username', email: '$email', password: '$password', img: '$img', about: '$about'";
  }

  String getNombreUsuario(){
    return username;
  }

  String getEmail(){
    return email;
  }

  String getImagen(){
    return img;
  }

  String getAbout(){
    return about;
  }

  String getPassword(){
    return password;
  }

  void setAbout(String text){
    about = text;
    updateUser(usernameAntiguo: username, usernameNuevo: username,email: email,about: text);
  }

  void setNombreUsuario(String nombreUsuario){
    updateUser(usernameAntiguo: username, usernameNuevo: nombreUsuario,email: email,about: about);
    username = nombreUsuario;
  }

  void setEmail(String emailn){
    email = emailn;
    updateUser(usernameAntiguo: username, usernameNuevo: username,email: emailn,about: about);
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'username': username,
    'email': email,
    'password': password,
    'img': img,
    'about': about
  };


  User.fromJson(Map<String, dynamic> json):
        name = json['name'],
        surname=json['surname'],
        username= json['username'],
        email= json['email'],
        password= json['password'],
        img= json['img'],
        about= json['about'];






  //////////// get //////////////////
  static Future<User> getUser(String nombreUsuario) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/users/$nombreUsuario'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get project');
    }
  }

  ////////////// create ///////////////

  static Future<User> createUser({required name, required surname, required username,  required email, required password,required about }) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/users/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'surname': surname,
        'username': username,
        'email': email,
        'password': password,
        'about': about,
        'img': "assets/imagen_profile.jpeg"
      }),
    );
    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create project');
    }

  }


  /////////// update /////////

  Future<User> updateUser({String? usernameAntiguo, String? usernameNuevo, String? email, String? about}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/users/$usernameAntiguo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'surname': surname,
        'username': usernameNuevo!,
        'email': email!,
        'password': password,
        'about': about!,
        'img': "assets/imagen_profile.jpeg"
      }),
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update project');
    }
  }
}

/*

class Usuario{

  late List<Publicacion> _tablon;
  late String _nombre;
  late String _apellidos;
  late String _nombreUsuario;
  late String _email;
  late String _password;
  late String _imagen;
  late String _about;
  late List<Usuario> _seguidos;
  late List<Usuario> _seguidores;



  List<Publicacion> getTablon(){
    return _tablon;
  }

  List<Usuario> getSeguidores(){
    return _seguidores;
  }

  List<Usuario> getSeguidos(){
    return _seguidos;
  }



  bool isSeguido(Usuario usu){
    if(this._seguidos.contains(usu))
      return true;

    else
      return false;
  }

  bool isSeguidor(Usuario usu){
    if(usu.isSeguido(this))
      return true;

    else
      return false;
  }


  void publicar(Publicacion pub){
    if(!this._tablon.contains(pub)){
      this._tablon.add(pub);
    }
  }

  void seguir(Usuario u){
    if(!isSeguido(u) && u != this){
      _seguidos.add(u);
    }
  }

  void addSeguidor(Usuario u){
    if(!_seguidores.contains(u) && u != this)
      _seguidores.add(u);
  }

  void addPublicacion(Publicacion pub){
    if (pub != null)
      _tablon.add(pub);
  }
}

*/


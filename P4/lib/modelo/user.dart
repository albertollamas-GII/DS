
import 'dart:convert';
import 'follow.dart';
import 'publication.dart';

import 'package:http/http.dart' as http;

class User {
  int id;
  String name;
  String surname;
  String username;
  String email;
  String password;
  String img;
  String about;

  static const  String _baseAddress='clados.ugr.es';

  static const  String _applicationName='DS2_4/api';

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
        id = json['id'],
        name = json['name'],
        surname=json['surname'],
        username= json['username'],
        email= json['email'],
        password= json['password'],
        img= json['img'],
        about= json['about'];


  ////////////// index ///////////////////
  static Future<List<String>> getAllUser() async{
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/v1/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );


    if (response.statusCode == 200) {
      List<String> lista = [];
      List<dynamic> jsonlist = jsonDecode(response.body);
      jsonlist.forEach((element) {
        lista.add(element["username"]) ;
      });
      return lista;
    } else {
      throw Exception('Failed to get User');
    }
  }


  //////////// get //////////////////
  static Future<User> getUserNombre(String username) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/v1/users/$username'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get User');
    }
  }


  //////////// get //////////////////
  static Future<User> getUserId(int userid) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/v2/users/$userid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get User');
    }
  }


  ////////////// create ///////////////

  static Future<User> createUser({required name, required surname, required username,  required email, required password,required about }) async {
    var client = http.Client();
    final response = await client.post(
      Uri.https(_baseAddress, '$_applicationName/v1/users/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
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
      client.close();
      return User.fromJson(jsonDecode(response.body));
    } else {
      client.close();
      throw Exception('Failed to create User');
    }

  }


  /////////// update /////////

  Future<User> updateUser({String? usernameAntiguo, String? usernameNuevo, String? email, String? about}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/v1/users/$usernameAntiguo'),
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
      throw Exception('Failed to update User');
    }
  }

  Future<List<Publication>> getTablon() async{
    List<Publication> lista = await Publication.getPublicationsUser(id);
    return lista;
  }

  Future<List<String>> getSeguidores() async{
    List<Follow> lista = await Follow.getFollowers(username);
    List<String> listaSeguidores = [];
    lista.forEach((element){
      listaSeguidores.add(element.follower) ;
    });
    return listaSeguidores;
  }

  Future<List<String>> getSeguidos() async{
    List<Follow> lista = await Follow.getFollowing(username);
    List<String> listaSeguidos = [];
    lista.forEach((element) async{
      listaSeguidos.add( element.following);
    });
    return listaSeguidos;
  }

  Future<bool> isSeguido(User usu) async{
    List<Follow> listaSeguidos = await Follow.getFollowers(username);
    bool encontrado = false;
    listaSeguidos.forEach((element) {
      if(element.follower == usu.username){
        encontrado = true;
        return;
      }
    });
    return encontrado;
  }

  Future<bool> isSeguidor(User usu) async{
    List<Follow> listaSeguidos = await Follow.getFollowing(username);
    bool encontrado = false;
    listaSeguidos.forEach((element) {
      if(element.following == usu.username){
        encontrado = true;
        return;
      }
    });
    return encontrado;
  }

  void publicar(Publication pub){
    if(pub != null){
      Publication.createPublication(img: pub.img, user: id, date: DateTime.now(), text: pub.text);
    }
  }

  void seguir(User usu){
    if(id != usu.id && usu != null){
      Follow.createFollow(follower: username, following: usu.username);
    }
  }

}



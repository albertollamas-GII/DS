
import 'dart:convert';
import 'package:flutter/material.dart';

import 'user.dart';

import 'package:http/http.dart' as http;

class Publication {
  int id;
  String text;
  String user;
  DateTime date;
  String img;

  static const  String _baseAddress='clados.ugr.es';

  static const  String _applicationName='DS/api/';

  Publication({required this.img, required this.user,required this.date,required  this.text, this.id = 0});

  @override
  String toString()
  {
    return "img: $img, username: '$user', date: $date, 'text': $text";
  }

  String getTexto(){
    return text;
  }

  void setTexto(String textn){
    this.text = textn;

    Publication.updateProject(img: img, user: user, date: date, text: textn, id: id);
  }

  Future<User> getUsuario(){ //ESTO VA A DAR POSIBLEMENTE PROBLEMAS
    return User.getUser(user);
  }

  DateTime getFecha(){
    return date;
  }

  String getImagen(){
    return img;
  }

  bool tieneTexto(String texto){
    if(this.text.indexOf(texto) != -1)
      return true;

    return false;
  }

  Map<String, dynamic> toJson() => {
    'img': img,
    'user': user,
    'date': date,
    'text': text
  };


  Publication.fromJson(Map<String, dynamic> json):
        id = json['id'],
        img = json['img'],
        user=json['user'],
        date= DateTime.now(),
        text= json['text'];



  //////////// get //////////////////
  static Future<Publication> getProject(String id) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/v1/projects/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      return Publication.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get project');
    }
  }



  ////////////// create ///////////////

  static Future<Publication> createProject({required img, required user, required date, required text}) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/v1/projects/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
      'img': img!,
      'user': user!,
      'date': date!,
      'text': text!
      }),
    );
    if (response.statusCode == 201) {
      return Publication.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create project');
    }

  }

//////////// delete //////////////////

  static Future<Publication> deleteProject(String id) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, '$_applicationName/v1/projects/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Publication(img: "", user:"", date: DateTime.now(),text:"");
    } else {
      throw Exception('Failed to delete project.');
    }
  }


  /////////// update /////////

  static Future<Publication> updateProject({required img, required user, required date, required text, required int id}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/v1/projects/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'img': img!,
        'user': user!,
        'date': date!,
        'text': text!
      }),
    );
    if (response.statusCode == 200) {
      return Publication.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update project');
    }
  }
}

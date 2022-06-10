
import 'dart:convert';
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

    Publication.updatePublication(img: img, user: user, date: date, text: textn, id: id);
  }

  Future<User> getUsuario() async { //ESTO VA A DAR POSIBLEMENTE PROBLEMAS
    return await User.getUser(user);
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
  static Future<Publication> getPublication(String id) async {
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

  static Future<Publication> createPublication({required img, required user, required date, required text}) async {
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

  static Future<Publication> deletePublication(String id) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, '$_applicationName/v1/projects/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Publication.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete project.');
    }
  }


  /////////// update /////////

  static Future<Publication> updatePublication({required img, required user, required date, required text, required int id}) async {
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

  //////////// getPublicationsDelUsuario //////////////////
  static Future<List<Publication>> getPublicationsUser(int idUsuario) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/v2/projects/$idUsuario'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      List<Publication> lista = [];
      List<dynamic> jsonlist = jsonDecode(response.body);
      jsonlist.forEach((element) {
        lista.add(Publication.fromJson(element)) ;
      });
      return lista;

    } else {
      throw Exception('Failed to get project');
    }
  }

}

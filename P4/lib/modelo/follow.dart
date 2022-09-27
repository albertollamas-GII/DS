
import 'dart:convert';

import 'package:http/http.dart' as http;

class Follow {
  int id;
  String follower;
  String following;

  static const  String _baseAddress='clados.ugr.es';

  static const  String _applicationName='DS2_4/api';

  Follow({required this.id, required this.follower, required this.following});

  @override
  String toString()
  {
    return "id: $id, follower: '$follower', following: $following";
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'follower': follower,
    'following': following
  };


  Follow.fromJson(Map<String, dynamic> json):
        id = json['id'],
        follower=json['follower'],
        following= json['following'];



  //////////// get //////////////////
  static Future<List<Follow>> getFollowers(String nombreUsuario) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/v3/follows/$nombreUsuario'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      List<Follow> lista = [];
      List<dynamic> jsonlist = jsonDecode(response.body);
      jsonlist.forEach((v) {
        lista.add(Follow.fromJson(v)) ;
      });
      return lista;
    } else {
      throw Exception('Failed to get Follow');
    }
  }

  //////////// get //////////////////
  static Future<List<Follow>> getFollowing(String nombreUsuario) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/v2/follows/$nombreUsuario'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      List<Follow> lista = [];
      List<dynamic> jsonlist = jsonDecode(response.body);
      jsonlist.forEach((v) {
        lista.add(Follow.fromJson(v)) ;
      });
      return lista;
    } else {
      throw Exception('Failed to get Follow');
    }
  }

  ////////////// create ///////////////

  static Future<Follow> createFollow({required String follower, required String following}) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/v1/follows/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'follower': follower,
        'following': following
      }),
    );
    if (response.statusCode == 201) {
      return Follow.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Follow');
    }

  }

  //////////// delete //////////////////
  /*static Future<Project> deleteProject(String id) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, '$_applicationName/projects/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Project(id:-1, name: "", info: "Project with id ${id}was deleted", team: -1);
    } else {
      throw Exception('Failed to delete project.');
    }
  }


  /////////// update /////////

  static Future<Project> updateProject({String? name, String? team, required String id}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/projects/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name!,
        'team': team!,
      }),
    );
    if (response.statusCode == 200) {
      return Project.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update project');
    }
  }*/
}



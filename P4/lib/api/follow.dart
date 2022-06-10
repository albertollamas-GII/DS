
import 'dart:convert';

import 'package:http/http.dart' as http;

class Project {
  int id;
  String name;
  int team;
  String? info;

  static const  String _baseAddress='clados.ugr.es';

  static const  String _applicationName='DS/api/v1/';

  Project({required this.id, required this.name, required this.team,  this.info=""});

  @override
  String toString()
  {
    return "id: $id, name: '$name', team: $team";
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'team': team,
    'info': info
  };


  Project.fromJson(Map<String, dynamic> json):
        id = json['id'],
        name=json['name'],
        team= json['team'],
        info= json['info'];



  //////////// get //////////////////
  static Future<Project> getProject(String id) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/projects/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      return Project.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get project');
    }
  }

  ////////////// create ///////////////

  static Future<Project> createProject({required String name, required String team}) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/projects/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'team': team,
        'name': name
      }),
    );
    if (response.statusCode == 201) {
      return Project.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create project');
    }

  }

//////////// delete //////////////////

  static Future<Project> deleteProject(String id) async {
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
  }
}



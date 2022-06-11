import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../modelo/publication.dart';
import '../../modelo/user.dart';
import 'dart:io';

class Home extends StatefulWidget{

  List<Publication> _listaPublicaciones = [];

  ScrollController _scrollController = new ScrollController();

  Home(List<Publication> listaPublicaciones, ScrollController controller){
    _HomeState.load = false;
    _listaPublicaciones=listaPublicaciones;

    _scrollController = controller;
  }



  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  List<User> _listaUsuarios = [];
  static var load = false;

  Future<dynamic> rellenarListaUsuarios() async {
    widget._listaPublicaciones.forEach((element) async{
      _listaUsuarios.add( await User.getUserId(element.user) );
    });
  }


  @override
  Widget build(BuildContext context) {
    if(!load) {
      rellenarListaUsuarios().then(
            (value) {
              setState(() {
                load = true;
              });
        }
      );
    }

    return ListView.builder(
        controller: widget._scrollController,
        reverse: true,
        itemCount: widget._listaPublicaciones.length,
        itemBuilder: (context, index){
          return _postView(widget._listaPublicaciones[index], _listaUsuarios[index] ,context);

        });
  }
}


  Widget _postView(Publication pub, User usu,BuildContext context){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(usu,context),
        _postImage(pub.getImagen()),
        _postCaption(pub.getTexto()),
      ],
    );
  }

  Widget _postCaption(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(texto),
    );
  }

    Widget _postImage(String imagen) {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.asset(imagen,fit: BoxFit.cover)
    );
  }

  Widget _postAuthorRow(User usu, BuildContext context) {
    const double avatarDiameter = 44;
    return GestureDetector(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarDiameter / 2),
                child: Image.asset(usu.getImagen(),fit: BoxFit.cover)
              ),
            ),
          ),
          Text(
            usu.getNombreUsuario(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

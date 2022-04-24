import 'package:flutter/material.dart';
import '../../modelo/publicacion.dart';
import '../../modelo/usuario.dart';

class Home extends StatefulWidget{

  late List<Publicacion> _listaPublicaciones;

  Home(List<Publicacion> listaPublicaciones, {Key? key}) : super(key: key){
    _listaPublicaciones=listaPublicaciones;
  }

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget._listaPublicaciones.length,
        itemBuilder: (context, index) {
          return _postView(widget._listaPublicaciones[index],context);
        });
    
  }
}


Widget _postView(Publicacion pub,BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(pub.getUsuario(),context),
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

  Widget _postAuthorRow(Usuario usu, BuildContext context) {
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


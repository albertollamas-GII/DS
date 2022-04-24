import 'usuario.dart';

class Publicacion{

  late String _texto;
  late Usuario _autor;
  late DateTime _fecha;
  late String _imagen;

  String getTexto(){
    return _texto;
  }

  void setTexto(String text){
    _texto = text;
  }

  Usuario getUsuario(){
    return _autor;
  }

  DateTime getFecha(){
      return _fecha;
  }

  String getImagen(){
    return _imagen;
  }

  Publicacion(String imagen, String texto, Usuario autor) {
    _texto = texto;
    _imagen = imagen;
    _autor = autor;
    _fecha = DateTime.now();
  }
  
  bool tieneTexto(String texto){
    if(_texto.indexOf(texto) != -1) {
      return true;
    }

    return false;
  }

}
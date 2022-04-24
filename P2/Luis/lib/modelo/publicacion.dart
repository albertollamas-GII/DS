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
    this._texto = text;
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
    this._texto = texto;
    this._imagen = imagen;
    this._autor = autor;
    this._fecha = DateTime.now();
  }
  
  bool tieneTexto(String texto){
    if(this._texto.indexOf(texto) != -1)
      return true;

    return false;
  }

}
import 'package:twitter_app/modelo/publicacion.dart';

class Usuario{

  late List<Publicacion> _tablon;

  late String _nombreUsuario;
  late String _email;
  late String _password;
  late String _imagen;
  late String _about;
  late List<Usuario> _seguidos;
  late List<Usuario> _seguidores;

  String getNombreUsuario(){
    return _nombreUsuario;
  }

  void setNombreUsuario(nombre){
    _nombreUsuario = nombre;
  }

  String getEmail(){
    return _email;
  }

  void setEmail(email){
    _email = email;
  }

  String getImagen(){
    return _imagen;
  }

  void setImagen(imagen){
    _imagen = imagen;
  }

  String getAbout(){
    return _about;
  }

  void setAbout(about){
    _about = about;
  }

  List<Publicacion> getTablon(){
    return _tablon;
  }

  String getPassword(){
    return _password;
  }
  
  List<Usuario> getSeguidores(){
    return _seguidores;
  }

  List<Usuario> getSeguidos(){
    return _seguidos;
  }

  Usuario( String nombreUsuario, String password, String email){
    _imagen = 'assets/default_profile_image.png';
    _nombreUsuario = nombreUsuario;
    _email = email;
    _about= "";
    _password = password;
    _seguidores = [];
    _seguidos = [];
    _tablon = [];
  }

  bool isSeguido(Usuario usu){
    if(_seguidos.contains(usu)) {
      return true;
    } else {
      return false;
    }
  }

  bool isSeguidor(Usuario usu){
    if(usu.isSeguido(this)) {
      return true;
    } else {
      return false;
    }
  }

  void publicar(Publicacion pub){
    if(!_tablon.contains(pub)){
      _tablon.add(pub);
    }
  }

  void seguir(Usuario u){
    if(!isSeguido(u) && u != this) {
      _seguidos.add(u);
    }
  }

  void addSeguidor(Usuario u){
    if(!_seguidores.contains(u) && u != this) {
      _seguidores.add(u);
    }
  }

}

import '../modelo/publicacion.dart';

class Usuario{

  late List<Publicacion> _tablon;

  late String _nombre;
  late String _apellidos;
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

  String getEmail(){
    return _email;
  }

  String getImagen(){
    return _imagen;
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

  Usuario(String nombre, String apellidos, String nombreUsuario, String password, String email){
    _imagen = '../../assets/default_profile_image.png';
    _nombre = nombre;
    _apellidos = apellidos;
    _nombreUsuario = nombreUsuario;
    _email = email;
    _password = password;
    _seguidores = [];
    _seguidos = [];
    _tablon = [];
  }

  bool isSeguido(Usuario usu){
    if(this._seguidos.contains(usu))
      return true;

    else
      return false;
  }

  bool isSeguidor(Usuario usu){
    if(usu.isSeguido(this))
      return true;

    else
      return false;
  }

  String getAbout(){
    return _about;
  }

  void publicar(Publicacion pub){
    if(!this._tablon.contains(pub)){
      this._tablon.add(pub);
    }
  }

  void seguir(Usuario u){
    if(!isSeguido(u) && u != this)
      _seguidos.add(u);
  }

  void addSeguidor(Usuario u){
    if(!_seguidores.contains(u) && u != this)
      _seguidores.add(u);
  }

}

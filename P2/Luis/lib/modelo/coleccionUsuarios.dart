import 'package:twitter/modelo/usuario.dart';

class ColeccionUsuarios{

  late List<Usuario> coleccion;

  ColeccionUsuarios(){
    coleccion = <Usuario>[];
  }

  void addUsuario(Usuario usu){
    if(!coleccion.contains(usu)){
      coleccion.add(usu);
    }
  }

  Usuario? buscarPorNombreUsuario(String nombreUsuarioBuscar){
    var usu;
    for(usu in coleccion){
      if(usu.getNombreUsuario() == nombreUsuarioBuscar){
        return usu;
      }
    }
    return null;
  }

}
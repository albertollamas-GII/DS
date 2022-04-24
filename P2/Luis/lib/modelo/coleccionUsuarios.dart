import 'package:twitter/modelo/publicacion.dart';
import 'package:twitter/modelo/usuario.dart';

class ColeccionUsuarios{

  late List<Usuario> coleccion;

  ColeccionUsuarios(){
    coleccion = <Usuario>[];

    Usuario usu = Usuario("luis", "luis", "luis", "luis", "luis");
    usu.publicar(Publicacion("assets/imagen1.jpg","me cago en la puta ostia ya", usu));
    usu.publicar(Publicacion("assets/imagen2.jpg","esto puede salir muy bien", usu));
    Usuario usu2 = Usuario("luis2", "luis2", "luis2", "luis2", "luis2");
    usu2.publicar(Publicacion("assets/imagen3.jpg","Adios le pido", usu2));
    usu2.publicar(Publicacion("assets/imagen4.jpg","Que si me muero sea de amor", usu2));
    usu2.seguir(usu);
    usu.seguir(usu2);
    addUsuario(usu);
    addUsuario(usu2);
  }

  void addUsuario(Usuario usu){
    if(!coleccion.contains(usu)){
      coleccion.add(usu);
    }
  }

  List<String> getAllNames(){
    List<String> listaNombres = [];
    for(var usu in coleccion){
      listaNombres.add(usu.getNombreUsuario());
    }
    return listaNombres;
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
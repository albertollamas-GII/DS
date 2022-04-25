import '../modelo/publicacion.dart';
import '../modelo/usuario.dart';

class ColeccionUsuarios{

  late List<Usuario> coleccion;

  ColeccionUsuarios(){
    coleccion = <Usuario>[];

    Usuario usu = Usuario("Universidad de Granada", "UGR", "@UGR", "UGR", "ugr@ugr.es");
    usu.publicar(Publicacion("assets/imagen1.jpg","Una aplicación diseñada en la #UGR ayuda al estudio del cerebro gracias a la inteligencia artificial. MVPAlab es capaz de realizar detallados análisis de patrones en datos de electroencefalografía cerebral", usu));
    usu.publicar(Publicacion("assets/imagen2.jpg","Comunicado de la UGR en relación al uso de mascarillas y otras medidas de prevención.\nSe establece las siguientes RECOMENDACIONES que pueden consultar en: http://sl.ugr.es/usomascarillas", usu));
    Usuario usu2 = Usuario("Universidad de Sevilla", "US", "@US", "US", "us@us.es");
    usu2.publicar(Publicacion("assets/imagen3.jpg","Vuestros futuros compañeros y compañeras también os asesoran para el acceso y los estudios en la US ", usu2));
    usu2.publicar(Publicacion("assets/imagen4.jpg","Segunda adjudicación definitiva de plazas #SICUE\nPlazo para aceptar, reservar o renunciar: del 21 al 29 de abril", usu2));
    usu2.seguir(usu); usu.addSeguidor(usu2);
    usu.seguir(usu2); usu2.addSeguidor(usu);
    Usuario usu3 = Usuario("Universidad de Malaga", "UMA", "@UMA", "UMA", "uma@uma.es");
    
    addUsuario(usu);
    addUsuario(usu2);
    addUsuario(usu3);
    usu.setImagen("assets/profile_ugr.jpeg");
    usu2.setImagen("assets/profile_sevilla.jpeg");
    usu3.setImagen("assets/profile_uma.png");
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

import 'cadenaFiltros.dart';
import 'publicacion.dart';
import 'filtro.dart';


class GestorFiltros{
  late CadenaFiltros cadenaFiltros;

 void setFiltro(Filtro filtro) {
   this.cadenaFiltros.addFiltro(filtro);
  }

 void setTarget(Publicacion post) {
   this.cadenaFiltros.setTarget(post);
  }

  GestorFiltros(){
   this.cadenaFiltros = new CadenaFiltros();
  }

 void ejecutar() {
   this.cadenaFiltros.ejecutar();
  }
}
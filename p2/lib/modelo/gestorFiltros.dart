import 'cadenaFiltros.dart';
import 'publicacion.dart';
import 'filtro.dart';


class AdminFiltros{
  late CadenaFiltros cadenaFiltros;

 void setFiltro(Filtro filtro) {
   this.cadenaFiltros.addFiltro(filtro);
  }

 void setTarget(Publicacion post) {
   this.cadenaFiltros.setTarget(post);
  }

  AdminFiltros(){
   this.cadenaFiltros = new CadenaFiltros();
  }

 void ejecutar() {
   this.cadenaFiltros.ejecutar();
  }
}
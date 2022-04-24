import 'cadena_filtros.dart';
import 'publicacion.dart';
import 'filtro.dart';


class AdminFiltros{
  late CadenaFiltros cadenaFiltros;

 void setFiltro(Filtro filtro) {
   cadenaFiltros.addFiltro(filtro);
  }

 void setTarget(Publicacion post) {
   cadenaFiltros.setTarget(post);
  }

  AdminFiltros(){
   cadenaFiltros = CadenaFiltros();
  }

 void ejecutar() {
   cadenaFiltros.ejecutar();
  }
}
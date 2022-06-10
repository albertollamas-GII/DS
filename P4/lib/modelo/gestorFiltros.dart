
import 'publication.dart';

import 'cadenaFiltros.dart';
import 'filtro.dart';


class GestorFiltros{
  late CadenaFiltros cadenaFiltros;

 void setFiltro(Filtro filtro) {
   this.cadenaFiltros.addFiltro(filtro);
  }

 void setTarget(Publication post) {
   this.cadenaFiltros.setTarget(post);
  }

  GestorFiltros(){
   this.cadenaFiltros = new CadenaFiltros();
  }

 void ejecutar() {
   this.cadenaFiltros.ejecutar();
  }
  
  List<Filtro> getCadena(){
    return this.cadenaFiltros.getFiltros();
  }
}
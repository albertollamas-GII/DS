import 'filtro.dart';
import 'publicacion.dart';

class CadenaFiltros {

  // ignore: prefer_final_fields
  List<Filtro> _filtros = [];
  late Publicacion _post;


  CadenaFiltros();

  addFiltro(Filtro filtro) {
    _filtros.add(filtro);
  }

  setTarget(Publicacion objetivo){
    _post = objetivo;
  }

  ejecutar() {
    for(int i= 0; i < _filtros.length; i++) {
      _filtros[i].ejecutar(_post);
    }
  }
}

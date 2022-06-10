import 'filtro.dart';
import 'publication.dart';

class CadenaFiltros {

  List<Filtro> _filtros = [];
  late Publication _post;


  CadenaFiltros(){}

  addFiltro(Filtro filtro) {
    _filtros.add(filtro);
  }

  setTarget(Publication objetivo){
    _post = objetivo;
  }

  @override
  ejecutar() {
    for(int i= 0; i < _filtros.length; i++)
      _filtros[i].ejecutar(_post);
  }

  List<Filtro> getFiltros(){
    return _filtros;
  }
}

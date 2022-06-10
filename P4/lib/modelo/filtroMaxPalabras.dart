import 'publication.dart';
import 'filtro.dart';

class FiltroMaxPalabras extends Filtro{

  static const int NUM_MAX_CARACTERES = 250;

  
  
  @override
  String ejecutar(Publication publicacion){
    int contador = 0;
    String resultado = "";

    for(int i = 0; i < publicacion.getTexto().length; i++){ 
      contador++;
      resultado = resultado + publicacion.getTexto()[i];
    }

    if (contador <= NUM_MAX_CARACTERES){
      publicacion.setTexto(resultado);
    } else {
      resultado = "";
      for (int i = 0; i < NUM_MAX_CARACTERES; i++){
        resultado = resultado + publicacion.getTexto()[i];
      }
      publicacion.setTexto(resultado);
    }

    return resultado;
  }

}
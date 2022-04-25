import 'package:test/test.dart';
import 'package:twitter_app/modelo/filtroMaxPalabras.dart';
import 'package:twitter_app/modelo/filtroPalabras.dart';
import 'package:twitter_app/modelo/gestorFiltros.dart';
import 'package:twitter_app/modelo/publicacion.dart';
import 'package:twitter_app/modelo/usuario.dart';


void main(){
  group('pruebas:',(){

    //Pruebas Gestor de filtros
    test('Debe incrementarse el numero de filtros',(){
      final gestorFiltros = new GestorFiltros();
      FiltroPalabras filtroPalabras = new FiltroPalabras();
      FiltroMaxPalabras filtroMaxPalabras = new FiltroMaxPalabras();

      gestorFiltros.setFiltro(filtroPalabras);
      gestorFiltros.setFiltro(filtroMaxPalabras);

      expect(gestorFiltros.getCadena().length, 2);
    });

    test('Deben aplicarse correctamente los filtros',(){
      final gestorFiltros = new GestorFiltros();
      FiltroPalabras filtroPalabras = new FiltroPalabras();
      FiltroMaxPalabras filtroMaxPalabras = new FiltroMaxPalabras();

      gestorFiltros.setFiltro(filtroPalabras);
      gestorFiltros.setFiltro(filtroMaxPalabras);

      String palabra = "TONTO";
      String palabraFiltrada = "*****";
      Usuario user = new Usuario("","","","","");
      Publicacion post = new Publicacion("",palabra,user);
      
      gestorFiltros.setTarget(post);
      gestorFiltros.ejecutar();

      expect( post.getTexto(),palabraFiltrada);

    });
  });
}
import 'package:test/test.dart';
import '../lib/modelo/filtroMaxPalabras.dart';
import '../lib/modelo/filtroPalabras.dart';
import '../lib/modelo/gestorFiltros.dart';
import '../lib/modelo/publicacion.dart';
import '../lib/modelo/usuario.dart';
import '../lib/controlador/controlador.dart';


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

    //Pruebas Controlador
    test('Los datos del usuario tienen que ser válidos', (){
      Controlador controlador = Controlador();
      controlador.iniSesion(Usuario("","","","",""));

      List<String> datosEsperados = ["olopez", "olopez@correo.ugr.es", "Hola buenas tardes"];
      //Inicializo los datos de la sesión del controlador de manera correcta con los datos datosEsperados
      controlador.setSesion(datosEsperados[0], datosEsperados[1], datosEsperados[2]);
      //Introduzco unos datos que deberían de dar error
      controlador.setSesion("", "", "");
      //Estos son los "nuevos" datos, en teoría deberían ser los mismos de antes puesto que hemos hecho un set
      //con datos erróneos, por lo que no se deberáin de actualizar
      List<String> datosNuevos = [controlador.getSesion().getNombreUsuario(),controlador.getSesion().getEmail(),controlador.getSesion().getAbout()];

      expect(datosNuevos, datosEsperados);
    });

    test('No pueden publicarse publicaciones con texto vacio', (){
      Controlador controlador = Controlador();
      Usuario autor = Usuario("juan","alvarez lópez","juanitofueguito","12345","correo@email.es");
      controlador.iniSesion(autor);

      controlador.publicarPost("", autor);

      expect(controlador.getSesion().getTablon().length, 0);

    });

    //Pruebas Usuario
    test('Un usuario no puede seguir a el mismo',(){
      Usuario user = new Usuario("jose", "jose", "jose", "jose", "jose");

      user.seguir(user);

      expect(user.isSeguidor(user),false);
    });

    test('Un usuario no puede publicar dos veces la misma publicación ',(){
      Usuario user = new Usuario("jose", "jose", "jose", "jose", "jose");

      Publicacion pub = new Publicacion("","hola",user);
      user.publicar(pub);
      user.publicar(pub);

      expect(user.getTablon().length,1);
    });

    test('El nombre de usuario no puede contener caracteres especiales', (){
      Usuario usuario = Usuario("oscar", "lopez", "olopez", "1234", "oscar@correo.es");
      usuario.setNombreUsuario("o|lop'ez");

      expect(usuario.getNombreUsuario(), "olopez");
    });
  });
}
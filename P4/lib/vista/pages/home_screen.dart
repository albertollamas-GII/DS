
import 'package:flutter/material.dart';
import '../../controlador/controlador.dart';
import '../../modelo/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  late Controlador _controlador;

  HomeScreen(Controlador controlador){
    _HomeScreenState.load = false;
    _controlador = controlador;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? _textEditingController = TextEditingController();
    List<String> usuariosOnSearch =[];
    List<String> usuarios = [];
    List<String> imagenes = List<String>.filled(5, "");
    static var load = false;


  @override
  Widget build(BuildContext context) {
    if(!load){
      rellenarUsuarios().then(
        (value) => cargarImagenes().then(
          (value) => {
            setState(() {
              load = true;
            })
          }
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff15ac63),
        title: Container(
                decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      usuariosOnSearch = usuarios
                              .where((element) => element.toLowerCase().contains(value.toLowerCase()))
                              .toList();
                    });
                  },
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Buscar'),
                ),
              ),
        actions: [
          TextButton(
            onPressed: (){
              usuariosOnSearch.clear();
              _textEditingController!.clear();
              setState(() {
                _textEditingController!.text = '';
              });
            },
            child: const Icon(
              Icons.close,
              color: Colors.red,
            )
          )
        ],
      ),
      body: _textEditingController!.text.isNotEmpty && usuariosOnSearch.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.search_off,
                      size: 80,
                      color: Color(0xff15ac63),
                    ),
                    Text('No se han encontrado resultados',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  ],
              ),
          )
          : ListView.builder(
            itemCount: _textEditingController!.text.isNotEmpty
                ? usuariosOnSearch.length
                : usuarios.length,
            itemBuilder: (context, index) {
              return Padding(

                padding: const EdgeInsets.all(4.0),
                child: Row(

                  children: [
                    CircleAvatar(
                        child: Image.asset(imagenes[index]),
                        backgroundColor: Colors.transparent,
                    ),
                    GestureDetector(
                      onTap: () async {
                        var usu_aux = await widget._controlador.BuscarUsuarioPorNombre(usuarios[index]);
                        if(usu_aux != null){
                          widget._controlador.irNavBar(usu_aux, context);
                        }
                      },
                      child: Text(
                        _textEditingController!.text.isNotEmpty
                            ? usuariosOnSearch[index]
                            : usuarios[index],
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold
                        ),

                      ),
                    ),
                    const SizedBox(width: 40),
                    MaterialButton(
                        onPressed: () => {
                          ClickBotonSeguir(usuarios[index])
                        },
                        color: Color(0xff15ac63),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xff15ac63))
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              '+ Seguir',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              );
            }),
    );
  }

  void ClickBotonSeguir(String nombre){
    widget._controlador.seguir(widget._controlador.getSesion(),nombre);
  }

  Future<dynamic> rellenarUsuarios() async{
    usuarios = await widget._controlador.getNombresUsuarios();
  }

  Future<dynamic> cargarImagenes() async{
    for(var i = 0; i< usuarios.length; i++){
      // imagenes.add((await widget._controlador.BuscarUsuarioPorNombre(usuarios[i])).getImagen()) ;
      imagenes[i] = (await widget._controlador.BuscarUsuarioPorNombre(usuarios[i])).getImagen();
    }
  }
}

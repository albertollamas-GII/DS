import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modelo/publication.dart';
import '../../vista/pages/profile_page.dart';
import '../../controlador/controlador.dart';
import 'bottom_navbar_pulsado.dart';
import 'home_screen.dart';
import 'Home.dart';

class BottomNavBarView extends StatelessWidget {

  late List<Publication> _listaPublicaciones;
  late Controlador _controlador;

  BottomNavBarView(List<Publication> listaPublicaciones, Controlador controlador){
    _listaPublicaciones = listaPublicaciones;
    _controlador = controlador;
  }

  final ScrollController _controller = ScrollController();

  // This is what you're looking for!
  void _scrollUp() {
    final double start = _controller.position.maxScrollExtent;
    _controller.animateTo(start, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => BottomNavBarPulsado(),
      child: BlocBuilder<BottomNavBarPulsado, int>(builder: (context, state) {
        return Scaffold(
        floatingActionButton: 
                  FloatingActionButton(
                    onPressed: () => {
                      publicarPost(context),
                      _scrollUp(),
                    },
                    child: Icon(Icons.add),
                  ),                
          body: IndexedStack(
            index: state,
            children: [
              Home(_listaPublicaciones,_controller),
              HomeScreen(_controlador),
              ProfilePage(_controlador),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (index) => {
                context.read<BottomNavBarPulsado>().selectTab(index),
                _scrollUp(),
                },
            
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",   
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Buscar", 
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Perfil", 
              ),
            ],
          ),
        );
      }),
    );
  }

  void publicarPost(BuildContext context) {
    final controlPost = new TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Publicar post'),
            content: TextFormField(
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
              controller: controlPost,
            ),
            actions: [
              TextButton(onPressed: () {
                Publication new_post = _controlador.publicarPost(controlPost.text, _controlador.getSesion());
                _listaPublicaciones.add(new_post);
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context){
                      return BottomNavBarView(_listaPublicaciones, _controlador);
                    }
                ));
              },

                  child: Text('Publicar')),
            ],
          );
        }


    );
  }
}
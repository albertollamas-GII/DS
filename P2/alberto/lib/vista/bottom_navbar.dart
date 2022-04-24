import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_app/page/profile_page.dart';
import 'bottom_navbar_pulsado.dart';
import 'home_screen.dart';
import 'Home.dart';
import '../modelo/usuario.dart';

class BottomNavBarView extends StatelessWidget {
    late List<Usuario> _usuariosDeLaPagina;

  BottomNavBarView(List<Usuario> usuariosDeLaPagina){
    _usuariosDeLaPagina = usuariosDeLaPagina;
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarPulsado(),
      child: BlocBuilder<BottomNavBarPulsado, int>(builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => publicarPost(context),
            child: Icon(Icons.add),
          ),
          body: IndexedStack(
            index: state,
            children: [
              Home(),
              HomeScreen(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (index) =>
                context.read<BottomNavBarPulsado>().selectTab(index),
            items: [
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
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
              controller: controlPost,
            ),
            actions: [
              TextButton(onPressed: () {
              },

              child: Text('Publicar')),
            ],
        );
      }

    
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_app/controlador/Controlador_luis.dart';
import 'package:twitter_app/vista/pages/busqueda.dart';
import 'package:twitter_app/vista/pages/profile_page.dart';
import '../../modelo/publicacion.dart';
import '../bottom_navbar_pulsado.dart';
import 'home.dart';

class BottomNavBarView extends StatelessWidget {

  late List<Publicacion> _listaPublicaciones;
  late ControladorLuis _controlador;
  BottomNavBarView(List<Publicacion> listaPublicaciones, ControladorLuis controlador){
    _listaPublicaciones = listaPublicaciones;
    _controlador = controlador;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarPulsado(),
      child: BlocBuilder<BottomNavBarPulsado, int>(builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: [
              Home(_listaPublicaciones),
              HomeScreen(),
              ProfilePage(_controlador),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (index) =>
                context.read<BottomNavBarPulsado>().selectTab(index),
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
}
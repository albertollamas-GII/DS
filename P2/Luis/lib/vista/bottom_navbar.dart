import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter/controlador/controlador.dart';
import 'package:twitter/modelo/publicacion.dart';
import 'package:twitter/modelo/usuario.dart';
import '../vista/bottom_navbar_pulsado.dart';
import '../vista/home_screen.dart';
import 'Home.dart';

class BottomNavBarView extends StatelessWidget {

  late List<Publicacion> _listaPublicaciones;
  late Controlador _controlador;

  BottomNavBarView(List<Publicacion> listaPublicaciones, Controlador controlador){
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
              HomeScreen(_controlador),
              //Perfil(),
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
}
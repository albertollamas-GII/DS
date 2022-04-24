import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter/modelo/usuario.dart';
import '../vista/bottom_navbar_pulsado.dart';
import '../vista/home_screen.dart';
import 'Home.dart';

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
          body: IndexedStack(
            index: state,
            children: [
              Home(_usuariosDeLaPagina),
              HomeScreen(),
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
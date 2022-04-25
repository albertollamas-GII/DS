// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../modelo/usuario.dart';
import '../widgets/numbers_widget.dart';
import '../widgets/profile_widget.dart';
import 'edit_profile_page.dart';
import '../../controlador/controlador.dart';


class ProfilePage extends StatefulWidget {

  late Controlador _controlador;

  ProfilePage(Controlador controlador){
    _controlador = controlador;
  }

  @override
  _ProfilePageState createState() => _ProfilePageState();


}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context){

    return 
      Scaffold(
        body: 
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: widget._controlador.getSesion().getImagen(),
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage(widget._controlador)),
                );
              },
            ),
            const SizedBox(height : 24),
            buildName(widget._controlador.getSesion()),
            const SizedBox(height : 24),
            NumbersWidget(),
            const SizedBox(height : 48),
            buildAbout(widget._controlador.getSesion()),

          ],
        ),
    ); 

  }

  //El usuario tiene que ser el de la sesión
  Widget buildName(Usuario user) => Column(
    children: [
      Text(
        user.getNombreUsuario(),
        style:const TextStyle(color: Colors.black, fontWeight:  FontWeight.bold, fontSize: 20)
      ),
      const SizedBox(height: 4),
      Text(
        user.getEmail(),
        style: const TextStyle(color: Colors.grey),
      ),
    ],
  );

  Widget buildAbout(Usuario user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        Text(
          'About',
          style: TextStyle(color: Colors.black, fontWeight:  FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 16),
        Text(
          user.getAbout(),
          style: TextStyle(color: Colors.black, height: 1.4, fontSize: 16),
        ),
      ],
    ),
  );
}


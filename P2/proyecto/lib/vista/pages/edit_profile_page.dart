import 'package:flutter/material.dart';
import '../../modelo/publicacion.dart';
import 'profile_page.dart';
import '../../controlador/controlador.dart';
import '../../modelo/usuario.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/textfield_widget.dart';


class EditProfilePage extends StatefulWidget {

  late Controlador _controlador;



  EditProfilePage(Controlador controlador){
    _controlador = controlador;
  }

  @override
  _EditProfilePageState createState() => _EditProfilePageState();


}

class _EditProfilePageState extends State<EditProfilePage> {

  String nombreUsuario = "";
  String email = "";
  String about = "";

  //Tengo que cambiar para que los datos del usuario sean los de la sesión
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: buildAppBar(context, true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: widget._controlador.getSesion().getImagen(),
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          TextFormField(
            decoration:  InputDecoration(
              labelText: 'Full name',
              hintText: widget._controlador.getSesion().getNombreUsuario()
            ),
            onChanged: (val) => {nombreUsuario = val}
          ),
          const SizedBox(height: 24),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                  hintText: widget._controlador.getSesion().getEmail()
              ),
              onChanged: (val) => {email = val}
          ),
          const SizedBox(height: 24),
          TextFormField(
              decoration:  InputDecoration(
                labelText: 'About',
                hintText: widget._controlador.getSesion().getAbout()
              ),
              onChanged: (val) => {about = val}
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 20),
              onPressed: (){
                updateProfile();
                widget._controlador.irNavBarSeguidos(widget._controlador.getSesion(), context);
                },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Confirmar cambios',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              )
          ),
        ],
      )
  );

  updateProfile(){
    widget._controlador.setSesion(nombreUsuario, email, about);
  }

}


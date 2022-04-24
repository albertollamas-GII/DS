import 'package:flutter/material.dart';
import 'package:twitter_app/controlador/Controlador_luis.dart';
import 'package:twitter_app/modelo/usuario.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/textfield_widget.dart';


class EditProfilePage extends StatefulWidget {

  late Usuario _user;
  late ControladorLuis _controlador;

  late TextEditingController nombreController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController aboutController = TextEditingController();

  EditProfilePage(ControladorLuis controlador){
    _controlador = controlador;
    _user = controlador.getSesion().usuario;
  }

  @override
  _EditProfilePageState createState() => _EditProfilePageState();

  
}

class _EditProfilePageState extends State<EditProfilePage> {
  //Tengo que cambiar para que los datos del usuario sean los de la sesión
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context, true),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      physics: const BouncingScrollPhysics(),
      children: [
        ProfileWidget(
          imagePath: widget._user.getImagen(), 
          isEdit: true,
          onClicked: () async {},
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Full name',
          controller: widget.nombreController,
          text: widget._user.getNombreUsuario(),
          onChanged: (name) { }
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Email',
          controller: widget.emailController, 
          text: widget._user.getEmail(), 
          onChanged: (email) {}
        ),        
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'About', 
          controller: widget.aboutController,
          text: widget._user.getAbout(), 
          maxLines: 5,
          onChanged: (about){}
        ),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 20),
        onPressed: (){updateProfile();},
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
      setState(() {
        
        widget._user.setNombreUsuario(widget.nombreController.text);
        widget._user.setEmail(widget.emailController.text);
        widget._user.setAbout(widget.aboutController.text);
        widget._controlador.coleccionUsuarios.remUsuario(widget._controlador.getSesion().usuario);
        widget._controlador.coleccionUsuarios.addUsuario(widget._user);
      });
  }
}


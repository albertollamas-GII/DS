import 'package:flutter/material.dart';
import 'package:twitter_app/modelo/publication.dart';
import 'package:twitter_app/modelo/user.dart';
import '../../controlador/controlador.dart';

class NumbersWidget extends StatelessWidget{
  // NumbersWidget({Key? key}) : super(key: key);
  
  late Controlador _controlador;

  NumbersWidget(Controlador controlador){
    _controlador = controlador;
  }

    @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, (_controlador.getSesion().getTablon() as List<Publication>).length.toString(), 'Posts'),
          buildDivider(),
          buildButton(context, (_controlador.getSesion().getSeguidos() as List<User>).length.toString(), 'Following'),
          buildDivider(),
          buildButton(context, (_controlador.getSesion().getSeguidores() as List<User>).length.toString(), 'Followers'),
        ],
      );
      
  // ignore: sized_box_for_whitespace
  Widget buildDivider() => Container(
        height: 24,
        child: const VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 20),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}

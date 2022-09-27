import 'package:flutter/material.dart';
import 'package:twitter_app/modelo/publication.dart';
import 'package:twitter_app/modelo/user.dart';
import '../../controlador/controlador.dart';
import '../../modelo/follow.dart';

class NumbersWidget extends StatefulWidget {
  // NumbersWidget({Key? key}) : super(key: key);

  late Controlador _controlador;


  NumbersWidget(Controlador controlador) {
    _controlador = controlador;
    _NumbersState.load = false;
  }




  @override
  State<StatefulWidget> createState() => _NumbersState();



}
  class _NumbersState extends State<NumbersWidget>{
    String posts = "0";
    String following = "0";
    String followers = "0";

    static var load = false;



    Future<dynamic>  buildButton1() async{
      List<Publication> tablon = await widget._controlador.getSesion().getTablon();
      posts = tablon.length.toString();
    }

    Future<dynamic> buildButton2() async{
      List<String> seguidos = await widget._controlador.getSesion().getSeguidos();
      following = seguidos.length.toString();
    }

    Future<dynamic> buildButton3() async{
      List<String> seguidores = await widget._controlador.getSesion().getSeguidores();
      print(seguidores.length);
      followers = seguidores.length.toString();
    }

    @override
    Widget build(BuildContext context) {
      if(!load) {
        buildButton1().then(
              (value) => buildButton2().then(
                  (value) => buildButton3().then(
                      (value) {
                    setState(() {
                      load = true;
                    });
                  }
              )
          )
        );
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, posts , 'Posts'),
          buildDivider(),
          buildButton(context, following, 'Following'),
          buildDivider(),
          buildButton(context, followers, 'Followers'),
        ],
      );
    }


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



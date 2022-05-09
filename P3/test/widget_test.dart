// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/vista/pages/login.dart';
import '../lib/modelo/usuario.dart';
import '../lib/controlador/controlador.dart';
import '../lib/modelo/publicacion.dart';
import '../lib/vista/pages/bottom_navbar.dart';
import '../lib/vista/pages/profile_page.dart';

void main() {
  group('pruebasWidget:',()
  {
    testWidgets("Funciona el boton para publicar una publicacion", (WidgetTester tester) async {
      Controlador controlador = Controlador();
      controlador.iniSesion(Usuario("", "", "", "", ""));
      List<Publicacion> list = [];

      await tester.pumpWidget(
          MaterialApp(home: BottomNavBarView(list, controlador)));

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets("Funciona el boton de editar perfil", (WidgetTester tester) async {
      Controlador controlador = Controlador();
      controlador.iniSesion(Usuario("", "", "", "", ""));


      await tester.pumpWidget(MaterialApp(home: ProfilePage(controlador)));

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets("Funciona el login",  ( WidgetTester tester ) async{
      Controlador controlador = Controlador();

      await tester.pumpWidget(MaterialApp(home:Login(controlador)));

      await tester.enterText(find.byKey(Key("Nombre")), "@ugr");
      await tester.enterText(find.byKey(Key("Password")), "ugr");

      await tester.tap(find.byKey(Key("Confirmar")));
      await tester.pump();

      expect (find.byType(BottomNavBarView), findsOneWidget);
    });


  });
}

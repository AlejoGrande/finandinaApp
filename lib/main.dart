import 'package:flutter/material.dart';

import 'package:test_finandina/src/app.dart';

Future<void> main() async {
  //Codigo para inicializar preferencias de usuario de ser necesario antes de la ejecucion de la aplicacion
  //WidgetsFlutterBinding.ensureInitialized();
  //final prefs = new PreferenciasUsuario();
  //await prefs.initPrefs();

  //Bloquear orientacion del dispositivo segun el diseño
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //  .then((_) {
  runApp(const AppState());
  // });
}

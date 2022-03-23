import 'package:flutter/material.dart';
import 'package:test_finandina/src/models/colors.dart';
import 'package:test_finandina/src/routes.dart';
import 'package:test_finandina/src/ui/pages/splash_page.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Rutas",
        initialRoute: "/",
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => const SplashPage());
        },

        // home: HomeController(title: 'Compilación Movil'),
        theme: ThemeData(
         
          // Define el Brightness y Colores por defecto
          //brightness: Brightness.dark,
          primaryColor: Colors.blueAccent,
          //accentColor: Colors.cyan[600],
          // Define la Familia de fuente por defecto
          fontFamily: 'OpenSans',
          // Define el TextTheme por defecto. Usa esto para espicificar el estilo de texto por defecto
          // para cabeceras, títulos, cuerpos de texto, y más.
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            headline3: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            headline4: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            headline5: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
            subtitle2: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
            bodyText1: TextStyle(
                fontSize: 17.0,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_finandina/src/models/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 150.0,
            ),
          ),
          Container(
            width: size.width * 0.80,
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(children: <Widget>[
              const Text('INGRESO',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xddd9241c))),
              const SizedBox(height: 20.0),
              _createEmail(),
              const SizedBox(height: 20.0),
              _buttonLogin(context),
              const SizedBox(height: 2.0),

              const SizedBox(height: 7.0),
              //SizedBox(height: 20.0),
            ]),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "registerPage");
            },
            child: const Text(
              "¿aun no estas registrado?",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 80.0),
        ],
      ),
    );
  }

  Widget _createEmail() {
    final TextEditingController controller = TextEditingController(text: "");

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          icon: Icon(Icons.person_outline, color: Color(0xFF1d3380)),
          hintText: 'Numero de documento',
          labelText: 'Usuario',
          // counterText: snapshot.data,
        ),
      ),
    );
  }
}

Widget _buttonLogin(BuildContext context) {
  // final TextEditingController controller = TextEditingController(text: "");

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 40), primary: primaryColor),
      onPressed: () {
        Navigator.pushReplacementNamed(context, "home");
      },
      child: const Text("INGRESAR"),
    ),
  );
}

//AGREGAR MENSAJE DE ERROR , NO TIENE ROLL ASIGNADO

Widget _crearFondo(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final fondoMorado = Container(
    height: size.height * 1,
    width: double.infinity,
    color: primaryColor,
  );

  final circulo = Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: const Color.fromRGBO(255, 255, 255, 0.05),
    ),
  );

  return Stack(
    children: <Widget>[
      fondoMorado,
      Positioned(
        top: 90.0,
        left: 30.0,
        child: circulo,
      ),
      Positioned(
        top: -40.0,
        right: -30.0,
        child: circulo,
      ),
      Positioned(
        bottom: -50.0,
        right: -10.0,
        child: circulo,
      ),
      Positioned(
        bottom: 120.0,
        right: 20.0,
        child: circulo,
      ),
      Positioned(
        bottom: -50.0,
        left: -20.0,
        child: circulo,
      ),
      Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              width: double.infinity,
              height: 125,
              child: Hero(
                tag: "unique",
                child: SvgPicture.asset(
                  "lib/src/resources/img/banco-finandina-blanco.svg",
                ),
              ),
            ),
            const SizedBox(height: 5.0, width: double.infinity),
            const Text('',
                style: TextStyle(
                    color: Color(0xFF1d3380),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold))
          ],
        ),
      )
    ],
  );
}

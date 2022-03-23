import "package:flutter/material.dart";

class Constrans {
  static const String logOut = "Cerrar sesion";

  static const List<String> choices = <String>[logOut];
}

logOut(BuildContext context) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
}

Widget icono(String choice) {
  if (choice == "Lenguaje" || choice == "Language") {
    return const Icon(Icons.language, color: Colors.black);
  } else {
    return const Icon(Icons.exit_to_app, color: Colors.black);
  }
}

void choiceAction(String choice, BuildContext context) {
  print("holiii");
 
  if (choice == "Logout" || choice == "Cerrar sesion") {
   
    Navigator.of(context)
        .pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
  }
}

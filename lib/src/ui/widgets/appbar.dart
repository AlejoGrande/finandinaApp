import 'package:flutter/material.dart';
import 'package:test_finandina/src/models/colors.dart';

import 'drawer.dart';

class AppbarPersonalizada extends StatelessWidget {
  final String titulo;
  const AppbarPersonalizada({
    required this.titulo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      backgroundColor: primaryColor,
      title: Text("PAGINA PRINCIPAL"),
      actions: <Widget>[
        PopupMenuButton<String>(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            onSelected: (value) => choiceAction(value, context),
            itemBuilder: (BuildContext context) {
              return Constrans.choices.map((String choice) {
                return PopupMenuItem<String>(
                    value: choice,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(choice,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        icono(choice),
                      ],
                    ));
              }).toList();
            }),
      ],
    );
  }
}

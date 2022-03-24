import 'package:flutter/material.dart';
import 'package:test_finandina/src/models/accounts_model.dart';

import 'package:test_finandina/src/models/colors.dart';

import 'package:test_finandina/src/providers/transaction_provider.dart';
import 'package:test_finandina/src/ui/widgets/appbar.dart';
import 'package:test_finandina/src/ui/widgets/itemFormularioNumber.dart';

class FuncionesPage extends StatefulWidget {
  const FuncionesPage({Key? key}) : super(key: key);

  @override
  _FuncionesPageState createState() => _FuncionesPageState();
}

class _FuncionesPageState extends State<FuncionesPage> {
  @override
  Widget build(BuildContext context) {
    final Accounts card =
        ModalRoute.of(context)!.settings.arguments as Accounts;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarPersonalizada(titulo: "TRANSACCIONES"),
      ),
      body: _body(context, card),
    );
  }
}

_body(BuildContext context, Accounts card) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 60), primary: primaryColor),
            onPressed: () {
              Navigator.pushNamed(context, "transaction", arguments: card);
            },
            child: const Text(
              "TRANSFERENCIA",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 60), primary: primaryColor),
            onPressed: () {
              Navigator.pushNamed(context, "historial", arguments: card);
            },
            child: const Text(
              "HISTORIAL TRANSFERENCIAS",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
      ],
    ),
  );
}

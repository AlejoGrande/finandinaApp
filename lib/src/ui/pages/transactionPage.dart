import 'package:flutter/material.dart';
import 'package:test_finandina/src/models/clients_model.dart';
import 'package:test_finandina/src/models/colors.dart';
import 'package:test_finandina/src/providers/client_provider.dart';
import 'package:test_finandina/src/ui/widgets/appbar.dart';
import 'package:test_finandina/src/ui/widgets/creditCard.dart';
import 'package:test_finandina/src/ui/widgets/itemFormularioNumber.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarPersonalizada(titulo: "TRANSACCIONES"),
      ),
      body: _body(context),
    );
  }
}

_body(BuildContext context) {
  final node = FocusScope.of(context);
  TextEditingController accountDest = new TextEditingController();
  TextEditingController valor = new TextEditingController();
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: <Widget>[
        ItemFormularioNumber(
          controller: accountDest,
          textoTitulo: "Cuenta destino",
          lbldecorator: "Ingrese numero de cuenta",
          key: null,
          node: node,
        ),
        ItemFormularioNumber(
          controller: accountDest,
          textoTitulo: "Valor a enviar",
          lbldecorator: "Ingrese valor",
          key: null,
          node: node,
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(150, 40), primary: primaryColor),
          
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("ENVIAR"),
        ),
      ],
    ),
  );
}

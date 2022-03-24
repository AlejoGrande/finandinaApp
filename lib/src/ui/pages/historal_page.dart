import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_finandina/src/models/accounts_model.dart';
import 'package:test_finandina/src/models/clients_model.dart';
import 'package:test_finandina/src/models/colors.dart';
import 'package:test_finandina/src/models/trasactions_model.dart';
import 'package:test_finandina/src/providers/client_provider.dart';
import 'package:test_finandina/src/providers/transaction_provider.dart';
import 'package:test_finandina/src/ui/widgets/appbar.dart';
import 'package:test_finandina/src/ui/widgets/itemFormularioNumber.dart';

class HistorialPage extends StatefulWidget {
  const HistorialPage({Key? key}) : super(key: key);

  @override
  _HistorialPageState createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  @override
  Widget build(BuildContext context) {
    final Accounts card =
        ModalRoute.of(context)!.settings.arguments as Accounts;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarPersonalizada(titulo: "HISTORIAL TRANSACCIONES"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: _body(context, card),
      ),
    );
  }
}

_body(BuildContext context, Accounts card) {
  final providerTransaction = new TransactionProvider(); //cr

  return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: FutureBuilder(
          future: providerTransaction.getTransactions(card.id),
          builder: (context, AsyncSnapshot<List<Transaction>?> snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, i) => Container(
                        child: snapshot.data?[i] != null
                            ? ItemTransaction(
                                transaction: snapshot.data![i], account: card)
                            : const Center(
                                child: Text("No hay tarjetas asignadas"),
                              )))
                : const Center(child: CircularProgressIndicator());
          }));
}

class ItemTransaction extends StatelessWidget {
  final Transaction transaction;
  final Accounts account;
  const ItemTransaction({
    required this.account,
    required this.transaction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     NumberFormat f = new NumberFormat("#,###.0#", "es_US");
    return Container(
      child: Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            ListTile(
              //leading: Icon(Icons.notifications, color: Colors.red),
              title: transaction.from.id == account.id
                  ? Text(
                      ("Valor: -\$" + f.format(transaction.value)),
                      style: TextStyle(color: Colors.red),
                    )
                  : Text("Valor: +\$" + f.format(transaction.value),
                  style: TextStyle(color: Colors.green.shade700)),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("De: " + transaction.from.accountNumber.toString()),
                  Text("Para:" + transaction.to.accountNumber.toString()),
                  Text(
                      "fecha: ${transaction.to.created.day}/${transaction.to.created.month}/${transaction.to.created.year}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

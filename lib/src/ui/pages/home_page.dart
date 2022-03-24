import 'package:flutter/material.dart';
import 'package:test_finandina/src/models/clients_model.dart';
import 'package:test_finandina/src/models/colors.dart';
import 'package:test_finandina/src/providers/client_provider.dart';
import 'package:test_finandina/src/ui/widgets/appbar.dart';
import 'package:test_finandina/src/ui/widgets/creditCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String id =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarPersonalizada(titulo: "PAGINA PRINCIPAL"),
      ),
      body: RefreshIndicator(
          onRefresh: () =>
              Navigator.pushReplacementNamed(context, "home", arguments: id),
          child: _body(context,id)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

_body(BuildContext context,String id) {
  final providerClient = new ClientProvider(); //cr

  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: FutureBuilder(
        future: providerClient.getClient(id),
        builder: (context, AsyncSnapshot<Clients?> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data?.accounts?.length,
                  itemBuilder: (context, i) => Container(
                      child: snapshot.data?.accounts != null
                          ? CreditCard(creditCard: snapshot.data!.accounts![i])
                          : const Center(
                              child: Text("No hay tarjetas asignadas"),
                            )))
              : const Center(child: CircularProgressIndicator());
        }),
  );
}

//snapshot.data!.accounts![i]




import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_finandina/src/models/trasactions_model.dart';

class TransactionProvider {
  final _url = Uri.parse('https://finandina.herokuapp.com/transactions');

  Future<String?> postCreateTransaction(
      String from, String to, String value) async {
    final Map<String, dynamic> data = {
      "from": from,
      "to": to,
      "value": value,
    };
    final resp = await http.post(_url, body: (data));
    final decodedData = json.decode(resp.body);
    if (resp.statusCode == 200) {
      return "true";
    } else {
      print("es null");
      return null;
    }
  }

  Future<List<Transaction>?> getTransactions(String id) async {
    final _url = Uri.parse('https://finandina.herokuapp.com/transactions/$id');
    final resp = await http.get(_url);
    final List t = jsonDecode(resp.body);
    final List<Transaction> transactionsList =
        t.map((str) => Transaction.fromMap(str)).toList();
    if (resp.statusCode == 200) {
      print(transactionsList);
      //notifyListeners();
      return transactionsList;
    } else {
      return null;
    }
  }
}


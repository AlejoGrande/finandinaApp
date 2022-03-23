import 'dart:convert';

import 'package:http/http.dart' as http;

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
}

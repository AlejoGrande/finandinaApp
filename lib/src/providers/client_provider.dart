import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:test_finandina/src/models/clients_model.dart';

class ClientProvider extends ChangeNotifier {
  Future<Clients?> getClient(String id) async {
    final _url = Uri.parse('https://finandina.herokuapp.com/clients/$id');
    final resp = await http.get(_url);
    if (resp.statusCode == 200) {
      final decodeResp = Clients.fromJson(resp.body);
      print(decodeResp);
      notifyListeners();
      return decodeResp;
    } else {
      return null;
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:test_finandina/src/models/clients_model.dart';

class ClientProvider extends ChangeNotifier {
  final _url = Uri.parse('https://finandina.herokuapp.com/clients/123456789');


  ClientProvider() {
    initgetClient();
  }

  initgetClient() async {
    final resp = await http.get(_url);
    if (resp.statusCode == 200) {
      final decodeResp = Clients.fromJson(resp.body);
      // decodeResp;
      print(decodeResp);
      notifyListeners();
    }
  }

  Future<Clients?> getClient() async {
    final resp = await http.get(_url);
    final decodeResp =  Clients.fromJson(resp.body);
    if (resp.statusCode == 200) {
      print(decodeResp);
      notifyListeners();
      return decodeResp;
    } else {
      return null;
    }
  }
}
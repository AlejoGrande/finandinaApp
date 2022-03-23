import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:test_finandina/src/models/accounts_model.dart';

class AccountsProvider extends ChangeNotifier {
  final _url = Uri.parse('https://finandina.herokuapp.com/accounts/459334344633355');

  List<Accounts> listProducts = [];

  AccountsProvider() {
    getAccount();
  }

  getAccount() async {
    final resp = await http.get(_url);
    if (resp.statusCode == 200) {
      final decodeResp = Accounts.fromJson(resp.body);
      // decodeResp;
      print(decodeResp);
      notifyListeners();
    }
  }

  Future<Accounts?> getAccounts() async {
    final resp = await http.get(_url);
    final decodeResp =  Accounts.fromJson(resp.body);
    if (resp.statusCode == 200) {
      print(decodeResp);
      notifyListeners();
      return decodeResp;
    } else {
      return null;
    }
  }
}

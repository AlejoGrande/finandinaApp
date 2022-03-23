// To parse this JSON data, do
//
//     final clients = clientsFromMap(jsonString);

import 'dart:convert';

import 'package:test_finandina/src/models/accounts_model.dart';

class Clients {
  Clients({
    required this.accounts,
    required this.id,
    required this.name,
    required this.documentNumber,
    required this.v,
  });

  List<Accounts>? accounts;
  String id;
  String name;
  int documentNumber;
  int v;
  
  factory Clients.fromJson(String str) => Clients.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Clients.fromMap(Map<String, dynamic> json) => Clients(
        accounts: json["accounts"] == null
            ? null
            :List<Accounts>.from(
                json["accounts"].map((x) => Accounts.fromMap(x))),
        id: json["_id"],
        name: json["name"],
        documentNumber: json["documentNumber"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "accounts": List<dynamic>.from(accounts!.map((x) => x.toMap())),
        "_id": id,
        "name": name,
        "documentNumber": documentNumber,
        "__v": v,
      };
}

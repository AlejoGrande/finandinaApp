// To parse this JSON data, do
import './accounts_model.dart';
//
//     final transaction = transactionFromMap(jsonString);

import 'dart:convert';

class Transaction {
  Transaction({
    required this.id,
    required this.value,
    required this.from,
    required this.to,
    required this.date,
    required this.v,
  });

  String id;
  int value;
  Accounts from;
  Accounts to;
  DateTime date;
  int v;

  factory Transaction.fromJson(String str) =>
      Transaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        id: json["_id"],
        value: json["value"],
        from: Accounts.fromMap(json["from"]),
        to: Accounts.fromMap(json["to"]),
        date: DateTime.parse(json["date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "value": value,
        "from": from.toMap(),
        "to": to.toMap(),
        "date": date.toIso8601String(),
        "__v": v,
      };
}

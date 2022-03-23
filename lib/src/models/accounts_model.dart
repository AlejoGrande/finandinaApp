// To parse this JSON data, do
//
//     final accounts = accountsFromMap(jsonString);

import 'dart:convert';

class Accounts {
    Accounts({
        required this.id,
        required this.balance,
        required this.accountNumber,
        required this.created,
        required this.v,
    });

    String id;
    int balance;
    int accountNumber;
    DateTime created;
    int v;
  
    factory Accounts.fromJson(String str) => Accounts.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());
    
    factory Accounts.fromMap(Map<String, dynamic> json) => Accounts(
        id: json["_id"],
        balance: json["balance"],
        accountNumber: json["accountNumber"],
        created: DateTime.parse(json["created"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "balance": balance,
        "accountNumber": accountNumber,
        "created": created.toIso8601String(),
        "__v": v,
    };
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_finandina/src/models/accounts_model.dart';
import 'package:intl/intl.dart';

class CreditCard extends StatelessWidget {
  final Accounts creditCard;
  CreditCard({
    required this.creditCard,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat f = new NumberFormat("#,###.0#", "es_US");
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,

            end: const Alignment(
                0.1, 1.0), // 10% of the width, so there are ten blinds.
            colors: <Color>[
              Colors.indigo.shade800,
              Colors.indigo.shade900,
            ], // red to yellow
            // tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(20),
          height: 140,
          child: Stack(
            children: <Widget>[
              // Padding(
              //padding: const EdgeInsets.all(20.0),
              Text(
                creditCard.accountNumber.toString().substring(0, 3) +
                    " " +
                    creditCard.accountNumber.toString().substring(4, 7) +
                    " " +
                    creditCard.accountNumber.toString().substring(8, 11) +
                    " " +
                    creditCard.accountNumber.toString().substring(12, 16),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
               Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 140,
                child: Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    "lib/src/resources/img/banco-finandina-blanco.svg",
                  ),
                ),
              ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                    text:  TextSpan(
                      text: 'Balance\n',
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: f.format(creditCard.balance),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ))
              //child: Text("Balance:\n${creditCard.balance}",style:TextStyle(fontSize: 15,color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}

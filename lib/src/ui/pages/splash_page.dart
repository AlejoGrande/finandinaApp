import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:test_finandina/src/models/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, "login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: primaryColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(25),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Hero(
                          tag: "unique",
                          child: SvgPicture.asset(
                            "lib/src/resources/img/banco-finandina-blanco.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(
                      valueColor:
                           AlwaysStoppedAnimation<Color>(Colors.white),
                      //backgroundColor: primaryColor,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_finandina/src/ui/pages/home_page.dart';
import 'package:test_finandina/src/ui/pages/login_page.dart';
import 'package:test_finandina/src/ui/pages/splash_page.dart';
import 'package:test_finandina/src/ui/pages/transactionPage.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "splash": (BuildContext context) => const SplashPage(),
    "login": (BuildContext context) => LoginPage(),
    "home": (BuildContext context) => const HomePage(),
    "transaction":(BuildContext context) => TransactionPage(),
  };
}

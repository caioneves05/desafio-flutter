import 'package:flutter/material.dart';
import 'package:teste_flutter/pages/item.page.dart';
import 'package:teste_flutter/pages/login.page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Caio', 
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: LoginPage(),
      );
  }
}

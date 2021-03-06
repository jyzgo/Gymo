import 'package:flutter/material.dart';
import './UI/GymoHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymoNew',
      theme: 
        ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      home: GymoHomePage(title: 'GymoHome'),
    );
  }
}

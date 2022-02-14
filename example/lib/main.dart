import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Text('Welcome to Quickly'.toTitleCase)
              .h1
              .red500
              .bold
              .underline
              .italic
              .center,
        ),
      ),
    );
  }
}

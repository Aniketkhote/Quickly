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
        appBar: AppBar(
          title: const Text('Quickly'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FxButton(
                onPressed: () {},
                text: 'abc',
              ),
              FxButton(
                onPressed: () {},
                icon: Icons.alarm,
                iconColor: Colors.black45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

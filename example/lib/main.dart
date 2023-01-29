import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple UI').black.bold),
      body: Column(
        children: <Widget>[
          const Text('UI design using Quickly.')
              .h2
              .red800
              .bold
              .underline
              .p20
              .center
              .rounded,
          10.hBox(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Learn More').white,
            style: ElevatedButton.styleFrom(
              backgroundColor: FxColor.dark,
              shape: RoundedRectangleBorder(borderRadius: FxRadius.r20),
              padding: FxPadding.pxy(h: 40, v: 12),
            ),
          ),
        ],
      ),
    );
  }
}

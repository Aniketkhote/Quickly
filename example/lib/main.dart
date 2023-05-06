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
      initialRoute: '/',
      routes: {
        '/first': (context) => const FirstWidget(),
        'second': (context) => const SecondWidget(),
      },
      home: Scaffold(
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
              onPressed: () => FxNavigation.toPage(const FirstWidget()),
              child: const Text('Go to First Screen').white,
              style: ElevatedButton.styleFrom(
                backgroundColor: FxColor.dark,
                shape: RoundedRectangleBorder(borderRadius: FxRadius.r20),
                padding: FxPadding.pxy(h: 40, v: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("First Screen"),
          ElevatedButton(
            onPressed: () => FxNavigation.toNamed('second',
                args: {'arg1': 'Hello', 'arg2': 'World'}),
            child: const Text('Go to Second Screen').white,
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

class SecondWidget extends StatelessWidget {
  const SecondWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      body: Column(
        children: [
          Text("First Screen : " + args!.getString('arg1')!),
          ElevatedButton(
            onPressed: () => FxNavigation.toPage(const FirstWidget()),
            child: const Text('back').white,
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

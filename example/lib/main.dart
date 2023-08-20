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
      navigatorKey:
          FxNavigation.navigatorKey, // Pass the navigator key to MaterialApp
      initialRoute: '/',
      routes: {
        // '/': (context) => const HomeWidget(),
        '/first': (context) => const FirstWidget(),
        '/second': (context) => const SecondWidget(),
      },
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple UI').black.bold),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('UI design using Quickly.')
              .h6
              .red800
              .bold
              .underline
              .p20
              .center,
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
          FxButton(
            text: "Go to First Screen",
            onPressed: () => FxNavigation.toNamed('/first'),
            color: FxColor.dark,
            shape: BtnShape.pill,
          )
        ],
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("First Screen"),
          FxButton(
            text: "Go to Second Screen",
            onPressed: () => FxNavigation.toNamed('/second',
                args: {'arg1': 'Hello', 'arg2': 'World'}),
            color: FxColor.dark,
            shape: BtnShape.pill,
          ),
          FxButton(
            text: "Back to Home Screen",
            onPressed: () => FxNavigation.offPage(const HomeWidget()),
            color: FxColor.dark,
            shape: BtnShape.pill,
          )
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("First Screen : " + args!.getString('arg1')!),
          FxButton(
            text: "Go to First Screen",
            onPressed: () => FxNavigation.toPage(const FirstWidget()),
            color: FxColor.dark,
            shape: BtnShape.pill,
          ),
          FxButton(
            text: "Back to Home Screen",
            onPressed: () => FxNavigation.offPage(const HomeWidget()),
            color: FxColor.dark,
            shape: BtnShape.pill,
          )
        ],
      ),
    );
  }
}

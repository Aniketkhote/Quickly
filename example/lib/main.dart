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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            10.hBox(),
            FxButton(
              text: "Submit",
              onPressed: () => FxNavigation.toNamed('/first'),
              size: BtnSize.tiny,
            ),
            10.hBox(),
            FxButton(
              text: "Submit",
              onPressed: () => FxNavigation.toNamed('/first'),
              size: BtnSize.small,
            ),
            10.hBox(),
            FxButton(
              text: "Submit",
              onPressed: () => FxNavigation.toNamed('/first'),
              size: BtnSize.normal,
              textStyle: TextStyle(fontWeight: FontWeight.bold),
              prefixIcon: Icons.location_searching,
            ),
            10.hBox(),
            FxButton(
              text: "Submit",
              onPressed: () => FxNavigation.toNamed('/first'),
              size: BtnSize.medium,
            ),
            10.hBox(),
            FxButton(
              text: "Submit",
              onPressed: () => FxNavigation.toNamed('/first'),
              size: BtnSize.large,
            ),
            10.hBox(),
            FxCheckbox(
              isChecked: true,
              onChange: (value) {},
            ),
            10.hBox(),
            FxSwitch(
              value: true,
              onChanged: (value) {},
            ),
            10.hBox(),
            FxRadio(
              groupValue: true,
              value: true,
              onChanged: (value) {},
            ),
            10.hBox(),
            Switch(value: true, onChanged: ((value) {})),
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

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
            spacing: 12,
            children: [
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FxButton(
                    type: BtnType.solid,
                    onPressed: () {},
                    text: 'abc',
                    size: BtnSize.tiny,
                  ),
                  FxButton(
                    type: BtnType.solid,
                    onPressed: () {},
                    text: 'abc',
                    size: BtnSize.small,
                  ),
                  FxButton(
                    type: BtnType.solid,
                    onPressed: () {},
                    text: 'abc',
                    color: FxColor.primary,
                  ),
                  FxButton(
                    type: BtnType.solid,
                    onPressed: () {},
                    text: 'abc',
                    size: BtnSize.medium,
                  ),
                  FxButton(
                    type: BtnType.solid,
                    onPressed: () {},
                    text: 'abc',
                    size: BtnSize.large,
                  ),
                ],
              ),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FxButton(
                    type: BtnType.solid,
                    onPressed: () {},
                    icon: Icons.person,
                    size: BtnSize.tiny,
                  ),
                  FxButton(
                    type: BtnType.solid,
                    onPressed: () {},
                    icon: Icons.person,
                    size: BtnSize.small,
                  ),
                  FxButton(
                    type: BtnType.solid,
                    onPressed: () {},
                    icon: Icons.person,
                  ),
                  FxButton(
                    type: BtnType.solid,
                    onPressed: () {},
                    icon: Icons.person,
                    size: BtnSize.medium,
                  ),
                  FxButton(
                    type: BtnType.solid,
                    onPressed: () {},
                    icon: Icons.person,
                    size: BtnSize.large,
                  ),
                ],
              ),
              FxTextFormField(
                label: "Name",
                hintText: "Name",
                border: true,
                maxLines: 5,
              ),
              FxTextFormField(isRequired: false),
              QuicklyCheckbox(),
              QuicklyRadio(),
              QuicklySwitch(),
            ],
          ),
        ),
      ),
    );
  }
}

class QuicklyCheckbox extends StatefulWidget {
  const QuicklyCheckbox({
    super.key,
  });

  @override
  State<QuicklyCheckbox> createState() => _QuicklyCheckboxState();
}

class _QuicklyCheckboxState extends State<QuicklyCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return FxCheckbox(
      value: _isChecked,
      onChanged: (v) => setState(
        () {
          _isChecked = v;
        },
      ),
    );
  }
}

class QuicklyRadio extends StatefulWidget {
  const QuicklyRadio({super.key});

  @override
  State<QuicklyRadio> createState() => _QuicklyRadioState();
}

class _QuicklyRadioState extends State<QuicklyRadio> {
  String name = "male";

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FxRadio(
          groupValue: name, // The currently selected value
          value: "male", // Unique value for this radio button
          onChanged: (value) => setState(() {
            name = value; // Update the selected value
          }),
        ),
        FxRadio(
          groupValue: name, // The currently selected value
          value: "female", // Unique value for this radio button
          onChanged: (value) => setState(() {
            name = value; // Update the selected value
          }),
        ),
      ],
    );
  }
}

class QuicklySwitch extends StatefulWidget {
  const QuicklySwitch({
    super.key,
  });

  @override
  State<QuicklySwitch> createState() => _QuicklySwitchState();
}

class _QuicklySwitchState extends State<QuicklySwitch> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return FxSwitch(
      value: _isChecked,
      onChanged: (v) => setState(
        () {
          _isChecked = v;
        },
      ),
    );
  }
}

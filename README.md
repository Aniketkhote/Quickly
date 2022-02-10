<div align="center" >
  
  ## Quicker is awesome flutter package to rapid development.
  
</div>

<br />

![Pub Version](https://img.shields.io/pub/v/quicker?color=blue&style=the-badge)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Aniketkhote/Quicker/CI?style=the-badge)](https://github.com/Aniketkhote/Quicker)
[![pub points](https://badges.bar/quicker/pub%20points)](https://pub.dev/packages/quicker/score)
[![popularity](https://badges.bar/quicker/popularity)](https://pub.dev/packages/quicker/score)
[![likes](https://badges.bar/quicker/likes)](https://pub.dev/packages/quicker/score)
![Discord](https://img.shields.io/discord/940916716081397771?logo=Discord&logoColor=white)


[`Quicker`](https://pub.dev/packages/quicker) is build as a tool to enhance your Flutter UI development experience and make code easier. It is highly inspired by Bootstrap and Tailwind CSS. 
It also provide lots of extension methods on String, List and Map.

## How to Use

```yaml
# add this line to your dependencies and replace [version] with the latest version:
  quicker: ^[version]
```

```dart
import 'package:quicker/quicker.dart';
```

<!-- ***

## Basic Dart Example
```dart
 List mapList = [
    {'id': 1, 'name': 'Desk', 'price': 200},
    {'id': 2, 'name': 'Chair', 'price': 100},
    {'id': 3, 'name': 'Bookcase', 'price': 150},
  ];

  //Get only those object whose price is 150 & 200
  print(mapList.whereIn('price', [150,200]));

  [
    {'id': 3, 'name': 'Bookcase', 'price': 150}, 
    {'id': 1, 'name': 'Desk', 'price': 200}
  ]


  //Get only those object whose price is not 150 & 200
  print(mapList.whereNotIn('price', [150,200]));

  [
    {'id': 2, 'name': 'Chair', 'price': 100}
  ]

   //Get only those key/values which is this keys
  print(mapList.only(['name','price']));

  [
    {'name': 'Bookcase', 'price': 150}, 
    {'name': 'Chair', 'price': 100},
    {'name': 'Desk', 'price': 200}
  ]


  //Get all key/values excepted this key
  print(mapList.notOnly(['price']));

  [
    {'id': 1, 'name': 'Desk'},
    {'id': 2, 'name': 'Chair'},
    {'id': 3, 'name': 'Bookcase'}
  ]

```
</br>

---


## Some other methods and Widgets

<details>
<summary>Widgets</summary>

* FxAlert
* FxIconBox
* FxButton
* FxHBox
* FxWBox
* SquareBox

</details>

<details>
<summary>String Methods</summary>

* isAlphabet
* isEmail
* isNumber
* isMobileNumber
* removeWhitespace
* toSlug
* minLength()
* maxLength()
* range()
* mask()
* countBy()
* toTitleCase()
* toSentenceCase()
* toCapitalCase()
* Checks file extensions likes(eg. png,svg,pdf,audio,video and more).

[String API Reference](https://pub.dev/documentation/quicker/latest/quicker/StringExtensions.html).

</details>

<details>
<summary>List Methods</summary>
    
* flatten
* flatMap
* random
* min
* max
* sum
* avg
* median
* mode
* groupBy
* countBy()
* groupByKey()
* pluck()
* sorted()
* sortBy()
* diff()
* chunk()
* only()
* notOnly()
* whereIn()
* whereNotIn()
* whereBetween()
* whereNotBetween()
* hasKeyValue()
* hasKey()
* hasValue()

[List API Reference](https://pub.dev/documentation/quicker/latest/quicker/ListExtensions.html).

</details>

<details>
<summary>Map Methods</summary>

* getId
* isEmptyOrNull
* isNotEmptyOrNull
* contains()
* diffKeys()
* diffValues()
* getBool()
* getInt()
* getDouble()
* getString()
* getList()

[Map API Reference](https://pub.dev/documentation/quicker/latest/quicker/MapExtensions.html).

</details>

<br />

**Read the full** [API reference](https://pub.dev/documentation/quicker/latest/).

**Read** [Documentation](https://aniketkhote.github.io/quicker-docs/#/).

*** -->

## Contributing 
quicker is 100% free and open source. We encourage and support an active, healthy community that accepts contributions from the public – including you.

- Pick up any issue marked with label "[good first issue](https://github.com/Aniketkhote/Quicker/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22)"
- Fix a bug
- Write and improve some documentation. Documentation is very critical to us. We would appreciate help in adding multiple languages to our docs.
- If you are a developer, feel free to check out the source and submit pull requests.
- Please don't forget to like, follow, and star our repo! Join our growing community to keep up to date with the latest GetWidget development.

Code and documentation Copyright 2022 [Aniket Khote](https://github.com/Aniketkhote)

---

<div align="center" >

### **Show some ❤️ to Like, Follow, and Star our repo!**

</div>
</br>
<div id="top"></div>

  <p align="center">
    Quickly is awesome flutter package for faster and cleaner development.
    <br />
    <br />
    <a href="https://pub.dev/documentation/quickly/latest/quickly/quickly-library.html"><strong>Explore the docs »</strong></a>
    <br />
    <a href="https://github.com/Aniketkhote/Quickly/issues">Report Bug</a>
    ·
    <a href="https://github.com/Aniketkhote/Quickly/issues">Request Feature</a>
  </p>

<div align="center">

![Pub Version](https://img.shields.io/pub/v/quickly?color=blue&style=the-badge)

</div>

<!-- TABLE OF CONTENTS -->

### Table of Contents

  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>

<!-- ABOUT THE PROJECT -->

## About The Project

**Quickly** is a powerful Flutter package that aims to enhance the development experience by offering a variety of extension methods for types such as String, List and Map, allowing for a more efficient and cleaner coding experience. It is inspired by Bootstrap and Tailwind CSS, and is built using Flutter and Dart. The package offers a wide range of utility functions, such as applying padding, visibility, and text styling to widgets. It can be easily integrated into your code by importing the package and using the provided extension methods on your widgets.

With Quickly, developers can take advantage of features such as:

- A collection of useful widgets and classes for quickly creating common UI elements.
- Utility functions for common tasks like data validation and formatting.
- Performance optimization tools for improving the overall performance of your app.

In summary, Quickly is an essential tool for any Flutter developer looking to improve their development workflow and create high-quality, polished apps.

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Usage

### Flutter

```dart

// Display big bold red Text in italic with underline and alligned it to center
Text('Quickly').red500.xl.bold.italic.underline.center

// Apply padding to Widget
Text('12 Padding from all side').p12

Text('4 Padding from top and bottom side').py4

Text('16 Padding from all side except top').pnt16

// Visibility
Text('Hide this widget').hide()

// Rounded border
Text('Make rounded this widget').rounded

// Vertical space
2.hBox(child:Text('Added 2dp vertical space'))


```

### Dart

The following are a list of extensions on various types (lists, maps, integers, and doubles) to provide additional functionality:

## List Extensions:

**Sample data :**

```dart

numbers = [5, 2, 9, 1, 7]
people = [{'name': 'Bob', 'age': 30}, {'name': 'Alice', 'age': 25}]

```

- **list.sorted():** Returns a new list with the elements sorted in ascending order.

```dart

numbers.sorted()  // [1, 2, 5, 7, 9]

```

- **list.sortedDec():** Returns a new list with the elements sorted in descending order.

```dart

numbers.sortedDec()  // [9, 7, 5, 2, 1]

```

- **list.sortedBy(key):** Returns a new list of objects sorted by the provided key.

```dart

people.sortedBy('age')  // [{'name': 'Alice', 'age': 25}, {'name': 'Bob', 'age': 30}]

```

- **list.chunk(n):** Divides the list into equal chunks of size n and returns a list of lists.

```dart

numbers.chunk(2)  // [[5, 2], [9, 1], [7]]

```

- **list.split(n):** Divides the list into n equal parts and returns a list of lists.

```dart

numbers.split(3)  // [[5, 2], [9], [1, 7]]

```

- **list.pluck(key):** Retrieves all of the values for a given key from a list of objects.

```dart

people.pluck('name')  // ['Bob', 'Alice', 'Charlie']

```

## Map Extensions:

**Sample data :**

```dart

person = {'name': 'Bob', 'age': 30, 'gender': 'male'}

```

- **map.has("key","value"):** Returns a boolean value indicating if the provided key-value pair is present in the map.

```dart

person.has('gender', 'male')  // true

```

- **map.getId():** Returns the value associated with the key 'id' if it exists, else returns NULL.

```dart

person.getId()  // null

```

- **map.getString('key'):** Returns the value associated with the provided key if it exists, else returns NULL.

```dart

person.getString('name')  // 'Bob'

```

- **map.getBool('key'):** Returns the boolean value associated with the provided key if it exists, else returns false.

```dart

person.getBool('gender')  // false

```

- **map.retainKeys(keys):** Returns a new map with only the key-value pairs that match the provided keys.

```dart

person.retainKeys(['name', 'age'])  // {'name': 'Bob', 'age': 30}

```

- **map.match(key, [defaultValue]):** Returns the value associated with the provided key if it exists, else returns the provided default value or "Invalid input" if no default value is provided.

```dart

person.match('age', 'Unknown')  // 30

```

## Num Extensions:

- int.suffix(): Returns the ordinal suffix for the integer (e.g. 1st, 2nd, 8th)
- double.suffix([suffix]): Returns the double with the provided suffix

```dart

8.suffix()  // '8th'

10.5.suffix('$')  // '10.5$'

```

- int.getMonthName({isShort}): Returns the name of the month corresponding to the integer

```dart

1.getMonthName()  // 'January'

1.getMonthName(isShort:true)  // 'Jan'

```

- int.getWeekName({isShort}): Returns the name of the day of the week corresponding to the integer

```dart

3.getWeekName()  // 'Wednesday'

3.getWeekName(isShort:true)  // 'Wed'

```

_For more examples, please refer to the [Documentation](https://pub.dev/documentation/quickly/latest/quickly/quickly-library.html)_

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

We welcome and greatly appreciate any contributions to Quickly. Whether you have a bug report, feature suggestion, or are interested in helping to develop the package, we encourage you to get involved.

Here are a few ways you can contribute:

- **Report a bug**: If you find a bug or issue with the package, please open an issue and provide as much detail as possible about the problem.

- **Suggest a feature**: If you have an idea for a new feature or improvement, please open an issue and share your thoughts.

- **Contribute code**: If you're interested in developing the package further, please fork the repository and submit a pull request with your changes. Before submitting, please make sure to run the tests and ensure that your code follows the project's coding style.

- **Spread the word**: If you find Quickly useful, please tell your friends and colleagues about it and give the project a star on GitHub.

Thank you for your support!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Aniket Khote - [@aniketkhote99](https://twitter.com/aniketkhote99) - aniketkhote99@gmail.com

Project Link: [https://github.com/Aniketkhote/Quickly](https://github.com/Aniketkhote/Quickly)

<div align="center" >

### **Show some ❤️ to Like, Follow, and Star our repo!**

</div>

<p align="right">(<a href="#top">back to top</a>)</p>

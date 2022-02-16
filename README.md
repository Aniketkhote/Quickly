<div id="top"></div>

<br />
<div align="center">
  <a href="https://github.com/Aniketkhote/quickly">
    <img src="https://cdn-icons.flaticon.com/png/512/3649/premium/3649458.png?token=exp=1644607289~hmac=a29d04e140831c83c39399bbe5bff6ba" alt="Logo" width="80" height="80">
  </a>

<h1 align="center" style="font-size:50px">Quickly</h1>

  <p align="center">
    Quickly is awesome flutter package for faster and cleaner development.
    <br />
    <a href="https://pub.dev/documentation/quickly/latest/quickly/quickly-library.html"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Aniketkhote/Quickly">View Demo</a>
    ·
    <a href="https://github.com/Aniketkhote/Quickly/issues">Report Bug</a>
    ·
    <a href="https://github.com/Aniketkhote/Quickly/issues">Request Feature</a>
  </p>
</div>

![Pub Version](https://img.shields.io/pub/v/quickly?color=blue&style=the-badge)
![GitHub Release Date](https://img.shields.io/github/release-date/Aniketkhote/quickly?style=the-badge)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Aniketkhote/quickly/CI?style=the-badge)
[![pub points](https://badges.bar/quickly/pub%20points)](https://pub.dev/packages/quickly/score)
[![popularity](https://badges.bar/quickly/popularity)](https://pub.dev/packages/quickly/score)
[![likes](https://badges.bar/quickly/likes)](https://pub.dev/packages/quickly/score)

<!-- TABLE OF CONTENTS -->
  ### Table of Contents
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <!-- <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li> -->
    <li><a href="#how-to-use">How To Use</a></li>
    <li><a href="#usage">Usage</a></li>
    <!-- <li><a href="#roadmap">Roadmap</a></li> -->
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>



<!-- ABOUT THE PROJECT -->
## About The Project

Quickly is build as a tool to enhance your Flutter UI development experience and make code easier. It is highly inspired by Bootstrap and Tailwind CSS. It also provide lots of extension methods on String, List and Map.

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Flutter](https://flutter.dev/)
* [Dart](https://dart.dev/)
* [Get](https://pub.dev/packages/get)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- How To Use -->
## How To Use


- Add this line to your dependencies and replace [version] with the latest version:

```yaml
  quickly: ^[version]
```

- Import package

```dart
import 'package:quickly/quickly.dart';
```


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

### Flutter

```dart

// Display big bold red string in italic
Text('Quickly').red500.xl.bold.italic

// Apply padding to Widget
Text('12 Padding from all side').p12

Text('4 Padding from top and bottom side').py4

Text('16 Padding from all side except top').pnt16

// Visibility
Container(child:Text('hide')).hide

Container(child:Text('show')).show

Container(
  child:Text('hide if condition true'),
  ).hideIf(condition)

Container(
  child:Text('show if condition true'),
  ).showIf(condition)
```

### Dart

```dart

// get sorted list
list.sorted()    // pass true for desc

list.sortedDec()

// get sorted list by key from list of object
list.sortedByKey(key)

// checks given key/value pair is present or not
map.contains("key","value")   // true

// return id if key present else return 0
map.getId

// key is NULL or not [String] type return empty string else return value of key
map.getString('key')

// Get suffix
1.suffix()   // 1st
2.suffix()   // 2nd
8.suffix()   // 8th

10.5.suffix('%') // 10.5$

// getMonthName
1.getMonthName()     // January
2.getMonthName(true) // Feb

// getWeekName
1.getWeekName()     // Monday
2.getWeekName(true) // Mon

```

_For more examples, please refer to the [Documentation](https://pub.dev/documentation/quickly/latest/quickly/quickly-library.html)_

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
<!-- ## Roadmap

- [ ] Feature 1
- [ ] Feature 2
- [ ] Feature 3
    - [ ] Nested Feature

See the [open issues](https://github.com/Aniketkhote/Quickly/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>
 -->


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

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



<!-- ACKNOWLEDGMENTS -->
<!-- ## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#top">back to top</a>)</p> -->

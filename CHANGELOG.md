## 3.3.0

- Implemented a new method retainKeys in the Map extension to remove key-value pairs whose keys are not present in a given list.
- Removed methods related to text styling such as letter spacing, word spacing, line height and text decoration as they were not relevant to the extension.
- Implemented checks to verify that the list is not empty and contains Map elements in the where methods to avoid runtime errors.
- Added type checking for the generic type T in the list extensions to ensure that the methods are only applied to lists of the correct type.
- Updated the documentation for the extension with proper examples and explanations for each method.

## 3.2.0

- Made improvements to the code for better performance and removed any unnecessary checks.
- Removed a dependency on the "get" package.

## 3.1.0

- Small corrections have been made to the package to address any minor issues.

## 3.0.0

- An update has been made to the stable version of flutter, bringing it to version 3.8.8. This update includes various improvements and bug fixes.

## 2.5.0

- Small corrections have been made to the package to address any minor issues.

## 2.4.0

### Fixed

- The default value for the functions 'getInt' and 'getDouble' have been corrected.
- Additionally, other bugs have been resolved.

## 2.3.0

### Added

- The widget extension now includes the option for `flexible`, allowing for more flexibility in layout and design.
- The radius radius extension has been added, allowing for more customization of the border corners.
- The list extension has been enhanced with new options for filtering and querying data, including `whereOnly`, `whereNotOnly`, `whereBetween`, `whereNotBetween`, `whereIn` and `whereNotIn`, providing more advanced options for data manipulation.

## 2.2.0

### Added

- Added some extra constant in padding extension
- Added `doesntContain()` method in map extension

### Changed

- Renamed main color names, such as "primary" to "kcPrimary" in Text extension.
- Slightly altered main color codes.
- Converted utility classes to mixins.

## 2.1.0

### Added

- The `groupBy()` function allows for grouping of list items based on a provided key or function, and returns a map of the grouped items. The `groupByKey()` function allows for grouping of list items based on the value of a specific key in each item, and also returns a map of the grouped items.
- The `latest()` function returns the most recent item in the list based on a provided key or function, while the `latestFirst()` function sorts the list in descending order based on the provided key or function.
- The `oldest()` function returns the oldest item in the list based on a provided key or function, while the `oldestFirst()` function sorts the list in ascending order based on the provided key or function.

### Changed

- Changed `sortByDesc()` to `sortDescBy()` in list extension

## 2.0.0

### Braking Changes

- Added `append()` and `prepend()` string extension.
- Added `flatten` and `pluck()` list extension.
- Changed `w` to` wBox` and `h` to `hBox` in num extension.
- Changed `range` to `inRange` in String extension.
- Changed `count` to `occurrences` in String extension.
- Changed `occurrence` to `countOccurrences` in String extension.
- Changed `withDefault` to `ifEmpty` in String extension.
- Changed `getId` data type from dynamic to int in map extension.
- Changed `contains` to `has` in map extension.
- Fixed `mask` now return `null` when string is empty.
- Fixed `getInt` & `getDouble` now return `null` when key is empty or null.
- Fixed Typo

## 1.7.0

### Added

- Added `black` and `white` color
- Added `context` extension on Build Context
- Added Responsive extension

### Changed

- changed `.h` & `.w` child widget to optional in num extension
- changed `.maxLine` to optional in Text extension
- changed `.box` to `.sq` in num extension

## 1.6.0

### Added

- Added `match()` extension on `Map`

  The `match()` function also works similarly to `switch`
  i.e, it finds the matching case according to the parameter passed in it.

- Added `hasKey` | `hasValue` | `hasKeyValue` extensions on list

## 1.5.0

### Added

- Write tests for `List`
- Write tests for `Map`

### Changed

- Changed `.textScaleFactor` => `.textScale`
- Changed `.fs` => `.fontSize`
- Removed `isEmptyOrNull` & `isNotEmptyOrNull`

## 1.4.0

### Added

- Added `random` | `chunk` | `split` list extensions

### Fixed

- Fixed `sortBy` error when list doesn't have this key or it doesn't have list of map

## 1.3.0

### Added

- Added `sq` | `w` | `h` num and widget extensions
- Added `Duration` num extensions like `seconds` | `minutes`, etc

## 1.2.0

### Added

- Added `suffix` num extensions
- Added `getMonthName` & `getWeekName` int extensions

### Fixed

- Fix Text color extensions.
- Fix `isUpper` & `isLower` String extensions
- Fix `hideIf` & `showIf` Widget extensions

## 1.1.0

### Added

- Added `sortBy()` , `sortByDesc()` in List.

### Fixed

- Fix Text heading.

## 1.0.0

- Initial release.

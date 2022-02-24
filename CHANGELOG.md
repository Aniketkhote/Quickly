## 2.2.0

### Added
- Added some extra padding extension
- Added `doesntContain()` in map extension

### Changed
- Changed main colors names like `primary` => `kcPrimary` in Text extension.
- Changed slightly main color codes
- Changed utilities classes to mixins.

## 2.1.0

### Added
- Added `groupBy()` and `groupByKey()` in list extension
- Added `latest()` and `latestFirst()` in list extension
- Added `oldest()` and `oldestFirst()` in list extension

### Changed
- changed `sortByDesc()` => `sortDescBy()` in list extension

## 2.0.0

### Braking Changes

- Added `append()` and `prepend()` string extension
- Added `flatten` and `pluck()` list extension

- Changed `w` => `wBox` & `h` => `hBox` in num extension
- Changed `range` => `inRange` in String extension
- Changed `count` => `occurrences` in String extension
- Changed `occurrence` => `countOccurrences` in String extension
- Changed `withDefault` => `ifEmpty` in String extension
- Changed `getId` data type `dynamic` => `int` in map extension
- Changed `contains` => `has` in map extension


- Fixed `mask` now return `null` when string is empty
- Fixed `getInt` & `getDouble` now return `null` when key is empty or null
- Fixed Typo

## 1.7.0

### Added
- Added `black` and `white` color
- Added `context` extension on Build Context
- Added Responsive extension
### Changed
- changed `.h` & `.w` child widget to optional in num extension
- changed `.maxLine` to optional in Text extension
- changed `.box` => `.sq` in num extension

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

# Ace.dart Changes

## 0.2.0-dev+1.8.2014

- Replaced the `EditSession.breakpoints` getter with the `getBreakpoints` 
method.
- Split `EditSession.annotations` getter/setter into the `getAnnotations` and
`setAnnotations` methods; this matches `ace.js` and helps to clarify their 
separate behavior.
- Added the static `Mode.extensionMap` getter; the user may modify this map to
configure the `new Mode.forFile` factory.
- Added the `new Mode.named` factory, `name` getter, and enumeration constants 
to `Mode`.
- Added the `onChangeSelection` event stream to `Editor`.
- Added the `Marker` class and expose the `onChangeBackMarker`, 
`onChangeFrontMarker`, `addMarker`, `getMarkers` and `removeMarker` members on 
the `EditSession` class.
- Added the `Fold`, `FoldLine`, `Placeholder` and `RangeList` classes.
- Added the `Folding` abstract class and have `EditSession` implement it. 
- Added the `onChangeFold` event stream to `EditSession`.

## 0.1.7+1.8.2014

- Updated to ace-builds version 01.08.2014.

## 0.1.6+12.2.2013

- Added the `UndoManagerBase` class and implemented the 
`EditSession.undoManager` setter; the argument to this setter _must_ be an 
object derived from `UndoManagerBase`.
- Optimized some list and map conversions on the `dart:js` boundary.
- Added the `Annotation` class and expose the `onChangeAnnotation`, 
`annotations`, and `clearAnnotations` members on the `EditSession` class.
- Added a new `example/annotations`.

## 0.1.5+12.2.2013

- Added `containerElement` and `mouseEventTarget` getters to the 
`VirtualRenderer`.
- Added `.lua`, `.hs`, `.hx`, `.scala`, and `.svg` to the extension map used by 
the `new Mode.forFile` factory.

## 0.1.4+12.2.2013

- Updated to ace-builds version 12.02.2013.
- Added `showGutter`, `printMarginColumn`, and an `OptionsProvider` 
implementation to the `VirtualRenderer`.

## 0.1.3+10.28.2013

- Added the `KeyBinding` and `KeyboardHandler` abstract classes and expose the
`Editor.keyBinding` getter and the `Editor.keyboardHandler` getter / setter.

## 0.1.2+10.28.2013

- Added a new `example/autocomplete`.
- Added the `require` top-level function.
- Added the `OptionsProvider` abstract class and have `Editor` implement it. 

## 0.1.1+10.28.2013

- Updated pubspec for Dart 1.0 release as requested.

## 0.1.0+10.28.2013

- Updated to ace-builds version 10.28.2013.
- Updated to SDK 0.8.10_r29803.
- Added documentation and test coverage to a number of public methods; please
consult the commit history for details.

## 0.0.9+10.21.2013

- Updated to ace-builds version 10.21.2013.
- Fixed a couple of bugs from the move to `dart:js`.

## 0.0.8+10.7.2013

- Updated to SDK 0.8.5_r28990.
- Removed dependency on `js` package and moved code to use the `dart:js` 
library instead.

## 0.0.7+10.7.2013

- Added several public methods to the `Range` class with documentation and test 
coverage.
- Changed the `noClip` parameter of `Anchor.setPosition` to a named optional
parameter `clip` which defaults to `true`.
- Changed the `dontSelect` parameter of `UndoManager.undo` and `redo` to a named 
optional parameter `select` which defaults to `true`.
- Changed the `cursorPos` parameter of `Editor.setValue` to an optional
parameter `cursorPosition` which defaults to `0` (select all) and documented the
method.
- Changed the `times` parameter of the `Editor` methods `navigateDown`, 
`navigateLeft`, `navigateRight`, and `navigateUp` to be optional with default 
value of `1`.

## 0.0.6+10.7.2013

- Pub doesn't seem to like a `0` in the version metadata just about anywhere.
This is really a pub bug but I'm going to drop the `0` to work around the issue.

## 0.0.5+10.07.2013

- Updated to ace-builds version 10.07.2013.
- Changed the `text` parameter of the `Document` constructor from an optional
to a named optional.

## 0.0.4+9.11.2013

- Updated to SDK 0.7.6_r28108.
- Added documentation and test coverage to a number of public methods; please
consult the commit history for details.
- Fixed `Editor.onChangeSession` stream type to `EditSessionChangeEvent` thanks
to a bug fix in the `js-interop` package.

## 0.0.3+9.11.2013

- Updated to SDK 0.7.5_r27776.
- Added documentation and test coverage to a number of public methods; please
consult the commit history for details.

## 0.0.2+9.11.2013

- Removed leading `0` from the version metadata string as it was being stripped
when publishing and that was causing issues.
- Added LICENSE and README for ace.js to `lib/src/js`.

## 0.0.1+09.11.2013

- Initial version.

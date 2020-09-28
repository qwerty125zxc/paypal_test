@JS()
library callable_function;

import 'package:js/js.dart';

/// Allows assigning a function to be callable from `window.functionName()`
@JS('functionName')
external set jsFunctionName(void Function() f);

/// Allows calling the assigned function from Dart as well.
@JS()
external void functionName();

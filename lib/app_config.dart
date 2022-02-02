import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'main.dart';

class Env {
  static Env? value;
  String? baseUrl;

  Env() {
    value = this;
    if (value != null) {
      runApp(Phoenix(child: MyApp(this)));
    }
  }

  String get name => runtimeType.toString();
}
// TODO Implement this library.
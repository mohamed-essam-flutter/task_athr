import 'package:flutter/material.dart';

extension ContextEX on BuildContext {
  //pushNamed
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  //pushReplacementNamed
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  //pushNamedAndRemoveUntil
  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName('/'),
      arguments: arguments,
    );
  }

  //popAndPushNamed
  Future<dynamic> popAndPushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  //popUntil
  void popUntil(String routeName) {
    Navigator.popUntil(this, ModalRoute.withName(routeName));
  }

  //pop
  void pop() {
    Navigator.of(this).pop();
  }
}
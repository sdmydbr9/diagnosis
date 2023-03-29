import 'package:flutter/material.dart';
import 'package:testapp/welcome_screen.dart';

void main() => runApp(testapp());

// ignore: camel_case_types
class testapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(key: UniqueKey()),
    );
  }
}

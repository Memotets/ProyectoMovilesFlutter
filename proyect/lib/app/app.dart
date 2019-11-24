import 'package:flutter/material.dart';
import 'package:proyect/screens/loginScreen.dart';

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: LoginScreen(),
    );
  }
}
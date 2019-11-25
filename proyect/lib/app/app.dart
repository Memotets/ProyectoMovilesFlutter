import 'package:flutter/material.dart';
import 'package:proyect/screens/loginScreen.dart';

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(//accentColor: Colors.yellow,
          backgroundColor:  Color.fromARGB(450, 107, 23, 64),
          accentColor:  Color.fromARGB(450, 107, 23, 64),
         bottomAppBarColor: Color.fromARGB(450, 107, 23, 64),
         buttonColor: Color.fromARGB(450, 107, 23, 64),
       appBarTheme:  AppBarTheme(
        
         color: Color.fromARGB(450, 107, 23, 64)
       )
      ),
      home: LoginScreen(),
    );
  }
}

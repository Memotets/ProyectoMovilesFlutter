import 'package:flutter/material.dart';

Card FormCard(){
  return Card(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Usuario'),
        TextField(
          decoration: InputDecoration(
            hintText: "Usuario" 
          ),
        ),
        Divider(),
        Text('Contraseña'),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Contraseña"
          ),

        )
      ],
    ),
    )
  );
}
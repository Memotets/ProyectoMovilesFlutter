import 'package:flutter/material.dart';
class FormCard extends StatelessWidget {
  String user;
  String pw;
  final _userController = TextEditingController();
  final _pwController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
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
          controller: _userController,
          onEditingComplete: (){
            user=_userController.text;
          },
        ),
        Divider(),
        Text('Contraseña'),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Contraseña"
          ),
          controller: _pwController,
          onEditingComplete: (){
            pw = _pwController.text;
          },

        )
      ],
    ),
    )
  );
  
  
  
  }
}
/*
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
*/
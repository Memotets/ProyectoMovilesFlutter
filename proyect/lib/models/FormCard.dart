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
          onChanged: (user){
            this.user=_userController.text;
            print(this.user);
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
          onChanged: (pw){
            this.pw = _pwController.text;
            print(this.pw);
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
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
         SizedBox(height: 10.0),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person,),
             contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                
                fillColor: Colors.grey[70],
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
        SizedBox(height: 10.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
             contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                prefixIcon: Icon(Icons.lock,),
                fillColor: Colors.grey[70],
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

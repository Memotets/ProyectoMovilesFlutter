import 'package:flutter/material.dart';
import 'package:proyect/models/Base.dart';
import 'package:proyect/models/Usuario.dart';
import 'package:proyect/models/FormCard.dart';
import 'registroUserScreen.dart';
import 'menuScreen.dart';


class LoginScreen extends StatefulWidget {
  static Route<dynamic> route(){
    return MaterialPageRoute(
      builder: (context)=> LoginScreen()

    );
  }
  @override
  _LoginScreenState createState()=> _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FormCard _login = new FormCard();
  Base _base = new Base();
  bool _logueado = false;
  String _user;
  @override
  Widget build(BuildContext context) {
    return _logueado ? MenuScreen(user: _user,base: _base,) : loginForm();
  }
  
  Widget loginForm(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
          
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 18
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                    child: Image.asset("assets/ipn-logo.png")
              ),
              _login.build(context),
             SizedBox(height: 15.0),
              Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20.0),
          color: Color.fromARGB(450, 107, 23, 64),
          child: MaterialButton(

            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: (){
                    print(_login.user);
                    print(_login.pw);
                    validarLogin(context,_login.user,_login.pw);},
            child: Text("Ingresar",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                ),
          ),
        ),
         SizedBox(height: 20.0),
          Padding( padding: const EdgeInsets.all(16.0), 
          child: Align( alignment: Alignment.centerRight, 
          child: new FloatingActionButton( 
             onPressed:()=>agregarAspirante(),    
            child: new Icon( Icons.add, color: Colors.white, ), ), ), ),
            /*  Center(
                child: RaisedButton(
                  child: Text('Ingresar'),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: (){
                    print(_login.user);
                    print(_login.pw);
                    validarLogin(context,_login.user,_login.pw);},
                ),
              )*/
              
            ],
          ),
        ),
   /*   floatingActionButton: FloatingActionButton(
          
        onPressed:()=>agregarAspirante(),    
        child: Icon(Icons.add),
      ), */

    );
  
  }
  void validarLogin(BuildContext context,String user, String password ) async{
    Usuario usuario = await _base.getLogin(user, password);
    var alertDialog = AlertDialog(
      title: Text("Error al ingresar"),
      content: Text("Verificar usuario y/o contraseña"),
    );

    if(usuario == null){
      showDialog(
        context: context,
        builder: (BuildContext conext)=> alertDialog
      );
    }
    else{
      setState(() {
        _logueado= true;
        _user = usuario.usuario;
      });      
    }
    
  }
  void agregarAspirante()async{
	  final route = MaterialPageRoute(
		   builder: (context) => Registro(this._base));
	  Navigator.push(context, route);
  }
}

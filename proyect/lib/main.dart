import 'package:flutter/material.dart';
import 'package:proyect/Base.dart';
import 'package:proyect/menu.dart';
import 'package:proyect/models/FormCard.dart';
import 'package:proyect/models/Usuario.dart';
import 'package:proyect/registro.dart';
import 'models/Usuario.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Final',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  FormCard login = new FormCard();
  Base base = new Base();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            login.build(context),
            Center(
              child: RaisedButton(
                child: Text('Ingresar'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){
                	print(login.user);
                  print(login.pw);
                	validarLogin(context,login.user,login.pw);},
              ),
            )
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          agregarAspirante();
        },
        
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void validarLogin(BuildContext context,String user, String password ) async{
    Usuario usuario = await base.getLogin(user, password);
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
      final route = MaterialPageRoute(
      builder: (context) => Menu());
      Navigator.pop(context);
      Navigator.push(context, route);
      
    }
    
  }
  void agregarAspirante()async{
	  final route = MaterialPageRoute(
		   builder: (context) => Registro(this.base));
	  Navigator.push(context, route);
  }

  void pantalla(BuildContext context){
	  final route = MaterialPageRoute(
		   builder: (context) => Menu());
	  Navigator.pushReplacement(context, route);
  }
}
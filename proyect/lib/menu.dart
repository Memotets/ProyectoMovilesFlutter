import 'package:flutter/material.dart';
import 'package:proyect/Base.dart';
import 'package:proyect/main.dart';
import 'package:proyect/registro.dart';

void main() => runApp(Menu());

class Menu extends StatelessWidget {
  // This widget is the root of your application.
  Base base;
  Menu({Key key, Base base}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Final',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Proyecto Final',base: base, ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  Base base;
  MyHomePage({Key key, this.title, Base base}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Base base;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer:  Drawer(
        child: ListView(
          children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.person, color: Colors.white, size: 50.0),
                ),
                accountName: Text('John Doe'),
                accountEmail: Text('contact@example.com'),
              ),

              ListTile(
                title: Text('Agregar aspirante'),
                leading: Icon(Icons.favorite, color: Colors.grey,),
                onTap: (){
               
                _agregarAspirante(context);
                }
                               
                 
              ),
              ListTile(
                title: Text('Sincronizar'),
                leading: Icon(Icons.bookmark, color: Colors.grey,),
                onTap: (){
               
                _sincronizar();
                }
              ),

              ListTile(
                title: Text('No sincronizados'),
                leading: Icon(Icons.camera_alt, color: Colors.grey,),
               onTap: (){
               
                _noSincronizados();
                }
              ),

              ListTile(
                title: Text('Cerrar sesión'),
                leading: Icon(Icons.map, color: Colors.grey,),
                onTap: (){
                _cerrarSesion(context);
                }
              ),
          ],
          ),
      ),
      body: Center(
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Text("Soy nuevo"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter(){

  }

  void _agregarAspirante(BuildContext context){
    final route = MaterialPageRoute(
		   builder: (context) => Registro(this.base));
	  Navigator.push(context, route);

  }

  void _sincronizar(){
   final route = MaterialPageRoute(
		   builder: (context) => Sincronizar(this.base));
	  Navigator.push(context, route);
  }

  void _noSincronizados(){
    final route = MaterialPageRoute(
		   builder: (context) => NoSincronizados(this.base));
	  Navigator.push(context, route);
  }

  void _cerrarSesion(BuildContext context){
    final route = MaterialPageRoute(
		   builder: (context) => MyApp());
    Navigator.pop(context);
	  Navigator.push(context, route);
    

  }

}

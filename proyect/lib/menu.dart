import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Proyecto Final'),
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
               
                _agregarAspirante();
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
               
                _cerrarSesion();
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

  void _agregarAspirante(){

  }

  void _sincronizar(){

  }

  void _noSincronizados(){

  }

  void _cerrarSesion(){

  }

}
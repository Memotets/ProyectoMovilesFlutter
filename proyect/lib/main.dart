import 'package:flutter/material.dart';
import 'package:proyect/models/FormCard.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 18
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(16),),
                Center(
                  child: Image.asset("assets/ipn-logo.png")
                )
              ],
            ),
            FormCard(),
            Center(
              child: RaisedButton(
                child: Text('Ingresar'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){},
              ),
            )
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        
        child: Icon(Icons.add),
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
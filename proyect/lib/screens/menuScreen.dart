import 'package:flutter/material.dart';
import 'package:proyect/app/app.dart';
import 'package:proyect/models/Base.dart';
import 'package:proyect/screens/registroAspirante.dart';
import 'package:proyect/screens/sincronizarScreen.dart';
import 'package:proyect/screens/nosyncScreen.dart';

class MenuScreen extends StatelessWidget {
  final String user;
  final Base base;
  const MenuScreen({Key key, this.user, this.base}): super(key:key);

  static Route<dynamic> route (String user){
    return MaterialPageRoute(
      builder: (context)=> MenuScreen(user: user)
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer:  Drawer(
        
        child: ListView(
          children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color:  Color.fromARGB(450, 107, 23, 64)
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:  AssetImage("assets/ipn2.jpg"),// NetworkImage('https://mr.travelbymexico.com/imgBase/2018/02/ipn1-compressor.jpg',),
                ),
                accountName: Text(user),
                accountEmail: null,
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
               
                _sincronizar(context);
                }
              ),

              ListTile(
                title: Text('No sincronizados'),
                leading: Icon(Icons.camera_alt, color: Colors.grey,),
               onTap: (){
               
                _noSincronizados(context);
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
        child: Image.asset("assets/ipn.jpg",),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.info),
        onPressed: (){},
      ),
    );
  }
  
  void _agregarAspirante(BuildContext context){
    final route = MaterialPageRoute(
		   builder: (context) => registroAspirante(this.base));
	  Navigator.push(context, route);

  }

  void _sincronizar(BuildContext context){ 
    final route = MaterialPageRoute(
		   builder: (context) => SyncScreen(base));
	  Navigator.push(context, route);
   }

  void _noSincronizados(BuildContext context){  
    final route = MaterialPageRoute(
		   builder: (context) => NoSyncScreen(base));
	  Navigator.push(context, route);
  }

  void _cerrarSesion(BuildContext context){
    final route = MaterialPageRoute(
		   builder: (context) => MiApp());
	  Navigator.pushReplacement(context, route);
  }

}


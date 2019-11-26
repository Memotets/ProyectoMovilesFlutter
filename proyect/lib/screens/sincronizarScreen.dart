import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyect/models/Aspirante.dart';
import 'package:proyect/models/Base.dart';
import 'package:proyect/screens/nosyncScreen.dart';

class SyncScreen extends StatefulWidget {
  Base base;
  
  SyncScreen(Base base){this.base= base;}
  @override
  _SyncScreenState createState() => _SyncScreenState(base);
}

class _SyncScreenState extends State<SyncScreen> {
  Base base;
 
  List<DataRow> registros=[];
  List<Aspirante> aspirantes=[];
  List<Aspirante> nosync=[];
  
  _SyncScreenState(Base base){this.base = base;}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sincronizar Aspirantes'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder(
            future: base.getAspirante(),
            builder: (context,snapshot){
              if(snapshot.hasData){   
                aspirantes.clear();
                registros.clear();             
                for (var item in snapshot.data){ 
                  Aspirante aux= new Aspirante.fromJson(item);
                  aspirantes.add(aux);    
                }
                for (var a in aspirantes) {
                  DataRow dataRow = new DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: IconButton(
                            onPressed: (){
                              print('No deberia estar aqui');
                              sincronizarAspirante(a);
                            },
                            icon: Icon(Icons.sync),
                          )
                        )
                      ),
                      DataCell(Text('${a.nombre} ${a.aPaterno} ${a.aMaterno}')),
                      DataCell(Text(a.telefono)),
                      DataCell(Text(a.correo)),
                      DataCell(Text(a.fecha)),
                    ]
                  );
                  registros.add(dataRow);
                }
                return tabla();
              }else if(snapshot.hasError){
                return Text("Upss..");
              }
              return CircularProgressIndicator();
              } 
          ) 
      ) ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> sincronizarTabla(),         
        child: Icon(Icons.sync),
      ),
    );
  }

  void sincronizarAspirante(Aspirante asp) async{
    String apilink = 'http://sistemas.upiiz.ipn.mx/isc/sira/api/actionAddAspiranteApp.php';
    apilink+='?nombre=${asp.nombre}&email=${asp.correo}&movil=${asp.telefono}&accion=agregar';
    var resAPI = await http.get(apilink);
    if (resAPI.statusCode == 200) {
      var status = json.decode(resAPI.body);
      print(status);
      if (status["estado"]== 1) {
        base.deleteAspirante(aspirantes.indexOf(asp)+1);
        print('Deberia borrar, pero no borro');
      }
  
      else{
        int i = aspirantes.indexOf(asp);
        aspirantes[i].mensaje=status["mensaje"];
      }
        
    }
    else{
       throw Exception('Error: ${resAPI.statusCode}');
     }
  }

  void sincronizarTabla(){
    for (var item in aspirantes) 
      sincronizarAspirante(item);
    toNoSyncScreen();
  }

  void toNoSyncScreen(){
    final route = MaterialPageRoute(
		   builder: (context) => NoSyncScreen());
	  Navigator.push(context, route);
  }

  Widget tabla(){
    return DataTable(
          columns: [
            DataColumn(label: Text('')),
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Telefono')),
            DataColumn(label: Text('email')),
            DataColumn(label: Text('Fecha de registro')),          
          ],
          rows: registros,
    );
    
  }
  
}
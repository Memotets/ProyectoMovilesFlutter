import 'package:flutter/material.dart';
import 'package:proyect/models/Aspirante.dart';
import 'package:proyect/models/Base.dart';
//import 'dart:convert';


class SyncScreen extends StatefulWidget {
  Base base;
  
  SyncScreen(Base base){this.base= base;}
  @override
  _SyncScreenState createState() => _SyncScreenState(base);
}

class _SyncScreenState extends State<SyncScreen> {
  Base base;
 
  List<DataRow> registros=[];
  
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
                List<Aspirante> aspirantes=[];
              for (var item in snapshot.data){ 
                Aspirante aux= new Aspirante.fromJson(item);
                aspirantes.add(aux);    
              }
              for (var a in aspirantes) {
              DataRow dataRow = new DataRow(
              cells: [
                DataCell(Center(child: Icon(Icons.sync),)),
                DataCell(Text(a.nombre+' '+a.aPaterno+' '+a.aMaterno)),
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
        onPressed: (){
          setState(() {
           // llenarRegistros();
          });
        },
        child: Icon(Icons.sync),
      ),
    );
  }
  /*
  void llenarRegistros() async{  
    List<Aspirante> aspirantes=[];
    var snapshot = await base.getAspirante();

    for (var item in snapshot){ 
      Aspirante aux= new Aspirante.fromJson(item);
      aspirantes.add(aux);    
    }
    for (var a in aspirantes) {
      DataRow dataRow = new DataRow(
        cells: [
          DataCell(Text(a.nombre+' '+a.aPaterno+' '+a.aMaterno)),
          DataCell(Text(a.telefono)),
          DataCell(Text(a.correo)),
          DataCell(Text(a.fecha)),
        ]
      );
      registros.add(dataRow);
    }
    

  }
  */
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
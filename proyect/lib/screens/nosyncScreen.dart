import 'package:flutter/material.dart';
import 'package:proyect/models/Aspirante.dart';
import 'package:proyect/models/Base.dart';


class NoSyncScreen extends StatefulWidget {
  Base base;
  
  NoSyncScreen(Base base){this.base= base;}
  @override
  _NoSyncScreenState createState() => _NoSyncScreenState(base);
}

class _NoSyncScreenState extends State<NoSyncScreen> {
  Base base;
 
  List<DataRow> registros=[];
  List<Aspirante> aspirantes=[];
  //List<Aspirante> nosync=[];
  
  _NoSyncScreenState(Base base){this.base = base;}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aspirantes no sincronizados'),
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
                  if(aux.mensaje != null)
                    aspirantes.add(aux);    
                }
                for (var a in aspirantes) {
                  DataRow dataRow = new DataRow(
                    cells: [
                      DataCell(Text(a.mensaje)),
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
    );
  }

  

  Widget tabla(){
    return DataTable(
          columns: [
            DataColumn(label: Text('Mensaje')),
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Telefono')),
            DataColumn(label: Text('email')),
            DataColumn(label: Text('Fecha de registro')),          
          ],
          rows: registros,
    );
    
  }
  
}
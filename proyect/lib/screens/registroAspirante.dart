import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyect/models/Base.dart';
import 'package:proyect/models/Aspirante.dart';

class registroAspirante extends StatefulWidget{
   Base base;
	registroAspirante(Base base) {this.base = base;}
 
  @override
  State<StatefulWidget> createState() => new RegistroState();
}

class RegistroState extends State<registroAspirante>{
  final apellidodos =TextEditingController();
  final apellidouno =TextEditingController();
  final correo =TextEditingController();
  final edad =TextEditingController();
  final nombre =TextEditingController();
  final sexo =TextEditingController();
  final telefono =TextEditingController();
  //Base base;  
  var pn, pa, sa,age,phone, email ,s, o,oo,ooo,unoopc,dosopc,tresopc,sex;
   
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
 
  Widget build(BuildContext context){
    return Scaffold(
        key: scaffoldKey,
      appBar: new AppBar(
        title: Text('Registrar aspirante'),
        actions: <Widget>[
        ],
      ),   
        body: SingleChildScrollView (
         child: new Padding(
        padding: const EdgeInsets.all(16),
        child: new Form(
          key: formKey,
          child: new Container(child: Column(children: <Widget>[
            SizedBox(height: 10.0),
            TextFormField(
              controller: nombre,
              keyboardType: TextInputType.text,             
              decoration: new InputDecoration(
                labelText: "Primer nombre",
                hintText: 'Ingresar nombre',
                prefixIcon: Icon(Icons.person),
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],
              ),
              validator: (val)=> val.length == 0 ? "Ingresa tu primer nombre":null,
              onChanged: (str){
								 	this.pn= str;
                   print(str);
								 },
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: apellidouno,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Primer apellido", prefixIcon: Icon(Icons.person),
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu primer apellido":null,
              onChanged: (str){
								 	this.pa= str;
								 },
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: apellidodos,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Segundo apellido", prefixIcon: Icon(Icons.person),
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu segundo apellido":null,
              onChanged: (str){
								 	this.sa= str;
								 },
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: edad,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: "Edad",prefixIcon: Icon(Icons.calendar_today),
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu edad":null,
              onChanged: (str){
								 	this.age= str;
								 },
            ),
            SizedBox(height: 15.0),
           DropdownButtonFormField(
                decoration: new InputDecoration(
                  prefixIcon: Icon(Icons.wc),
                labelText: "Sexo",              
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],
              ),
                  value: s,
                  items:  ["Masculino","Femenino","Otr@"].map((label)=> DropdownMenuItem(
              child: Text(label.toString()),
              value: label)).toList(),
                 onChanged: (value){
                    setState(() {
                this.s = value;
                this.sex=value;
              });
                  },
            ),
             SizedBox(height: 15.0),
            TextFormField(
              controller: correo,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(labelText: "Correo", prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu correo":null,
              onChanged: (str){
								 	this.email= str;
								 },
            ),
             SizedBox(height: 15.0),
            TextFormField(
              controller: telefono,             
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(labelText: "Telefono", prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu telefono":null,
              onChanged: (str){
								 	this.phone= str;       
								 },              
            ),
             SizedBox(height: 15.0),          
            DropdownButtonFormField<String>(              
                decoration: new InputDecoration(
                labelText: "Primera opcion",    
                prefixIcon: Icon(Icons.bookmark_border),           
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],
                ),
                value: o,
                items:  ["Sistemas computacionales","Ambiental","Mecatrónica","Alimentos","Metalúrgica"].map((label)=> DropdownMenuItem(
              child: Text(label.toString()),
              value: label)).toList(),
                onChanged: (value){
                    setState(() {
                this.unoopc = value;
                this.o=value;
              });
                  },
            ),
             SizedBox(height: 15.0),
            DropdownButtonFormField<String>(
                decoration: new InputDecoration(labelText: "Segunda opción", prefixIcon: Icon(Icons.bookmark_border),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),       
                value: oo,
                items: ["Sistemas computacionales","Ambiental","Mecatrónica","Alimentos","Metalúrgica"].map((label)=> DropdownMenuItem(
              child: Text(label.toString()),
              value: label)).toList(),
                onChanged: (value){
                    setState(() {
                this.dosopc = value;
                this.oo=value;
              });
                  },
            ),
             SizedBox(height: 15.0),
            DropdownButtonFormField<String>(
              decoration: new InputDecoration(labelText: "Tercera opción", prefixIcon: Icon(Icons.bookmark_border),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[70],),
              value: ooo,
              items:  ["Sistemas computacionales","Ambiental","Mecatrónica","Alimentos","Metalúrgica"].map((label)=> DropdownMenuItem(
              child: Text(label.toString()),
              value: label)).toList(),
             onChanged: (value){
                    setState(() {
                this.tresopc = value;
                this.ooo=value;
              });
                  },
            ),
             SizedBox(height: 15.0),
            new Container(
              margin: const EdgeInsets.only(top: 10),
              child: new RaisedButton(
                color: Colors.teal[200],
                onPressed: submitAspirante,
                child: Text('Agregar aspirante'),
              ),
            )
          ]),
        ),
        )
      ),
    ),
    );
  }

   void submitAspirante()async{
     String mensaje="";
     DateTime now = new DateTime.now();
     DateTime date = new DateTime(now.year, now.month, now.day);
     String fech=date.toString();

     if(nombre.text.length >2 && apellidouno.text.length>2 
     && edad.text.length > 1 && telefono.text.length==10 
     && correo.text.length>1){
       if(o!=oo && ooo!=o && ooo!=oo){
          Aspirante asp =new Aspirante();
          var base = new Base();
          asp.nombre=pn;
          asp.aPaterno=pa;
          asp.aMaterno=sa;
          asp.edad=age;
          asp.sexo=sex;
          asp.correo=email;
          asp.telefono=phone;
          asp.procedencia="";
          asp.primerO=unoopc;
          asp.segundaO=dosopc;
          asp.tercerO=tresopc;
          asp.fecha=fech;
          int a = await base.addAspirante(asp);
          mensaje="Aspirante agregado";
       }else{
         mensaje="Revisa tus opciones de carrera";
       }

     }else{
       mensaje="Faltan datos, revisa tu información";
     }
    Fluttertoast.showToast(
      msg: mensaje
    );

}

  /*String fechear(DateTime d){
     String y = d.;
      String y = _fourDigits(year);
    String m = _twoDigits(month);
    String d = _twoDigits(day);
    return
  }*/

}
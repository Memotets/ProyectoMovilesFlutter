
import 'package:flutter/material.dart';
import 'Base.dart';
import 'package:intl/intl.dart';

class registroAspirante extends StatefulWidget{
  Base base;
	registroAspirante(Base base) {
		this.base = base;
	}
  @override
  State<StatefulWidget> createState() => new RegistroState();
}

class RegistroState extends State<registroAspirante>{
  String pn, sn, pa, sa, email, s,o;
  int age, phone;
  List genero =["Masculino", "Femenino", "Otrx"];
  List opciones =["Sistemas computacionales","Ambiental","Mecatrónica","Alimentos","Metalúrgica"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  List<DropdownMenuItem<String>> _dropDownMenuItemsOpc;
  //List<DropdownMenuItem<String>> getDropDownMenuItems();
 // List<DropdownMenuItem<String>> items = new List();
  DateTime selected;
  time() async {
   selected = await showDatePicker(
     context: context,

    initialDate: new DateTime.now(),
    firstDate: new DateTime(1990),
    lastDate: new DateTime(2050),
   );
   setState(() {
     
   });
 }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String gen in genero) {
      items.add(new DropdownMenuItem(
          value: gen,
          child: new Text(gen)
      ));
    }
    return items;
  }
  List<DropdownMenuItem<String>> getDropDownMenuItemsOpciones() {
    List<DropdownMenuItem<String>> items = new List();
    for (String opc in opciones) {
      items.add(new DropdownMenuItem(
          value: opc,
          child: new Text(opc)
      ));
    }
    return items;
  }


  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  
  @override
  


  void initState() {
    
    _dropDownMenuItems = getDropDownMenuItems();
    s = _dropDownMenuItems[0].value;
    _dropDownMenuItemsOpc = getDropDownMenuItemsOpciones();
    o = _dropDownMenuItemsOpc[0].value;
    super.initState();
  }
 

  Widget build(BuildContext context){
    

    return Scaffold(
        key: scaffoldKey,
      appBar: new AppBar(
        title: Text('Registrar aspirante'),
        actions: <Widget>[
        ],
      ),
      
        body: new Card (
         child: new Padding(
        padding: const EdgeInsets.all(16),
        child: new Form(
          key: formKey,
          child: new SingleChildScrollView(child: Column(children: <Widget>[
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.text,
              
              decoration: new InputDecoration(
                labelText: "Primer nombre",
                hintText: 'Ingresar nombre',
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],
              ),
              validator: (val)=> val.length == 0 ? "Ingresa tu primer nombre":null,
              onChanged: (str){
								 	this.pn= str;
								 },
            ),
             SizedBox(height: 15.0),
            TextFormField(
              keyboardType: TextInputType.text,
              
              decoration: new InputDecoration(labelText: "Segundo nombre",
               contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              validator: (val)=> val.length == 0 ? "Ingresa tu segundo nombre":null,
              onChanged: (str){
								 	this.sn= str;
								 },
            ),
            SizedBox(height: 15.0),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Primer apellido",
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
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Segundo apellido",
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
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Edad",
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu edad":null,
              onChanged: (str){
								 	this.age= str as int;
								 },
            ),
            SizedBox(height: 15.0),
           DropdownButtonFormField(

                   decoration: new InputDecoration(
                labelText: "Sexo",
                
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],
              ),
                  value: s,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
            ),
             SizedBox(height: 15.0),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Correo",
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
              
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(labelText: "Telefono",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu telefono":null,
              onChanged: (str){
								 	this.phone= str as int;
								 },
              
            ),
             SizedBox(height: 15.0),
            
            DropdownButtonFormField(
               decoration: new InputDecoration(
                labelText: "Primera opcion",
                
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],
              ),
                value: o,
                items: _dropDownMenuItemsOpc,
                onChanged: changedDropDownItemOpc,
            ),
             SizedBox(height: 15.0),
            DropdownButtonFormField(
                decoration: new InputDecoration(labelText: "Segunda opción",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
               
                value: o,
                items: _dropDownMenuItemsOpc,
                onChanged: changedDropDownItemOpc,
            ),
             SizedBox(height: 15.0),
              
             


            DropdownButtonFormField(
              decoration: new InputDecoration(labelText: "Tercera opción",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
                value: o,
                items: _dropDownMenuItemsOpc,
                onChanged: changedDropDownItemOpc,
            ),
             SizedBox(height: 15.0),
            Card(
              
              color: Colors.grey[100],
                  shape: RoundedRectangleBorder(
	
      borderRadius: BorderRadius.circular(10.0),
	
    ),
              child: ListTile(
              
              title: Text('Fecha'),
              subtitle: selected != null ? new Text(new DateFormat('yyyy-MMM-dd').format(selected))
              : Text(''),
                leading: new IconButton(
              
              icon: new Icon(
                Icons.date_range,
                size: 35,
              ), 
            
              onPressed: ()=> time(),
            ),

            ),),
           
              
              SizedBox(height: 15.0),
             
             
           
              /*TextFormField(
                
              readOnly: true,
              enabled: false,

              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(
                alignLabelWithHint: true,
               
               
                
                labelText:  selected != null ? new DateFormat('yyyy-MMM-dd').format(selected): '',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
             
              
            )
             , */
              
            
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

   void submitAspirante(){
    }

  void changedDropDownItem(String selectedGen) {
    setState(() {
      s = selectedGen;
    });
  }
  void changedDropDownItemOpc(String selectedOpc) {
    setState(() {
      o = selectedOpc;
    });
  }



  }
  
  

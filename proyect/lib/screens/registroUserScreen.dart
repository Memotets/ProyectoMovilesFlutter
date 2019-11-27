import 'package:flutter/material.dart';
import 'package:proyect/models/Usuario.dart';
import 'package:proyect/models/Base.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registro extends StatefulWidget {
	Base base;
	Registro(Base base) {
		this.base = base;
	}
  @override
  _RegistroState createState() => _RegistroState(base);
}

class _RegistroState extends State<Registro> {
	Base base;
	Usuario user=new Usuario();

	String name, pass, repeatpass;

	var namae = TextEditingController();
	final passwordCtrl =  TextEditingController();
	final repeatPassCtrl =  TextEditingController();

	final scaffoldKey = new GlobalKey<ScaffoldState>();
	final formKey = new GlobalKey<FormState>();
	_RegistroState(Base base){
		this.base = base;
	}
	@override
	Widget build(BuildContext context) {


		return Scaffold(
			key: scaffoldKey,
			appBar: new AppBar(
				title: Text('Nuevo Usuario'),
				actions: <Widget>[
				],
			),

			body: new Padding(
				 padding: const EdgeInsets.all(16),
				 child: new Form(
					 key: formKey,
					 child: new Column(
						 children: <Widget>[
							 TextFormField(
                 controller: namae,
								 keyboardType: TextInputType.text,
								 decoration: new InputDecoration(labelText: "Nombre",prefixIcon: Icon(Icons.person,
                 
                 ),
                  enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
                 
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],
                 ), 
                 
								 validator: (val)=> val.length == 0 ? "Ingresa el nombre del nuevo usuario":null,
								 onChanged: (str){
								 	this.name= str;
								 	print(str);
								 },
							 ),
                SizedBox(height: 15.0),
							 TextFormField(
								 controller: passwordCtrl,
								 keyboardType: TextInputType.text,
								 decoration: new InputDecoration(labelText: "Contraseña",prefixIcon: Icon(Icons.lock),
                 
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                 enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
                filled: true,
                fillColor: Colors.grey[70],
                 ),
								 validator: (val)=> val.length == 0 ? "Ingresa la contraseña":null,
								 obscureText: true,
								 onChanged: (str){
									 this.pass= str;
									 print(str);
								 },
							 ),
                SizedBox(height: 15.0),
							 TextFormField(
								 controller: repeatPassCtrl,
								 keyboardType: TextInputType.text,
								 decoration: new InputDecoration(labelText: "Repetir contraseña",prefixIcon: Icon(Icons.lock),
                 
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                 enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
                filled: true,
                fillColor: Colors.grey[70],
                 ),
								 obscureText: true,
								 onChanged: (str){
								 	this.repeatpass=str;
								 },
							 ),
               SizedBox(height: 18.0),
                Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20.0),
          color: Color.fromARGB(450, 107, 23, 64),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: (){
										 submitUsuario();
									 },
            child: Text("Agregar Usuario",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                ),
          ),
        ),
							/* new Container(
								 margin: const EdgeInsets.only(top: 10),
								 child: new RaisedButton(
									 color: Colors.blue,
									 onPressed: (){
										 submitUsuario();
									 },
									 child: Text('Agregar Usuario'),
								 ),
							 )*/
						 ],
					 ),
				 )
			),
		);
	}
	void submitUsuario()async{
    String mensaje = "";
    if(namae.text.length==0 || passwordCtrl.text.length==0 || repeatPassCtrl.text.length==0){
      mensaje = "Rellena los campos";
    }else{
		if(pass != repeatpass){
      mensaje = "Las contraseñas no coinciden";
			
		}else{
		
			var base = new Base();
			Usuario u = await base.getUser(name);
			if(u != null){
        mensaje = "El usuario ya existe";
				
			}else{
        
				
				Usuario user = new Usuario();
				user.usuario=name;
				user.password=pass;
				int a = await base.insertaUsuario(user);
        mensaje = "Usuario agregado";
			}
		}
    
	}
  Fluttertoast.showToast(
      msg: mensaje
    );
  }
}


import 'package:flutter/material.dart';
import 'models/Usuario.dart';
import 'Base.dart';
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
								 keyboardType: TextInputType.text,
								 decoration: new InputDecoration(labelText: "Nombre"),
								 validator: (val)=> val.length == 0 ? "Ingresa el nombre del nuevo usuario":null,
								 onChanged: (str){
								 	this.name= str;
								 	print(str);
								 },
							 ),
							 TextFormField(
								 controller: passwordCtrl,
								 keyboardType: TextInputType.text,
								 decoration: new InputDecoration(labelText: "Contraseña"),
								 validator: (val)=> val.length == 0 ? "Ingresa la contraseña":null,
								 obscureText: true,
								 onChanged: (str){
									 this.pass= str;
									 print(str);
								 },
							 ),
							 TextFormField(
								 controller: repeatPassCtrl,
								 keyboardType: TextInputType.text,
								 decoration: new InputDecoration(labelText: "Repetir contraseña"),
								 obscureText: true,
								 onChanged: (str){
								 	this.repeatpass=str;
								 },
							 ),
							 new Container(
								 margin: const EdgeInsets.only(top: 10),
								 child: new RaisedButton(
									 color: Colors.blue,
									 onPressed: (){
										 submitUsuario();
									 },
									 child: Text('Agregar Usuario'),
								 ),
							 )
						 ],
					 ),
				 )
			),
		);
	}
	void submitUsuario()async{
    String mensaje = "";
		if(pass != repeatpass){
      mensaje = "Las contraseñas no coinciden";
			//print("Las contrase�as no coinciden") ;
		}else{
			//print("Las contrase�as coinciden") ;
			var base = new Base();
			Usuario u = await base.getUser(name);
			if(u != null){
        mensaje = "El usuario ya existe";
				//print("El usuario ya existe");
				//print(name);
				//print(pass);
			}else{
        
				//print("El usuario no existe");
				Usuario user = new Usuario();
				user.usuario=name;
				user.password=pass;
				//print(name);
				//print(pass);
				int a = await base.insertaUsuario(user);
				//print(a);
        mensaje = "Usuario agregado";
			}
		}
    Fluttertoast.showToast(
      msg: mensaje
    );
	}
}


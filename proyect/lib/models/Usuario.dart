class Usuario{
	String usuario;
	String password;

	Usuario({this.usuario,this.password});

	Map<String, dynamic> toJson()=>{
		"nombre":usuario,
		"contra":password
	};

	factory Usuario.fromJson(Map<String, dynamic> data)=> Usuario(
		 usuario:data["nombre"],
		 password:data["contra"]
	);

}
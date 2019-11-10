class Usuario{
	String usuario;
	String password;

	Usuario({this.usuario,this.password});

	Map<String, dynamic> toJson()=>{
		"usuario":usuario,
		"password":password
	};

	factory Usuario.fromJson(Map<String, dynamic> data)=> Usuario(
		 usuario:data["user"],
		 password:data["password"]
	);

}
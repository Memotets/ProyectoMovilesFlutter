class Usuario{
	String id;
	String usuario;
	String password;

	Usuario({this.id,this.usuario,this.password});

	Map<String, dynamic> toJson()=>{
		"id":id,
		"usuario":usuario,
		"password":password
	};

	factory Usuario.fromJson(Map<String, dynamic> data)=> Usuario(
		 id: data["id"],
		 usuario:data["user"],
		 password:data["password"]
	);

}
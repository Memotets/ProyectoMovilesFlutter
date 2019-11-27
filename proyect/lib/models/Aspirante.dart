class Aspirante{
	String nombre;
	String aPaterno;
	String aMaterno;
	String edad;
	String sexo;
	String correo;
	String telefono;
	String procedencia;
	String primerO;
	String segundaO;
	String tercerO;
	String fecha;
	String mensaje;
  int id;
  

	Aspirante({this.nombre, this.aPaterno, this.aMaterno,this.edad, this.sexo, this.correo,
		 this.telefono, this.procedencia, this.primerO, this.segundaO,
		 this.tercerO, this.fecha, this.mensaje,this.id});

  
	Map<String, dynamic> toJson()=>{
		"nombre": this.nombre,
		"aPaterno": this.aPaterno,
		"aMaterno": this.aMaterno,
		"edad":this.edad,
		"sexo": this.sexo,
		"correo": this.correo,
		"telefono": this.telefono,
		"procedencia": this.procedencia,
		"priO": this.primerO,
		"segO": this.segundaO,
		"terO": this.tercerO,
		"fecha": this.fecha,
		"mensaje": this.mensaje,
    "id": this.id
	};

	factory Aspirante.fromJson(Map<String, dynamic> data)=> Aspirante(
		 nombre:data["nombre"],
		 aPaterno:data["aPaterno"],
		 aMaterno:data["aMaterno"],
		 edad:data["edad"],
		 sexo:data["sexo"],
		 correo:data["correo"],
		 telefono:data["telefono"],
		 procedencia:data["procedencia"],
		 primerO:data["priO"],
		 segundaO:data["segO"],
		 tercerO:data["terO"],
		 fecha:data["fecha"],
		 mensaje: data["mensaje"],
     id: data["id"]
	);

}
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


	Aspirante({this.nombre, this.aPaterno, this.aMaterno,this.edad, this.sexo, this.correo,
		 this.telefono, this.procedencia, this.primerO, this.segundaO,
		 this.tercerO, this.fecha});

	Map<String, dynamic> toJson()=>{
		"nombre": this.nombre,
		"aPaterno": this.aPaterno,
		"aMaterno": this.aMaterno,
		"edad":this.edad,
		"sexo": this.sexo,
		"correo": this.correo,
		"telefono": this.telefono,
		"procedencia": this.procedencia,
		"primerO": this.primerO,
		"segundaO": this.segundaO,
		"tercer0": this.tercerO,
		"fecha": this.fecha
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
		 primerO:data["primerO"],
		 segundaO:data["segundaO"],
		 tercerO:data["tercerO"],
		 fecha:data["fecha"]
	);

}
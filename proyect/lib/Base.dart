import 'package:proyect/models/Aspirante.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'models/Usuario.dart';

class Base{

	Base();

	Future<Database> get base async{
		//Ruta de las bases de datos
		//En el celular
		String pathBases = await getDatabasesPath();

		//Genero la ruta completa
		String rutaCompleta = join(pathBases,"InscripcionAspirantes.db");

		//Abre la base de datos
		//Uniendo el ruta + nombre_de_la_base_de_datos
		var dataBase = await openDatabase(
			 rutaCompleta,
			 version: 105,
			 onOpen: (db){},
			 onCreate: (db,version){
				 //Solo se ejecuta la primera vez
				 //o cuando la versión cambie de
				 db.execute("CREATE TABLE Usuario(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, contra TEXT); ");
				 db.execute("CREATE TABLE Aspirante(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, aPaterno TEXT, aMaterno TEXT, edad TEXT, sexo TEXT, correo TEXT, telefono TEXT, procedencia TEXT, priO TEXT, segO TEXT, terO TEXT, fecha TEXT, procede TEXT, mensaje TEXT); ");
			 }
		);
		return dataBase;
	}
//Insert
	Future<int> insertaUsuario(Usuario a) async{
		var db = await base;

		var result = await db.insert("Usuario", a.toJson());

		return result;
	}

	Future<int> insertaUsuario2(Usuario a) async{
		var db = await base;

		var result=await db.rawInsert("INSERT INTO Usuario(nombre,contra) VALUES('${a.usuario}','${a.password}')");

		return result;

	}
//Delete
	Future<int> deleteUsuario(int id) async {
		final db = await base;

		var res = db.delete("Usuario", where: "id = ?", whereArgs: [id]);

		return res;
	}
//Get User by Id
	Future<Usuario>getUser(String user) async {
		final db = await base;
		var res =await  db.query("Usuario", where: "nombre = ?", whereArgs: [user]);
		if (res.length > 0) {
			return new Usuario.fromJson(res.first);
		}
		print("Error Login");
		return null;
	}

	//Validate User on login
	Future<Usuario> getLogin(String user, String password) async {
		var db = await base;

		var res = await db.rawQuery("SELECT * FROM Usuario WHERE nombre = '$user' and contra = '$password'");

		if (res.length > 0) {
			return new Usuario.fromJson(res.first);
		}
		print("Error Login");
		return null;
	}

	//agregar aspirante
	Future<int> addAspirante (Aspirante a)async{
		var db = await base;
		print(a.toJson());
		var result = await db.insert("Aspirante", a.toJson());

		return result;
	}

	//eliminar aspirante
	Future<int> deleteAspirante(int id) async {
		final db = await base;

		var res = db.delete("Aspirante", where: "id = ?", whereArgs: [id]);

		return res;
	}

	//Listar - visualizar
	Future<List> getAspirante() async {
		final db = await base;
		var res = await db.rawQuery('SELECT * FROM Aspirante');
		return res.toList();
	}

	//Actualizara por ID
	Future<int> updateAspirante(Aspirante a, int i) async {
		final db = await base;

		var res = await db.update("Aspirante", a.toJson(), where: "id = ?", whereArgs: [i]);

		return res;
	}

//ACTUALIZAR
}

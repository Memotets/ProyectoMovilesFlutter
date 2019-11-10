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
			 version: 1,
			 onOpen: (db){},
			 onCreate: (db,version){
				 //Solo se ejecuta la primera vez
				 //o cuando la versión cambie de
				 db.execute("CREATE TABLE Usuario(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, password TEXT)");
			 }
		);
		return dataBase;
	}

	Future<int> insertaUsuario(Usuario a) async{
		var db = await base;

		var result = await db.insert("Usuario", a.toJson());

		return result;
	}

	Future<int> insertaUsuario2(Usuario a) async{
		var db = await base;

		var result=await db.rawInsert("INSERT INTO Usuario(usuario,password) VALUES('${a.usuario}','${a.password}')");

		return result;

	}

	Future<int> deleteUsuario(int id) async {
		final db = await base;

		db.delete("Usuario", where: "id = ?", whereArgs: [id]);
	}
//FALTAN LOS METODOS DE
//ELIMINAR
//ACTUALIZAR
//LISTAR
}
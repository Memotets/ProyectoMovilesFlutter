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
				 db.execute("CREATE TABLE escuela(id INTEGER PRIMARY KEY, nombre TEXT, clave TEXT, subnivel_id INTEGER, municipio_id INTEGER); ");
				 db.rawInsert("INSERT INTO `escuela` (`id`, `nombre`, `clave`, `subnivel_id`, `municipio_id`) VALUES (1, ' Preparatoria Independencia de Río Grande', ' 32PBH0002I', 2, 2444), (2, ' Juana de Arco', ' 32PBH0003H', 2, 2461), (3, ' Colegio del Centro', ' 32PBH0005F', 2, 2461), (4, ' Escuela Prep Instituto Zacatecas', ' 32PBH0018J', 2, 2422), (5, ' Instituto Tecnológico y de Estudios Superiores de Monterrey Campus Zacatecas', ' 32PBH0036Z', 2, 2422), (6, ' Preparatoria UAF', ' 32PBH0042J', 2, 2415),  (7, ' Preparatoria Vetagrande', ' 32PBH0050S', 2, 2455), (8, ' Instituto Pedagógico J. Peaget', ' 32PBH0051R', 2, 2461),(9, ' Instituto Educativo de Zacatecas', ' 32PBH0052Q', 2, 2422),(10, ' Colegio Federico Froebel', ' 32PBH0053P', 2, 2461), (11, ' Centro Escolar Lancaster de Zacatecas', ' 32PBH0056M', 2, 2422), (12, ' Universidad Autónoma de Durango Campus Zacatecas', ' 32PBH0060Z', 2, 2461), (13, ' Lic. José Minero Roque', ' 32PBH0065U', 2, 2410), (14, ' Preparatoria Comercial Sor Juana Inés de La Cruz', ' 32PBH0069Q', 2, 2461),(15, ' Academia Comercial Remington', ' 32PBH0070F', 2, 2415),(16, ' Preparatoria San Matías', ' 32PBH0071E', 2, 2443),(17, ' Instituto Maxwell', ' 32PBH0077Z', 2, 2425),(18, ' Colegio Juan Pablo Ii', ' 32PBH0078Y', 2, 2444),(19, ' Colegio Daniel Márquez Medina A.C.', ' 32PBH0079X', 2, 2425),(20, ' Colegio Santa Elena', ' 32PBH0080M', 2, 2461), (21, ' Instituto de Formación Integral de Zacatecas', ' 32PBH0082K', 2, 2422),(22, ' Escuela Preparatoria Particular Ramón  López Velarde', ' 32PBH0085H', 2, 2415), (23, ' Instituto Ausubel', ' 32PBH0086G', 2, 2429),(24, ' Instituto Educativo Nochistlan', ' 32PBH0088E', 2, 2439), (25, ' Liceo E.S.L. Guadalupe', ' 32PBH0092R', 2, 2461),(26, ' Liceo Universitario Guadalupe', ' 32PBH0093Q', 2, 2415), (27, ' Instituto del Carmen de Guadalupe', ' 32PBH0094P', 2, 2422),(28, ' Instituto de Educación MONREAL Sandoval', ' 32PBH0096N', 2, 2415),(29, ' CONSEJO Educativo de Zacatecas', ' 32PBH0097M', 2, 2422),(30, ' Colegio Juan Pablo Ii El Grande', ' 32PBH0098L', 2, 2443),(31, ' Superior Teaching Preparatoria', ' 32PBH0102H', 2, 2422),(32, ' Bachillerato General Sierra Madre', ' 32PBH0105E', 2, 2461),(33, ' Instituto Educativo de Calera', ' 32PBH0106D', 2, 2410),(34, ' Instituto Asis de Guadalupe', ' 32PBH0107C', 2, 2422),(35, ' Colegio Río Grande', ' 32PBH0108B', 2, 2444),(36, ' Instituto Edison Ac', ' 32PCB0021B', 2, 2422),(37, ' Cultura  Educación de Fresnillo Asociación Civil', ' 32PCB0022A', 2, 2415), (38, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32DMS0001Q', 2, 2443),(39, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32DMS0002P', 2, 2454),(40, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32DMS0003O', 2, 2434),(41, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0001P', 2, 2443), (42, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0002O', 2, 2415),(43, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0003N', 2, 2443),(44, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0004M', 2, 2440),(45, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0005L', 2, 2454),(46, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0006K', 2, 2419),(47, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0007J', 2, 2456),(48, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0010X', 2, 2415),(49, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0012V', 2, 2443),(50, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0013U', 2, 2431),(51, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0014T', 2, 2431),(52, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0015S', 2, 2459),(53, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0016R', 2, 2415),(54, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0017Q', 2, 2443),(55, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0018P', 2, 2444),(56, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0019O', 2, 2431),(57, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0021C', 2, 2443),(58, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0022B', 2, 2443),(59, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0023A', 2, 2449),(60, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0024Z', 2, 2455),(61, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0025Z', 2, 2452),(62, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0026Y', 2, 2407),(63, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0027X', 2, 2456),(64, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0028W', 2, 2421),(65, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0029V', 2, 2444),(66, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0030K', 2, 2415),(67, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0031J', 2, 2447),(68, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0032I', 2, 2410),(69, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0033H', 2, 2454),(70, ' El Cazadero', ' 32EMS0035F', 2, 2445),(71, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0036E', 2, 2421),(72, ' Educación Media Superior A Distancia', ' 32EMS0037D', 2, 2454),(73, ' Educación Media Superior A Distancia', ' 32EMS0038C', 2, 2456),(74, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0039B', 2, 2460),(75, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0040R', 2, 2455),(76, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0041Q', 2, 2462),(77, ' Centro de Servicios de Educación Media Superior A Distancia', ' 32EMS0042P', 2, 2429),(78, ' Profr. José Santos Valdez', ' 32DBP0002M', 2, 2415),(79, ' Lic. Mauricio Magdaleno', ' 32EBH0001D', 2, 2449),(80, ' José G Montes', ' 32EBH0002C', 2, 2453),(81, ' Profa. Ma de La O Marín Mota', ' 32EBH0003B', 2, 2435),(82, ' Francisco García Salinas', ' 32EBH0006Z', 2, 2425),(83, ' Escuela Preparatoria José Rodríguez Elías', ' 32EBH0007Y', 2, 2428),(84, ' Valentín Gómez Farías', ' 32EBH0008X', 2, 2436),(85, ' Prof. Salvador Vidal G', ' 32EBH0009W', 2, 2451),(86, ' González Ortega', ' 32EBH0011K', 2, 2452),(87, ' Ing.  Gral. Felipe B. Berriozabal', ' 32EBH0019C', 2, 2424),(88, ' Gral Lazaro Cardenas', ' 32EBH0020S', 2, 2439),(89, ' Victor Rosales', ' 32EBH0027L', 2, 2410),(90, ' Preparatoria Villanueva', ' 32EBH0028K', 2, 2460),(91, ' Candelario Huizar', ' 32EBH0030Z', 2, 2460),(92, ' Panfilo Natera', ' 32EBH0031Y', 2, 2421),(93, ' Lazaro Cardenas del Río', ' 32EBH0032X', 2, 2447),(94, ' José Vasconcelos', ' 32EBH0033W', 2, 2431),(95, ' Beatriz Márquez Acosta', ' 32EBH0034V', 2, 2425),(96, ' Ramón  López Velarde', ' 32EBH0035U', 2, 2432),(97, ' Adolfo López Mateos', ' 32EBH0036T', 2, 2447),(98, ' Jaime Torres Bodet', ' 32EBH0037S', 2, 2422),(99, ' Tayahua', ' 32EBH0038R', 2, 2460),(100, ' Genaro Codina', ' 32EBH0039Q', 2, 2449),(101, ' Lic. Agustín Yañez', ' 32EBH0040F', 2, 2423),(102, ' Felix U Gómez', ' 32EBH0041E', 2, 2446),(103, ' Francisco Goitia', ' 32EBH0042D', 2, 2415),(104, ' Jesús Reyes Heroles', ' 32EBH0043C', 2, 2422),(105, ' Daniel Camarena', ' 32EBH0044B', 2, 2422),(106, ' Genaro Codina', ' 32EBH0045A', 2, 2439),(107, ' Eulalio Gutiérrez', ' 32EBH0046Z', 2, 2412),(108, ' Salvador Varela Resendiz', ' 32EBH0048Y', 2, 2443),(109, ' Colegio de Bachilleres ZACATECAS', ' 32ECB0001I', 2, 2422),(110, ' Colegio de Bachilleres', ' 32ECB0002H', 2, 2456),(111, ' Colegio de Bachilleres', ' 32ECB0003G', 2, 2458),(112, ' Colegio de Bachilleres', ' 32ECB0005E', 2, 2425),(113, ' Colegio de Bachilleres', ' 32ECB0006D', 2, 2447),(114, ' Colegio de Bachilleres Ojocaliente', ' 32ECB0007C', 2, 2441),(115, ' Colegio de Bachilleres Pinos', ' 32ECB0008B', 2, 2443),(116, ' Colegio de Bachilleres Sain Alto', ' 32ECB0009A', 2, 2445),(117, ' Colegio de Bachilleres', ' 32ECB0010Q', 2, 2414),(118, ' Colegio de Bachilleres', ' 32ECB0011P', 2, 2406),(119, ' Colegio de Bachilleres', ' 32ECB0012O', 2, 2407),(120, ' Colegio de Bachilleres', ' 32ECB0013N', 2, 2408),(121, ' Colegio de Bachilleres', ' 32ECB0014M', 2, 2409),(122, ' Colegio de Bachilleres Plantel Cañitas de Felipe Pescador', ' 32ECB0015L', 2, 2411),(123, ' Colegio de Bachilleres', ' 32ECB0016K', 2, 2413),(124, ' Colegio de Bachilleres', ' 32ECB0017J', 2, 2416),(125, ' Colegio de Bachilleres', ' 32ECB0018I', 2, 2417),(126, ' Colegio de Bachilleres', ' 32ECB0019H', 2, 2418),(127, ' Colegio de Bachilleres', ' 32ECB0020X', 2, 2420),(128, ' Luis de La Rosa Oteiza', ' 32ECB0022V', 2, 2429),(129, ' Colegio de Bachilleres', ' 32ECB0023U', 2, 2430),(130, ' Colegio de Bachilleres', ' 32ECB0024T', 2, 2433),(131, ' Colegio de Bachilleres', ' 32ECB0025S', 2, 2434),(132, ' Colegio de Bachilleres', ' 32ECB0026R', 2, 2437),(133, ' Colegio de Bachilleres', ' 32ECB0027Q', 2, 2440),(134, ' Colegio de Bachilleres', ' 32ECB0028P', 2, 2442),(135, ' Colegio de Bachilleres Plantel Sombrerete', ' 32ECB0029O', 2, 2447),(136, ' Colegio de Bachilleres', ' 32ECB0030D', 2, 2463),(137, ' Colegio de Bachilleres', ' 32ECB0031C', 2, 2457),(138, ' Colegio de Bachilleres', ' 32ECB0032B', 2, 2454),(139, ' Colegio de Bachilleres Victor Rosales', ' 32ECB0033A', 2, 2422),(140, ' Colegio de Bachilleres', ' 32ECB0034Z', 2, 2426),(141, ' Colegio de Bachilleres', ' 32ECB0035Z', 2, 2436),(142, ' Colegio de Bachilleres Roberto Cabral del Hoyo', ' 32ECB0036Y', 2, 2461),(143, ' Colegio de Bachilleres', ' 32ECB0037X', 2, 2456),(144, ' Colegio de Bachilleres Plantel EL Fuerte', ' 32ECB0038W', 2, 2444),(145, ' Colegio de Bachilleres Plantel Trancoso', ' 32ECB0039V', 2, 2462),(146, ' Colegio de Bachilleres Plantel Chaparrosa', ' 32ECB0040K', 2, 2456),(147, ' Colegio de Bachilleres Plantel Los Campos', ' 32ECB0041J', 2, 2457),(148, ' Preparatoria Núm. 1', ' 32UBH0001V', 2, 2461),(149, ' Preparatoria Núm. 1', ' 32UBH0001V', 2, 2461),(150, ' Preparatoria Núm. 2', ' 32UBH0002U', 2, 2461),(151, ' Preparatoria Núm. 2', ' 32UBH0002U', 2, 2461),(152, ' Preparatoria Núm. 3', ' 32UBH0003T', 2, 2415),(153, ' Preparatoria Núm. 3', ' 32UBH0003T', 2, 2415),(154, ' Preparatoria Núm. 4', ' 32UBH0004S', 2, 2461),(155, ' Preparatoria Núm. 4', ' 32UBH0004S', 2, 2461),(156, ' Preparatoria Núm. 5', ' 32UBH0005R', 2, 2425),(157, ' Preparatoria Núm. 6', ' 32UBH0006Q', 2, 2462),(158, ' Preparatoria Núm. 7', ' 32UBH0007P', 2, 2453),(159, ' Preparatoria Núm. 8', ' 32UBH0008O', 2, 2456),(160, ' Preparatoria Núm. 9', ' 32UBH0009N', 2, 2419),(161, ' Preparatoria Núm. 10', ' 32UBH0010C', 2, 2439),(162, ' Preparatoria Núm. 10', ' 32UBH0010C', 2, 2439),(163, ' Preparatoria Núm. 11', ' 32UBH0011B', 2, 2422),(164, ' Preparatoria Núm. 12', ' 32UBH0012A', 2, 2422),(165, ' Preparatoria Núm. 13', ' 32UBH0013Z', 2, 2454),(166, ' Preparatoria Núm. 13', ' 32UBH0013Z', 2, 2454),(167, ' Colegio de Estudios Científicos y Tecnológicos del Estado Plantel  Victor Rosales', ' 32ETC0001Y', 1, 2410),(168, ' Colegio de Estudios Científicos y Tecnológicos del Estado  Plantel Tlaltenango', ' 32ETC0002X', 1, 2453),(169, ' Colegio de Estudios Científicos y Tecnológicos del Estado  Plantel Río Grande', ' 32ETC0003W', 1, 2444),(170, ' Cecyte Plantel San José de Lourdes', ' 32ETC0004V', 1, 2415),(171, ' Colegio de Estudios Científicos y Tecnológicos del Edo.', ' 32ETC0005U', 1, 2443),(172, ' Colegio de Estudios Científicos y Tecnológicos del Estado', ' 32ETC0006T', 1, 2415),(173, ' Centro de Estudios Científicos y Tecnológicos del Estado', ' 32ETC0007S', 1, 2415),(174, ' Colegio de Estudios Científicos y Tecnológicos del Estado', ' 32ETC0009Q', 1, 2425),(175, ' Centro de Estudios Tecnológicos Industriales y de Servicios Num.147', ' 32DCT0001Z', 1, 2424),(176, ' Centro de Bachillerato Tecnológicos Industrial y de Servicios Núm. 23', ' 32DCT0085X', 1, 2461),(177, ' Centro de Bachillerato Tecnológicos Industrial y de Servicios Núm. 1', ' 32DCT0138L', 1, 2415),(178, ' Centro de Bachillerato Tecnológicos Industrial y de Servicios Núm. 1', ' 32DCT0138L', 1, 2415),(179, ' Centro de Bachillerato Tecnológicos Industrial y de Servicios Núm. 104', ' 32DCT0348Q', 1, 2447),(180, ' Centro de Bachillerato Tecnológicos Industrial y de Servicios Núm. 141', ' 32DCT0349P', 1, 2427),(181, ' Centro de Bachillerato Tecnológicos Industrial y de Servicios Núm. 215', ' 32DCT0350E', 1, 2429),(182, ' Centro de Bachillerato Tecnológicos Industrial y de Servicios Núm. 221', ' 32DCT0351D', 1, 2412),(183, ' Centro de Estudios Tecnológicos Industriales y de Servicios Núm. 113', ' 32DCT0352C', 1, 2422),(184, ' Centro de Estudios Tecnológicos Industrales y de Servicios Núm. 114', ' 32DCT0353B', 1, 2425),(185, ' Centro de Bachillerato Tecnológico Agropecuario Núm. 166', ' 32DTA0001A', 1, 2438),(186, ' Centro de Bachillerato Tecnológico Agropecuario Núm. 137', ' 32DTA0002Z', 1, 2450),(187, ' Centro de Bachillerato Tecnológico Agropecuario Núm. 167', ' 32DTA0003Z', 1, 2454),(188, ' Centro de Bachillerato Tecnológico Agropecuario Núm. 138', ' 32DTA0004Y', 1, 2459),(189, ' Centro de Bachillerato Tecnológico Agropecuario Núm. 188', ' 32DTA0005X', 1, 2460),(190, ' Centro de Bachillerato Tecnológico Agropecuario Núm. 189', ' 32DTA0006W', 1, 2419),(191, ' Centro de Bachillerato Tecnológico Agropecuario Núm. 20', ' 32DTA0020P', 1, 2444),(192, ' Centro de Bachillerato Tecnológico Agropecuario Núm. 88', ' 32DTA0088W', 1, 2441),(193, ' Centro de Bachillerato Tecnológico Agropecuario Num.285', ' 32DTA0285X', 1, 2458),(194, ' Centro de Bachillerato Tecnológico Agropecuario Num.286', ' 32DTA0286W', 1, 2428),(195, ' Centro de Estudios Científicos y Tecnológicos del Estado', ' 32ETC0008R', 1, 2415),(196, ' Centro de Estudios Científicos y Tecnológicos del Estado', ' 32ETC0008R', 1, 2415),(197, ' Instituto Universitario Metropolitano', ' 32PET0001B', 3, 2461),(198, ' Escuela de Enfermería  Beatriz González Ortega', ' 32EET0003U', 3, 2415),(199, ' Colegio de Educación Profesional Técnica del Estado de Zacatecas', ' 32DPT0001C', 4, 2422),(200, ' Colegio de Educación Profesional Técnica del Estado de Zacatecas', ' 32DPT0002B', 4, 2415),(201, ' Colegio de Educación Profesional Técnica del Estado de Zacatecas', ' 32DPT0003A', 4, 2431),(202, ' Centro de Estudios Científicos y Tecnológicos 18 “Zacatecas”', ' 32DPN0001S', 1, 2461),(203, 'COBAEE', 'Desconocida', 2, 2418),(204, 'CECYT 18', 'Desconocida', 6, 2461),(205, '', 'Desconocida', 6, 2418),(206, '', 'Desconocida', 6, 2418),(207, '', 'Desconocida', 6, 2418),(208, '', 'Desconocida', 6, 2418),(209, '', 'Desconocida', 6, 2418),(210, 'CECyT 18', 'Desconocida', 2, 2461),(211, 'Salvador Varela Resendiz', 'Desconocida', 5, 2418),(212, 'INSTITUTO UNIVERSITARIO DEL CENTRO DE MÉXICO', 'Desconocida', 2, 2461),(213, 'Colegio de bachilleres plantel villa de cos', 'Desconocida', 2, 2456),(214, 'Colegio de Bachilleres del estado de Zacatecas plantel 07 ojocali', 'Desconocida', 2, 2441),(215, 'Instituto Politécnico Nacional', 'Desconocida', 2, 2461),(216, 'CECyTEZ Tlaltenango', 'Desconocida', 3, 2453),(217, 'Universidad autónoma de zacatecas preparatoria #4', 'Desconocida', 1, 2461),(218, 'Universidad Autónoma de Zacatecas Plantel IV', 'Desconocida', 5, 2418),(219, 'Instituto Miguel Agustín Pro', 'Desconocida', 5, 2461),(220, 'Unidad Académica Preparatoria Programa IV', 'Desconocida', 2, 2461),(221, 'Universidad Autonoma de Zacatecas Unidad Academica Preparatora 4', 'Desconocida', 2, 2414),(222, 'emsad ramon lopez velarde', 'Desconocida', 2, 2410),(223, 'EMSaD Ramon López Velarde', 'Desconocida', 2, 2410),(224, 'Educación Media Superior a Distancia “Ramon Lopez Velarde“', 'Desconocida', 2, 2410),(225, 'EMSaD El Rucio', 'Desconocida', 2, 2456),(226, 'EMSaD El Rucio', 'Desconocida', 2, 2456),(227, 'EMSaD CECYTEZ EL RUCIO VILLA DE COS ZACATECAS', 'Desconocida', 2, 2456),(228, 'Escuela preparatoria estatal “ Victor Rosales “', 'Desconocida', 6, 2410),(229, 'Preparatoria Estatal Víctor Rosales', 'Desconocida', 2, 2410),(230, 'Preparatoria #1 UAZ', 'Desconocida', 2, 2461),(231, 'Universidad Autónoma de Zacatecas Programa 1', 'Desconocida', 5, 2461),(232, 'Roberto Cabral del Hoyo Cobaez', 'Desconocida', 2, 2461),(233, 'univeraidas autonoma de zacatecas programa lV', 'Desconocida', 5, 2461),(234, 'Cbta 138', 'Desconocida', 1, 2459),(235, 'Cbta 138', 'Desconocida', 1, 2459),(236, 'Cbta 138', 'Desconocida', 1, 2459),(237, 'Cbta 138', 'Desconocida', 1, 2459),(238, 'Universidad Autónoma de Zacatecas programa IV', 'Desconocida', 5, 2461),(239, 'Colegio de bachilleres del estado de Zacatecas', 'Desconocida', 2, 2454),(240, 'Liceo E.S.L. Guadalupe', 'Desconocida', 2, 2461);");

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


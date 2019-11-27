import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyect/models/Base.dart';
import 'package:proyect/models/Aspirante.dart';

class registroAspirante extends StatefulWidget{
   Base base;
 	 registroAspirante(Base base) {this.base = base;}
  @override
  State<StatefulWidget> createState() => new RegistroState();
}

class RegistroState extends State<registroAspirante>{
  Base base;
  final apellidodos =TextEditingController();
  final apellidouno =TextEditingController();
  final correo =TextEditingController();
  final edad =TextEditingController();
  final nombre =TextEditingController();
  final sexo =TextEditingController();
  final telefono =TextEditingController();
  List<String> esc =["Preparatoria Independencia de Río Grande","Juana de Arco","Colegio del Centro","Escuela Prep Instituto Zacatecas","Instituto Tecnológico y de Estudios Superiores de Monterrey Campus Zacatecas","Preparatoria UAF","Preparatoria Vetagrande","Instituto Pedagógico J. Peaget","Instituto Educativo de Zacatecas","Colegio Federico Froebel","Centro Escolar Lancaster de Zacatecas","Universidad Autónoma de Durango Campus Zacatecas","Lic. José Minero Roque","Preparatoria Comercial Sor Juana Inés de La Cruz","Academia Comercial Remington","Preparatoria San Matías","Instituto Maxwell","Colegio Juan Pablo Ii","Colegio Daniel Márquez Medina A.C.","Colegio Santa Elena","Instituto de Formación Integral de Zacatecas","Escuela Preparatoria Particular Ramón  López Velarde","Instituto Ausubel","Instituto Educativo Nochistlan","Liceo E.S.L. Guadalupe","Liceo Universitario Guadalupe","Instituto del Carmen de Guadalupe","Instituto de Educación MONREAL Sandoval","CONSEJO Educativo de Zacatecas","Colegio Juan Pablo Ii El Grande","Superior Teaching Preparatoria","Bachillerato General Sierra Madre","Instituto Educativo de Calera","Instituto Asis de Guadalupe","Colegio Río Grande","Instituto Edison Ac","Cultura  Educación de Fresnillo Asociación Civil","Centro de Servicios de Educación Media Superior A Distancia"," El Cazadero","Educación Media Superior A Distancia","Profr. José Santos Valdez","Lic. Mauricio Magdaleno","José G Montes","Profa. Ma de La O Marín Mota","Francisco García Salinas","Escuela Preparatoria José Rodríguez Elías","Valentín Gómez Farías","Prof. Salvador Vidal G","González Ortega","Ing.  Gral. Felipe B. Berriozabal","Gral Lazaro Cardenas","Victor Rosales","Preparatoria Villanueva","Candelario Huizar","Panfilo Natera","Lazaro Cardenas del Río","José Vasconcelos","Beatriz Márquez Acosta","Ramón  López Velarde","Adolfo López Mateos","Jaime Torres Bodet","Tayahua","Genaro Codina","Lic. Agustín Yañez","Felix U Gómez","Francisco Goitia","Jesús Reyes Heroles","Daniel Camarena","Genaro Codina","Eulalio Gutiérrez","Salvador Varela Resendiz","Colegio de Bachilleres ZACATECAS","Colegio de Bachilleres","Colegio de Bachilleres Ojocaliente","Colegio de Bachilleres Ojocaliente","Colegio de Bachilleres Sain Alto","Colegio de Bachilleres Plantel Cañitas de Felipe Pescador","Luis de La Rosa Oteiza","Colegio de Bachilleres Plantel Sombrerete","Colegio de Bachilleres Victor Rosales","Colegio de Bachilleres Roberto Cabral del Hoyo","Colegio de Bachilleres Plantel EL Fuerte","Colegio de Bachilleres Plantel Trancoso"," Colegio de Bachilleres Plantel Chaparrosa","Colegio de Bachilleres Plantel Los Campos","Preparatoria Núm. 1","Preparatoria Núm. 2","Preparatoria Núm. 3","Preparatoria Núm. 4","Preparatoria Núm. 5","Preparatoria Núm. 6","Preparatoria Núm. 7","Preparatoria Núm. 8","Preparatoria Núm. 9","Preparatoria Núm. 10","Preparatoria Núm. 11","Preparatoria Núm. 12","Preparatoria Núm. 13","Colegio de Estudios Científicos y Tecnológicos del Estado Plantel  Victor Rosales","Colegio de Estudios Científicos y Tecnológicos del Estado  Plantel Tlaltenango","Colegio de Estudios Científicos y Tecnológicos del Estado  Plantel Río Grande","Cecyte Plantel San José de Lourdes","Colegio de Estudios Científicos y Tecnológicos del Edo.","Centro de Estudios Tecnológicos Industriales y de Servicios Num.147","Centro de Estudios Tecnológicos Industriales y de Servicios Num.23","Centro de Estudios Tecnológicos Industriales y de Servicios Num.1","Centro de Estudios Tecnológicos Industriales y de Servicios Num.104","Centro de Estudios Tecnológicos Industriales y de Servicios Num.141","Centro de Estudios Tecnológicos Industriales y de Servicios Num.215","Centro de Estudios Tecnológicos Industriales y de Servicios Num.221","Centro de Estudios Tecnológicos Industriales y de Servicios Num.113","Centro de Estudios Tecnológicos Industriales y de Servicios Num.114","Centro de Bachillerato Tecnológico Agropecuario Núm. 166","Centro de Bachillerato Tecnológico Agropecuario Núm. 137","Centro de Bachillerato Tecnológico Agropecuario Núm. 167","Centro de Bachillerato Tecnológico Agropecuario Núm. 138","Centro de Bachillerato Tecnológico Agropecuario Núm. 188","Centro de Bachillerato Tecnológico Agropecuario Núm. 189","Centro de Bachillerato Tecnológico Agropecuario Núm. 20","Centro de Bachillerato Tecnológico Agropecuario Núm. 88","Centro de Bachillerato Tecnológico Agropecuario Núm. 285","Centro de Bachillerato Tecnológico Agropecuario Núm. 286","Instituto Universitario Metropolitano","Escuela de Enfermería  Beatriz González Ortega","Colegio de Educación Profesional Técnica del Estado de Zacatecas","Centro de Estudios Científicos y Tecnológicos 18 “Zacatecas”","COBAEE","Salvador Varela Resendiz","INSTITUTO UNIVERSITARIO DEL CENTRO DE MÉXICO","Colegio de bachilleres plantel villa de cos","Instituto Politécnico Nacional","CECyTEZ Tlaltenango","Universidad autónoma de zacatecas preparatoria #4","Universidad Autónoma de Zacatecas Plantel IV","Instituto Miguel Agustín Pro","Unidad Académica Preparatoria Programa IV","Universidad Autonoma de Zacatecas Unidad Academica Preparatora 4","Educación Media Superior a Distancia 'Ramon Lopez Velarde'","EMSaD CECYTEZ EL RUCIO VILLA DE COS ZACATECAS","Preparatoria Estatal Víctor Rosales","Preparatoria #1 UAZ","Universidad Autónoma de Zacatecas Programa 1","Roberto Cabral del Hoyo Cobaez","Cbta 138","Universidad Autónoma de Zacatecas programa IV"];
  var pn, pa, sa,age,phone, email,proce,procedencia ,s, o,oo,ooo,unoopc,dosopc,tresopc,sex;
   
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
        key: scaffoldKey,
      appBar: new AppBar(
        title: Text('Registrar aspirante'),
        actions: <Widget>[
        ],
      ),   
        body: SingleChildScrollView (
         child: new Padding(
        padding: const EdgeInsets.all(16),
        child: new Form(
          key: formKey,
          child: new Container(child: Column(children: <Widget>[
            SizedBox(height: 10.0),
            TextFormField(
              controller: nombre,
              keyboardType: TextInputType.text,             
              decoration: new InputDecoration(
                 enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
                labelText: "Primer nombre",
                hintText: 'Ingresar nombre',
                prefixIcon: Icon(Icons.person),
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],
              ),
              validator: (val)=> val.length == 0 ? "Ingresa tu primer nombre":null,
              onChanged: (str){
								 	this.pn= str;
                   print(str);
								 },
            ),
            SizedBox(height: 15.0),
            TextFormField(              
              controller: apellidouno,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Primer apellido", prefixIcon: Icon(Icons.person),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,               
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu primer apellido":null,
              onChanged: (str){
								 	this.pa= str;
								 },
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: apellidodos,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Segundo apellido", prefixIcon: Icon(Icons.person),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu segundo apellido":null,
              onChanged: (str){
								 	this.sa= str;
								 },
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: edad,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: "Edad",prefixIcon: Icon(Icons.calendar_today),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu edad":null,
              onChanged: (str){
								 	this.age= str;
								 },
            ),
            SizedBox(height: 15.0),
           DropdownButtonFormField(
                decoration: new InputDecoration(
                   enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
                  prefixIcon: Icon(Icons.wc),
                labelText: "Sexo",              
                contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],
              ),
                  value: s,
                  items:  ["Masculino","Femenino","Otr@"].map((label)=> DropdownMenuItem(
              child: Text(label.toString()),
              value: label)).toList(),
                 onChanged: (value){
                    setState(() {
                this.s = value;
                this.sex=value;
              });
                  },
            ),
             SizedBox(height: 15.0),
            TextFormField(
              controller: correo,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(labelText: "Correo", prefixIcon: Icon(Icons.email),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu correo":null,
              onChanged: (str){
								 	this.email= str;
								 },
            ),
             SizedBox(height: 15.0),
            TextFormField(
              controller: telefono,             
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(labelText: "Telefono", prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
                filled: true,
                fillColor: Colors.grey[70],),
              validator: (val)=> val.length == 0 ? "Ingresa tu telefono":null,
              onChanged: (str){
								 	this.phone= str;       
								 },              
            ),
            SizedBox(height: 15.0),
             DropdownButtonFormField<String>(
                decoration: new InputDecoration(labelText: "Preparatoria de procedencia", prefixIcon: Icon(Icons.school),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                
                 enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
                filled: true,
                fillColor: Colors.grey[70],),       
                  value: proce,
                  
                  items: esc.map((label)=> DropdownMenuItem(      
              child: new SizedBox(
                        width: 200.0,
                        child: Text(label.toString(),overflow: TextOverflow.ellipsis,),
                      ),
              value: label)).toList(),
                 onChanged: (value){
                    setState(() {
                this.proce = value;
                this.procedencia=value;
              });
            },
            ),  
             SizedBox(height: 15.0),  
             DropdownButtonFormField<String>(
                decoration: new InputDecoration(labelText: "Primera opción", prefixIcon: Icon(Icons.bookmark_border),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                 enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
                filled: true,
                fillColor: Colors.grey[70],),       
                  value: o,
                items:  ["Sistemas computacionales","Ambiental","Mecatrónica","Alimentos","Metalúrgica"].map((label)=> DropdownMenuItem(
              child: Text(label.toString()),
              value: label)).toList(),
                onChanged: (value){
                    setState(() {
                this.unoopc = value;
                this.o=value;
              });
                  },
            ),        
             SizedBox(height: 15.0),
            DropdownButtonFormField<String>(
                decoration: new InputDecoration(labelText: "Segunda opción", prefixIcon: Icon(Icons.bookmark_border),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                 enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
                filled: true,
                fillColor: Colors.grey[70],),       
                value: oo,
                items: ["Sistemas computacionales","Ambiental","Mecatrónica","Alimentos","Metalúrgica"].map((label)=> DropdownMenuItem(
              child: Text(label.toString()),
              value: label)).toList(),
                onChanged: (value){
                    setState(() {
                this.dosopc = value;
                this.oo=value;
              });
                  },
            ),
             SizedBox(height: 15.0),
            DropdownButtonFormField<String>(
              decoration: new InputDecoration(labelText: "Tercera opción", prefixIcon: Icon(Icons.bookmark_border),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64),), ),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(450, 107, 23, 64))),
              filled: true,
              fillColor: Colors.grey[70],),
              value: ooo,
              items:  ["Sistemas computacionales","Ambiental","Mecatrónica","Alimentos","Metalúrgica"].map((label)=> DropdownMenuItem(
              child: Text(label.toString()),
              value: label)).toList(),
             onChanged: (value){
                    setState(() {
                this.tresopc = value;
                this.ooo=value;
              });
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
             onPressed: submitAspirante,
            child: Text('Agregar aspirante',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                ),
          ),
        ),
          ]),
        ),
        )
      ),
    ),
    );
  }

   void submitAspirante()async{
     String mensaje="";
     DateTime now = new DateTime.now();
     DateTime date = new DateTime(now.year, now.month, now.day);
     String fech=date.day.toString()+"-"+date.month.toString()+"-"+date.year.toString();
    var ed= int.parse(age);

     if(nombre.text.length >2 && apellidouno.text.length>2 
     && edad.text.length > 0 && telefono.text.length==10 
     && correo.text.length>1){
       if( ed >10 && ed<50){
       if(o!=oo && ooo!=o && ooo!=oo){
          Aspirante asp =new Aspirante();
          var base = new Base();
          asp.nombre=pn;
          asp.aPaterno=pa;
          asp.aMaterno=sa;
          asp.edad=age;
          asp.sexo=sex;
          asp.correo=email;
          asp.telefono=phone;
          asp.procedencia=procedencia;
          asp.primerO=unoopc;
          asp.segundaO=dosopc;
          asp.tercerO=tresopc;
          asp.fecha=fech;
          print(fech);
          int a = await base.addAspirante(asp);
          mensaje="Aspirante agregado";
          setState(() {
            apellidodos.clear();
            apellidouno.clear();
            correo.clear();
            edad.clear();
            nombre.clear();
            sexo.clear();
            telefono.clear();
            
          });
       }   else{
         mensaje="Revisa tus opciones de carrera";
       }
       }else{
         mensaje="Ingresa una edad válida";
       }

     }else{
       mensaje="Faltan datos, revisa tu información";
     }
    Fluttertoast.showToast(
      msg: mensaje
    );
    
}


}
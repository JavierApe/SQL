-- drop schema if exists universidad;
create schema if not exists universidad2; 
use Universidad2;
-- drop table carreras;
-- tabla de auditoria de becas
create table if not exists beca_audit
(
id_beca int primary key not null,
apellido varchar (60),
fecha datetime,
accion varchar (30)
);

-- tabla de auditoria de estudiantes
Create Table auditoria_estudiantes (
id_est int not null auto_increment Primary Key,
nombre varchar(60),
apellido varchar (60), 
id_carrera int, 
dni int,
fecha_accion datetime,
action varchar(30)
 );

-- tabla de auditoria de Modulos, cuando se realiza un update
Create Table auditoria_modulos (
id_modulo int Primary Key,
id_profesor int,
descripcion varchar (60), 
fecha_accion datetime,
action varchar(20)
 );


create table if not exists ciudad -- tabla ciudad donde se relacionan las ciudades con los modulos donde se dictan
(
id_ciudad int auto_increment primary key not null,
nombre varchar(40)
);

-- drop table sede;
create table if not exists sede
(
id_sede int auto_increment primary key not null,
nombre varchar(40),
ciudad varchar(40),
direccion varchar(40),
telefono int,
email varchar(40),
id_ciudad int not null,
foreign key (id_ciudad) references ciudad (id_ciudad)
);
-- drop table universidad.carreras;

create table if not exists universidad2.carreras
(
id_carrera int auto_increment primary key not null,
id_sede int not null,
foreign key (id_sede) references sede (id_sede),
descripcion varchar(60),
duracion varchar(20),
precio float,
titulo varchar(60)
);

create table if not exists profesores
(
id_profesor int auto_increment primary key not null,
id_carrera int not null,
foreign key (id_carrera) references carreras (id_carrera),
nombre varchar(60),
apellido varchar(60),
telefono int,
email varchar(60),
id_sede int not null,
foreign key (id_sede) references sede (id_sede)
);

create table if not exists aula
(
id_aula int auto_increment primary key not null,
id_sede int not null,
foreign key(id_sede) references sede (id_sede),
descripcion varchar(40)
);

-- drop table estudiantes;
create table if not exists estudiantes
(
id_estudiante int auto_increment primary key not null,
nombre varchar(50),
apellido varchar(50),
telefono int,
email varchar(60),
dni int not null,
id_carrera int not null,
foreign key (id_carrera) references carreras (id_carrera)
);

create table if not exists modulos
(
id_modulo int auto_increment primary key not null,
id_profesor int,
foreign key (id_profesor) references profesores (id_profesor),
descripcion varchar(40),
duracion varchar (40)
);

-- drop table becas;

create table if not exists becas
(
id_beca int auto_increment primary key not null,
id_estudiante int,
foreign key (id_estudiante) references estudiantes (id_estudiante),
tipo_beca varchar(20),
duracion varchar (20),
adjudicado varchar(30),
estado varchar(20) -- activa o inactiva
);
 
 -- realizo la carga de datos 
 
 use universidad2;
-- delete from ciudad;
INSERT INTO ciudad (id_ciudad, nombre) 
VALUES  (1,"Minas Tirith"),
(2,"Moria"),
(3,"Rivendel"),
(4,"Edoras"),
(5,"Minas Morgul"),
(6,"Bree"),
(7,"Isengard"),
(8,"Dol Guldur"),
(9,"Osgiliath"),
(10,"Barad-dûr"),
(11,"Lothlórien"),
(12,"Caras Galadhon"),
(13,"Thranduil's Halls"),
(14,"Erebor"),
(15,"Dale"),
(16,"Rhun"),
(17,"Harad"),
(18,"Dunharrow"),
(19,"Entwash Vale"),
(20,"Mirkwood"),
(21,"Beorn's House"),
(22,"Gondolin"),
(23,"Nargothrond"),
(24,"Menegroth"),
(25,"Esgaroth"),
(26,"Fornost"),
(27,"Angband"),
(28,"Nogrod"),
(29,"Gundabad"),
(30,"Elostirion"),
(31,"Forlond"),
(32,"Harlindon"),
(33,"Himling"),
(34,"Lond Daer"),
(35,"Mount Gram"),
(36,"Ost-in-Edhil"),
(37,"Sarn Ford"),
(38,"Tarnost"),
(39,"Tharbad"),
(40,"Umbar"),
(41,"Varrock"),
(42,"Weather Top"),
(43,"Beleriand"),
(44,"Emyn Arnen)"),
(45,"Evendim"),
(46,"Fangorn"),
(47,"Forodwaith"),
(48,"Gladden Fields"),
(49,"Isle of Meneltarma"),
(50,"Numenor");
		
select * from ciudad;

delete from sede;
select * from sede;
INSERT INTO sede (id_sede, nombre, ciudad, direccion, telefono, email, id_ciudad) 
VALUES (1,"Norte1", "Buenos Aires", "Avenida Corrientes", 1112345678,"sede_a_@unisql.com", 1),
(2,"Norte3", "Rosario", "Calle Córdoba", 1119876543, "sede_a_@unisql.com", 2),
(3,"Sur", "Mendoza", "Calle San Martín", 116554321, "sede_a_@unisql.com", 3),
(4,"Sur1", "Córdoba", "Avenida Caceres", 11134444, "sede_a_@unisql.com", 4),
(5,"Sur2","Salta", "Calle Alvarado", 118221111, "sede_a_@unisql.com", 5),
(6, "Centro", "Buenos Aires", "Calle Florida", 11874321, "sede_a_@unisql.com", 6),
(7, "Centro1", "Rosario", "Calle San Luis", 114152222, "sede_a_@unisql.com", 7),
(8, "Centro2", "Mendoza", "Calle Belgrano", 116143333, "sede_a_@unisql.com", 8),
(9, "Centro3","Córdoba", "Calle Laprida", 115178888, "sede_a_@unisql.com", 9),
(10, "Este1", "Salta", "Avenida Sarmiento", 118799900, "sede_a_@unisql.com", 10),
(11, "Este2", "Buenos Aires", "Calle Lavalle", 111367890, "sede_a_@unisql.com", 11),
(12, "Este3", "Rosario", "Calle Mitre", 114223333, "sede_a_@unisql.com", 12),
(13, "Sur3", "Mendoza", "Avenida San Martín",116188777, "sede_a_@unisql.com", 13),
(14, "Oeste1", "Córdoba", "Calle Maipú", 115166555, "sede_a_@unisql.com", 14),
(15, "Oeste2", "Salta", "Calle Belgrano", 118732222, "sede_a_@unisql.com", 15),
(16, "Oeste3", "Buenos Aires", "Avenida de Mayo", 111223333, "sede_a_@unisql.com", 16),
(17, "Oeste4", "Rosario", "Calle 9 de Julio", 114144555,"sede_a_@unisql.com", 17),
(18, "Este4", "Mendoza", "Calle Arístides", 116112222, "sede_a_@unisql.com", 18),
(19, "Centro", "Córdoba", "Avenida Colon", 115188999, "sede_a_@unisql.com", 19),
(20, "Centro1", "Buenos Aires", "Calle Corrientes", 11998887, "sede_a_@unisql.com", 20);

select * from sede;

delete from aula;
INSERT INTO aula (id_aula, id_sede, descripcion) 
VALUES (1,1,"Sala 101"),
(2,1,"Aula Magna"),
(3,1,"Sala de Conferencias"),
(4,1,"Aula 102"),
(5,1,"Sala de Seminarios"),
(6,2,"Aula 103"),
(7,2,"Sala de Estudio"),
(8,2,"Aula 104"),
(9,2,"Sala de Prácticas"),
(10,3,"Aula 105"),
(11,3,"Sala de Computación"),
(12,3,"Aula 106"),
(13,4,"Sala de Fisica"),
(14,4,"Aula 107"),
(15,4,"Sala de Videoc"),
(16,4,"Aula 108"),
(17,4,"Aula 109"),
(18,5,"Sala de Ensayos"),
(19,5,"Aula 110"),
(20,5,"Sala de Expos.s"),
(21,5,"Aula 111"),
(22,5,"Sala de Idiomas"),
(23,2,"Aula 112"),
(24,4,"Sala de Debate"),
(25,1,"Aula 113"),
(26,3,"Sala de Psicología"),
(27,4,"Aula 114"),
(28,3,"Sala de Filosofía"),
(29,3,"Aula 115"),
(30,1,"Sala de Ciencias"),
(31,4,"Aula 116"),
(32,4,"Sala de Matemáticas"),
(33,5,"Aula 117"),
(34,2,"Sala de Física"),
(35,5,"Aula 118"),
(36,5,"Sala de Química"),
(37,4,"Aula 119"),
(38,1,"Sala de Biología"),
(39,1,"Aula 120"),
(40,6,"Sala de Historia"),
(41,6,"Aula 121"),
(42,4,"Sala de Ingeniería"),
(43,5,"Aula 122"),
(44,5,"Sala de Arquitectura"),
(45,5,"Aula 123"),
(46,6,"Sala de Derecho"),
(47,6,"Aula 124"),
(48,7,"Sala de Periodismo"),
(49,7,"Aula 125"),
(50,7,"Sala de Paseo");

-- select * from aula;
-- delete from carreras;

INSERT INTO carreras (id_carrera, id_sede, descripcion, duracion, precio, titulo)
VALUES (1, 1,"Ingles avanzado", "3 años", 9500, "profesor de Ingles"),
(2,2, "Programación en Python", "3 año", 3000, "Desarrollador de software"),
(3,3, "Diseño gráfico", "2 años", 3500, "Diseñador gráfico"),
(4,4, "Marketing digital", "3 años", 4000, "Especialista en marketing"),
(5,5, "Finanzas", "4 años", 4500, "Analista financiero"),
(6,6, "Derecho laboral", "5 años", 5000, "Abogado laboralista"),
(7,1, "Contabilidad", "6 años", 5500, "Contador público"),
(8,2, "Gestión de proyectos", "7 años", 6000, "Gerente de proyectos"),
(9,3, "Fotografía", "8 años", 6500, "Fotógrafo profesional"),
(10,4, "Redacción creativa", "4 años", 7000, "Redactor publicitario"),
(11,1, "Arquitectura", "8 años", 7500, "Arquitecto"),
(12,5, "Enseñanza de matemáticas", "11 años", 8000, "Profesor de matemáticas"),
(13,6, "Periodismo", "5 años", 8500, "Periodista"),
(14,4, "Ingeniería civil", "8 años", 9000, "Ingeniero civil"),
(15,1, "Terapia ocupacional", "8 años", 9500, "Terapeuta ocupacional"),
(16,2, "Consultoría empresarial", "5 años", 10000, "Consultor empresarial"),
(17,2, "Ingeniería eléctrica", "6 años", 10500, "Ingeniero eléctrico"),
(18,1, "Medicina", "5 años", 11000, "Médico"),
(19,3, "Psicología clínica", "3 años", 11500, "Psicólogo clínico"),
(20,3, "Ingeniería de software", "7 años", 12000, "Ingeniero de software"),
(21,4, "Enseñanza de lengua", "4 años", 12500, "Profesor de Lenguas"),
(22,1, "Recursos humanos", "4 años", 13000, "Especialista en recursos humanos"),
(23,5, "Diseño web", "5 años", 13500, "Diseñador web"),
(24,6, "Nutrición", "3 años", 14000, "Nutricionista"),
(25,1, "Investigación de mercado", "24 años", 14500, "Investigador de mercado"),
(26,4, "Producción audiovisual", "25 años", 15000, "Productor audiovisual"),
(27,5, "Ingeniería mecánica", "6 años", 100000, "Ingeniero Mecanico");

-- select * from carreras;
-- delete from profesores;

INSERT INTO profesores (id_profesor, id_carrera,nombre, apellido, telefono, email, id_sede)
VALUES (1, 2, "Jose","Gonzalez", 11312522, "joseg@gmail.com" ,2 ),
(2, 3, "María", "Rodríguez", 114567381, "mariarodriguez@hotmail.com",3),
(3, 4, "Carlos", "Sánchez", 116654187, "carlossanchez@gmail.com",1),
(4, 5, "Ana", "López", 118935426, "analopez@yahoo.com",4),
(5, 6, "Juan", "Martínez", 117812459, "juanmartinez@gmail.com",2),
(6, 7, "Sofía", "García", 119254763, "sofiagarcia@hotmail.com",3),
(7, 8, "Pablo", "Hernández", 116423187, "pablohernandez@gmail.com",1),
(8, 9, "Lucía", "Gómez", 117825461, "luciagomez@yahoo.com",4),
(9, 10, "Fernando", "Díaz", 113214589, "fernandodiaz@hotmail.com",2),
(10, 11, "Valentina", "Pérez", 117654312, "valentinaperez@gmail.com",3),
(11, 12, "Mario", "Romero", 118724635, "marioromero@yahoo.com",1),
(12, 13, "Marcela", "Ramírez", 119658324, "marcelaramirez@gmail.com",4),
(13, 14, "Diego", "Santos", 117835462, "diegosantos@hotmail.com",2),
(14, 15, "Camila", "Castro", 113698745, "camilacastro@yahoo.com",3),
(15, 16, "Andrés", "Chávez", 117532146, "andreschavez@gmail.com",1),
(16, 17, "Carolina", "Fuentes", 119865423, "carolinafuentes@hotmail.com",4),
(17, 18, "Pedro", "González", 116421785, "pedrogonzalez@gmail.com",2),
(18, 19, "Mariana", "Silva", 118653214, "marianasilva@yahoo.com",3),
(19, 20, "Gustavo", "Navarro", 117832461, "gustavonavarro@hotmail.com",1),
(20, 21, "Isabel", "Rojas", 114567890, "isabelrojas@gmail.com",4),
(21, 22, "Mauricio", "Ortiz", 119653214, "mauricioortiz@yahoo.com",2),
(22, 23, "Laura", "Herrera", 117845123, "lauraherrera@gmail.com",3),
(23, 24, "Emilio", "Torres", 115698741, "emiliotorres@hotmail.com",1),
(24, 25, "Julieta", "Castillo", 118754132, "julietac@gmail.com",1);

-- select * from profesores;

INSERT INTO modulos (id_modulo, id_profesor, descripcion, duracion)
VALUES (1, 2, "Física", "7 años"),
(2, 3, "Química", "4 años"),
(3, 4, "Biología", "3 años"),
(4, 5, "Historia", "2 años"),
(5, 6, "Literatura", "4 años"),
(6, 7, "Filosofía", "3 años"),
(7, 8, "Inglés", "2 años"),
(8, 9, "Francés", "4 años"),
(9, 10, "Alemán", "3 años"),
(10, 11, "Español", "2 años"),
(11, 12, "Educación Física", "4 años"),
(12, 13, "Arte", "3 años"),
(13, 14, "Música", "2 años"),
(14, 15, "Geografía", "4 años"),
(15, 16, "Informática", "3 años"),
(16, 17, "Programación", "2 años"),
(17, 18, "Estadística", "4 años"),
(18, 19, "Álgebra", "3 años"),
(19, 20, "Cálculo", "2 años"),
(20, 21, "Geometría", "4 años"),
(21, 2, "Trigonometría", "3 años"),
(22, 2, "Probabilidad", "2 años"),
(23, 2, "Economía", "4 años"),
(24, 17, "Finanzas", "3 años"),
(25, 6, "Contabilidad", " años"),
(26, 15, "Marketing", "4 años"),
(27, 16, "Negocios", "3 años"),
(28, 17, "Derecho", "2 años"),
(29, 19, "Psicología", "4 años"),
(30, 20, "Sociología", "3 años"),
(31, 22, "Antropología", "2 años"),
(32, 20, "Medicina", "4 años"),
(33, 9, "Enfermería", "3 años"),
(34, 13, "Odontología", "2 años"),
(35, 12, "Veterinaria", "4 años"),
(36, 6, "Biología Molecular", "3 años"),
(37, 7, "Bioquímica", "6 años"),
(38, 8, "Genética", "7 años"),
(39, 9, "Neurociencia", "9 años"),
(40, 11, "Fisiología", "2 años"),
(41, 17, "Ecología", "4 años"),
(42, 17, "Zoología", "3 años"),
(43, 17, "Botánica", "4 años"),
(44, 10, "Meteorología", "4 años"),
(45, 11, "Oceanografía", "3 años"),
(46, 14, "Geología", "7 años"),
(47, 21, "Astrofísica", "6  años"),
(48, 21, "Bioquimica", "9 años");

-- select * from modulos;
-- delete from estudiantes;

INSERT INTO estudiantes (id_estudiante, nombre, apellido, telefono, email, dni, id_carrera)
VALUES 
(1, "Juan", "García", 113456789, "juan.garcia@gmail.com", 21901234, 11),
(2, "Ana", "Pérez", 117654321, "ana_perez@hotmail.com", 23210987, 11),
(3, "Pedro", "Martínez", 1168101214, "pedromtz@yahoo.com", 36925814, 5),
(4, "Laura", "González", 1116171819, "laura.gonzalez@gmail.com", 20212223, 4),
(5, "Carlos", "Rodríguez", 1125262829, "carlosrodriguez@hotmail.com", 30313233, 2),
(6, "Sofía", "Hernández", 1136373839, "sofiahernandez@gmail.com", 40414243, 1),
(7, "Diego", "López", 1145464748, "diegolopez@yahoo.com", 30515253, 1),
(8, "Isabel", "Ramírez", 1156575859, "isabelramirez@hotmail.com", 20616263, 13),
(9, "Miguel", "Sánchez", 1167686970, "miguelsanchez@gmail.com", 31727374, 3),
(10, "Julia", "Gutiérrez", 1178798081, "juliagutierrez@hotmail.com", 22838485, 4),
(11, "Gabriel", "Fernández", 1189909192, "gabrielfernandez@yahoo.com", 33949596, 24),
(12, "María", "Paz", 100102103, "mariapaz@gmail.com", 304105106, 10),
(13, "Luis", "Santos", 111113114, "luissantos@hotmail.com", 21516117, 25),
(14, "Carla", "Morales", 1111912121, "carlamorales@yahoo.com", 32212324, 15),
(15, "Jorge", "Gómez", 1126127128, "jorgegomez@gmail.com", 32913011, 16),
(16, "Lucía", "Díaz", 1113134135, "luciadiaz@hotmail.com", 236137138, 17),
(17, "Héctor", "Ortiz", 1191401142, "hectorortiz@yahoo.com", 243144145, 26),
(18, "Valentina", "Rojas", 1114714149, "valentinarojas@gmail.com", 250151152, 16),
(19, "Andrés", "Alvarez", 1131415556, "andresalvarez@hotmail.com", 257158159, 17),
(20, "Florencia", "Luna", 1101116163, "florencialuna@yahoo.com", 364165166, 27),
(21, "Raúl", "Acosta", 1171669170, "raulacosta@gmail.com", 32261455,18),
(22, "Juan", "Rodriguez", 116579123, "juanrodriguez@gmail.com", 25632144, 19),
(23, "Sara", "Gomez", 116789310, "saragomez@hotmail.com", 36985214, 23),
(24, "Carlos", "Gonzalez", 117653210, "carlosgonzalez@gmail.com", 36395128, 19),
(25, "Ana", "Perez", 1134567890, "anaperez@gmail.com", 29175384, 24),
(26, "Luis", "Sanchez", 1113691478, "luissanchez@yahoo.com", 28185296, 5),
(27, "Karen", "Martinez", 1116549870, "karenmartinez@hotmail.com", 36987412, 26),
(28, "Pedro", "Ramirez", 1167893214, "pedroramirez@gmail.com", 25896314, 25),
(29, "Monica", "Vargas", 1129637410, "monicavargas@hotmail.com", 31975328, 26),
(30, "David", "Lopez", 1132587410, "davidlopez@gmail.com", 25315928, 3),
(31, "Mariana", "Hernandez", 1131548672, "marianahernandez@yahoo.com", 19678921, 2),
(32, "Jorge", "Garcia", 1138527410, "jorgegarcia@hotmail.com", 32165498, 27),
(33, "Julia", "Fernandez", 1167893210, "juliafernandez@gmail.com", 22765432, 27),
(34, "Ricardo", "Castro", 1134567890, "ricardocastro@yahoo.com", 25896314, 20),
(35, "Isabel", "Gonzalez", 1129637410, "isabelgonzalez@hotmail.com", 36985214, 1),
(36, "Fernando", "Martinez", 1132587410, "fernandomartinez@gmail.com", 20975328, 19),
(37, "Carmen", "Sanchez", 1131594862, "carmensanchez@hotmail.com", 21678921, 18),
(38, "Lorena", "Vega", 1138527410, "lorenavega@yahoo.com", 32165498, 12),
(39, "Roberto", "Diaz", 1167893210, "robertodiaz@gmail.com", 32765432, 11),
(40, "Laura", "Gutierrez", 1134567890, "lauragutierrez@hotmail.com", 25896314, 22),
(41, "Mario", "Perez", 1129637410, "marioperez@gmail.com", 36985214, 10),
(42, "Natalia", "Santos", 1132587410, "nataliasantos@yahoo.com", 21975328, 22),
(43, "Emilio", "Hernandez", 1131594862, "emihernandez@gamil.com", 23321444,27);

-- select * from estudiantes;
-- delete from becas;
INSERT INTO becas (id_beca, id_estudiante,  tipo_beca, duracion, adjudicado, estado) 
VALUES (1,1,"al 30%", "1 año", "fernandez juan",true),
(2,1,"al 40%", "2 años", "Rodríguez Ana",false),
(3,2,"al 20%", "3 años", "García Pedro",true),
(4,3,"al 50%", "4 años", "Sánchez María",false),
(5,1,"al 25%", "2 años", "Gómez Luis",true),
(6,2,"al 30%", "3 años", "Díaz Laura",false),
(7,3,"al 15%", "4 años", "Jiménez Juan",true),
(8,1,"al 45%", "1 año", "Ruiz Ana",false),
(9,2,"al 35%", "2 años", "Pérez Luis",true),
(10,3,"al 10%", "3 años", "Sánchez Ana",false),
(11,1,"al 50%","1 año", "González María",true),
(12,2,"al 30%", "2 años", "Martínez Pedro",false),
(13,3,"al 15%","3 años", "López Laura",true),
(14,1,"al 40%", "1 año", "Ramírez Juan",false),
(15,2,"al 20%", "2 años", "Torres Ana",true),
(16,3,"al 50%","4 años", "Santos Luis",false),
(17,1,"al 35%", "1 año", "Hernández Ana",true),
(18,2,"al 25%", "2 años", "Fernández Juan",false),
(19,3,"al 5%", "3 años", "Gómez María",true),
(20,1,"al 20%", "1 año", "Pérez Pedro",false),
(21,2,"al 50%", "2 años", "Rodríguez Laura",true),
(22,3,"al 30%","3 años", "García Juan",false),
(23,1,"al 10%", "1 año", "Gómez Ana",true),
(24,2,"al 45%", "2 años", "Díaz Luis",false),
(25,3,"al 20%", "4 años", "Jiménez Ana",true),
(26,1,"al 40%", "1 año", "Ruiz Juan",false),
(27,2,"al 5%", "2 años", "Pérez Ramiro", true),
(28,1,"al 10%", "1 año", "Gómez Jimena", false),
(29,3,"al 15%", "3 años", "Sánchez Carlos", true),
(30,4,"al 20%", "4 años", "Torres Sofía", false),
(31,2,"al 25%", "2 años", "Pérez Manuel", true),
(32,1,"al 30%", "1 año", "González Carmen", false),
(33,3,"al 35%", "3 años", "Sánchez Pablo", true),
(34,4,"al 40%", "4 años", "Torres Ana María", false),
(35,2,"al 45%", "2 años", "Pérez Laura", true),
(36,1,"al 50%", "1 año", "González Juan", false),
(37,3,"al 5%", "3 años", "Sánchez Ana", true),
(38,4,"al 10%", "4 años", "Torres Luis", false),
(39,2,"al 15%", "2 años", "Pérez María", true),
(40,1,"al 20%", "1 año", "González Pedro", false),
(41,3,"al 25%", "3 años", "Sánchez Laura", true),
(42,4,"al 30%", "4 años", "Torres Juan", false),
(43,2,"al 35%", "2 años", "Pérez Ana", true),
(44,1,"al 40%", "1 año", "González Laura", false),
(45,3,"al 45%", "3 años", "Sánchez Juan", true),
(46,4,"al 50%", "4 años", "Torres Carmen", false),
(47,2,"al 5%", "2 años", "Pérez Luisa", true),
(48,1,"al 10%", "1 año", "González Ana", false),
(49,3,"al 15%", "3 años", "Sánchez Sofía", true),
(50,4,"al 20%", "4 años", "Torres Ramiro", false),
(51,2,"al 25%", "2 años", "Pérez Carlos", true),
(52,1,"al 30%", "1 año", "González Manuel", false),
(53,3,"al 35%", "3 años", "Sánchez Ana María", true),
(54,4,"al 40%", "4 años", "Torres Jimena", false),
(55,2,"al 45%", "2 años", "Pérez Pablo", true),
(56,1,"al 50%", "1 año", "González Carmen", false),
(57,3,"al 5%", "3 años", "Sánchez Luis", true),
(58,4,"al 10%", "4 años", "Torres Laura", false);

-- select * from becas;

-- CREACION DE VISTAS --

use universidad2;
CREATE OR REPLACE VIEW vw_estudiantes AS
	(SELECT  id_estudiante, nombre as Nombre_Estudiante, apellido as Apellido_Estudiante, c.descripcion
	 FROM estudiantes as e JOIN carreras as c ON (e.id_carrera = c.id_carrera)
     WHERE e.id_carrera like (1));
     
select * from vw_estudiantes;

 CREATE OR REPLACE VIEW vw_modulos AS
	(SELECT  m.descripcion, p.apellido, p.nombre
	 FROM modulos as m JOIN profesores as p ON (m.id_profesor = p.id_profesor)
     WHERE m.id_profesor like 2);  
	
select * from vw_modulos;
    
CREATE OR REPLACE VIEW vw_becas AS
select id_beca, estado
from becas;

select * from vw_becas;

CREATE OR REPLACE VIEW vw_profesores AS
	SELECT * 
    FROM profesores ;
    
SELECT * FROM vw_profesores;

CREATE OR REPLACE VIEW vw_sedes AS
	(SELECT  s.nombre as Sede_Nombre, c.nombre as Ciudad_Nombre
	 FROM sede as s  JOIN ciudad as c ON (s.id_ciudad = c.id_ciudad)
     WHERE s.id_ciudad >(5));
     
select * from vw_sedes;

-- CREACION DE FUNCIONES

DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `carreras`(id int) RETURNS varchar(40) -- CHARSET utf8mb4
    READS SQL DATA -- funcion en donde se ingresa un ID y se muestra la carrera que esta cursando
BEGIN
DECLARE carreras varchar (30);
	SET carreras = (select nombre from estudiantes where id_carrera=id);
	RETURN carreras;
END //


DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_pf`(id int) RETURNS varchar(40) CHARSET utf8mb4
    READS SQL DATA -- funcion que muestra el apellido de un profesor dependiendo del id que se ingrese
BEGIN
declare profesor varchar (40);
set profesor = (SELECT apellido from profesores where (id_profesor = id));
RETURN profesor;
END //


DELIMITER  //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_ver_dni`(id int) RETURNS int
    READS SQL DATA -- se muestra el estudiante segun el ID que se ingresa
BEGIN
DECLARE dni1 int;
	SET dni1 = (SELECT dni from estudiantes where (id_estudiante =id));
RETURN dni1;
END //


DELIMITER  //
CREATE DEFINER=`root`@`localhost` FUNCTION `ver_carrera`(id int) RETURNS varchar(40) CHARSET utf8mb4
    READS SQL DATA -- funcion que muestra el nombre de la carrera segun el id que se ingresa
BEGIN
DECLARE nombre varchar (40);
set nombre = (select descripcion from carreras where id_carrera = id);
RETURN nombre;
END //


-- CREACION DE SP --
-- Procedimiento Almacenado para ingresar datos en la tabla estudiantes
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insertar_estudiante`(
    IN id_estudiante INT,
    IN nombre varchar (60),
    IN apellido varchar (60),
    IN telefono INT,
    IN email varchar (60),
    IN dni int,
    IN id_carrera int
    )
BEGIN
    -- controlo que el id_carrara esté entre las carreras que hay disponibles
    IF id_carrera BETWEEN 1 AND 30 THEN
        -- se puede ingresar
        INSERT INTO estudiantes (id_estudiante, Nombre, Apellido, telefono, email, dni, id_carrera)
        VALUES (id_estudiante, Nombre, Apellido, telefono, email, dni, id_carrera);
    ELSE
        -- si se ingresa mal mostrar mensaje de error
        SELECT 'El valor de id_carrera debe estar entre 1 y 30 - gracias';
    END IF;
END //
-- prueba de SP
-- call sp_insertar_estudiante (66, "Pedro", "Almodobar", 1158414432, "pedroalmodobar@gmail.com", 29954668,20);

delimiter //
select * from estudiantes;
end//

   -- Procedimiento Almacenado que pasando argumento ordena la tabla en base a los mismo
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ordenamiento`(
    -- parametros que ingreso 
    IN nombre_t VARCHAR(40), -- > tabla a reordenar
    IN columna_ord VARCHAR(40), -- > columna para ordenar 
    IN tipo_ord VARCHAR(5) -- >   asc o desc
)

BEGIN
     SET @accion = CONCAT('SELECT * FROM ',nombre_t, ' ORDER BY ', columna_ord, ' ', tipo_ord);
    PREPARE stmt FROM @accion;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END //

delimiter //
call sp_ordenamiento ("estudiantes", "apellido", "asc");
end//

-- CREACION DE TRIGGERS

-- cuando se elimina una beca

CREATE TRIGGER tr_baja_beca
BEFORE DELETE on becas
	FOR EACH ROW
		BEGIN
			INSERT INTO beca_audit
						(id_beca, apellido,fecha,accion)
			VALUES      ("old.id_beca", "old.apellido", current_timestamp(),'delete');
		END;
        $$
 -- trigger que se almacena datos luego de una insercion
 
 delimiter //
CREATE TRIGGER tr_ingreso_estudiantes
AFTER INSERT ON estudiantes
	FOR EACH ROW
		BEGIN
			INSERT INTO auditoria_estudiantes (nombre, apellido, id_carrera, dni,fecha_accion,accion)
			VALUES                           (NEW.nombre, NEW.apellido, NEW.id_carrera, NEW.dni, current_timestamp(), 'insert');
		END;
        
        $$

-- cuando se actualiza un modulo

delimiter//
CREATE TRIGGER tr_update_modulo
BEFORE UPDATE on modulos
	FOR EACH ROW
		BEGIN
			INSERT INTO auditoria_modulos
						(id_modulo, id_profesor,descripcion,fecha_Accion, accion)
			VALUES      ("old.id_modulo", "old.id_profesor", "old_descripcion", current_timestamp(),'update');
		END;
        $$

-- TCL -- TCL -- TCL -- TCL --

-- Elige dos tablas de las presentadas en tu proyecto. 
-- Realizarás una serie de modificaciones en los registros, controladas por transacciones 
-- En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. 
-- Si no tiene registros la tabla, reemplaza eliminación por inserción.
-- Deja en una línea siguiente, comentado la sentencia Rollback, y en una línea posterior, la sentencia Commit.
-- Si eliminas registros importantes, deja comenzado las sentencias para re-insertarlos.

-- desactive el Auto Commit (Query ->> Auto-Commit Transactions
use universidad2;
SELECT * FROM becas;
Start transaction;
delete from becas where id_beca=4;
insert into becas (id_beca, id_estudiante,id_carrera,tipo_beca,duracion,adjudicado, estado) values (59,16,2, "al 30%", "1 años", "Javier Dario", 1);
insert into becas (id_beca, id_estudiante,id_carrera,tipo_beca,duracion,adjudicado, estado) values (60,19,2, "al 10%", "2 años", "Jose Maria", 1);
insert into becas (id_beca, id_estudiante,id_carrera,tipo_beca,duracion,adjudicado, estado) values (61,23, "al 30%", "1 años", "ALvaro Diaz", 1);
insert into becas (id_beca, id_estudiante,id_carrera,tipo_beca,duracion,adjudicado, estado) values (62, 32, "al 20%", "1 años", "Juana Ortiz", 1);
insert into becas (id_beca, id_estudiante,id_carrera,tipo_beca,duracion,adjudicado, estado) values (63,36,2, "al 10%", "2 años", "Ana Perez", 0);

-- rollback; -- vuelvo para atras los cambios 
SELECT * FROM becas;-- hago una prueba 
-- commit; -- Confirmo las transacciones

-- TCL 2 -- TCL 2-- TCL --

-- En la segunda tabla, inserta ocho nuevos registros iniciando también una transacción. 
-- Agrega un savepoint a posteriori de la inserción del registro #4 y otro savepoint a posteriori del registro #8
-- Agrega en una línea comentada la sentencia de eliminación del savepoint de los primeros 4 registros insertados.

use Universidad2;
Start transaction;
insert into modulos (id_modulo, id_profesor, descripcion, duracion) values (49, 21, "Matematicas", "3 años");
insert into modulos (id_modulo, id_profesor, descripcion, duracion) values (50, 15, "Fisica Cuantica", "6 años");
insert into modulos (id_modulo, id_profesor, descripcion, duracion) values (51, 6, "Informatica", "3 años");
insert into modulos (id_modulo, id_profesor, descripcion, duracion) values (52, 6, "Redes", "6 años");

-- ingreso el SavePoint N°1
Savepoint SP1;
select * from modulos;
insert into modulos (id_modulo, id_profesor, descripcion, duracion) values (53, 19, "Psicologia Social", "3 años");
insert into modulos (id_modulo, id_profesor, descripcion, duracion) values (54, 21, "Astrofisica", "7 años");
insert into modulos (id_modulo, id_profesor, descripcion, duracion) values (55,20, "Ingenieria Civil", "7 años");
insert into modulos (id_modulo, id_profesor, descripcion, duracion) values (56, 7, "Arquitectura", "7 años");

-- ingreso el SavePoint N°2
Savepoint SP2;
-- select * from modulos;
-- hago el rollback al SavePoint n°1
-- rollback to SP1;

-- select * from modulos;

-- confirmo cambios
-- Commit;


-- CREACION DE USUARIOS 

-- Se deberán crear dos usuarios nuevos a los cuales se le asignará una serie de permisos.
-- Uno de los usuarios creados deberá tener permisos de sólo lectura sobre todas las tablas.
-- El otro usuario deberá tener permisos de Lectura, Inserción y Modificación de datos.
-- Ninguno de ellos podrá eliminar registros de ninguna tabla.
-- Cada sentencia GRANT y CREATE USER deberá estar comentada con lo que realiza la misma.

use universidad2;
-- creo el primer usuario, lo identifico con usuarioA
CREATE USER 'usuarioA'@'localhost' IDENTIFIED BY 'usuarioA';
-- creo el segundo usuario, lo identifico con usuarioB
CREATE USER 'usuarioB'@'localhost' IDENTIFIED BY 'usuarioB';
SELECT user FROM mysql.user WHERE user = 'usuarioA'; -- verifico que se creen los usuarios (aca probe el A)
GRANT Select on *.* to 'usuarioA'@'localhost'; -- otorgo permisos de Lectura (select) al usuarioA
GRANT Select, Insert, update on *.* to 'usuarioB'@'localhost'; -- otorgo permisos de lectura, insercion y modificacion al usuarioB
REVOKE Delete ON *.* FROM 'usuarioA'@'localhost'; -- le quito permisos de DELETE al primer usuarioA
REVOKE Delete ON *.* FROM 'usuarioB'@'localhost'; -- le quito permisos de DELETE al segundo usuarioB
SHOW GRANTS FOR 'usuarioA'@'localhost'; -- verifico permisos del usuarioA (podria hacer lo mismo con el B en caso de necesitar)
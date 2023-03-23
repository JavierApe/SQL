-- drop schema if exists universidad;
create schema if not exists universidad; 
use Universidad;
-- drop table carreras;

-- drop table sede;

create table if not exists ciudad
(
id_ciudad int auto_increment primary key not null,
nombre varchar(20)
);

create table if not exists sede
(
id_sede int auto_increment primary key not null,
nombre varchar(20),
ciudad varchar(20),
direccion varchar(20),
telefono int,
email varchar(20),
id_ciudad int not null,
foreign key (id_ciudad) references ciudad (id_ciudad)
);
-- drop table universidad.carreras;

create table if not exists universidad.carreras
(
id_carrera int auto_increment primary key not null,
id_sede int not null,
foreign key (id_sede) references sede (id_sede),
descripcion varchar(20),
duracion varchar(20),
precio float,
titulo varchar(20)
);

create table if not exists profesores
(
id_profesor int auto_increment primary key not null,
id_carrera int not null,
foreign key (id_carrera) references carreras (id_carrera),
nombre varchar(20),
apellido varchar(20),
telefono int,
email varchar(20),
id_sede int not null,
foreign key (id_sede) references sede (id_sede)
);

create table if not exists aula
(
id_aula int auto_increment primary key not null,
id_sede int not null,
foreign key(id_sede) references sede (id_sede),
numero int,
descripcion varchar(20)
);


-- drop table estudiantes;
create table if not exists estudiantes
(
id_estudiante int auto_increment primary key not null,
nombre varchar(20),
apellido varchar(20),
telefono int,
email varchar(20),
dni int not null,
id_carrera int not null,
foreign key (id_carrera) references carreras (id_carrera)
);

create table if not exists modulos
(
id_modulo int auto_increment primary key not null,
id_profesor int,
foreign key (id_profesor) references profesores (id_profesor),
descripcion varchar(20),
duracion int
);
-- drop table becas;

create table if not exists becas
(
id_beca int auto_increment primary key not null,
id_estudiante int,
foreign key (id_estudiante) references estudiantes (id_estudiante),
id_carrera int,
foreign key (id_carrera) references carreras (id_carrera),
tipo_beca varchar(20),
apellido varchar(20),
duracion int,
adjudicado varchar(20),
estado varchar(20) -- activa o inactiva
);



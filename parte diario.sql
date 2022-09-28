DROP database partediario;
CREATE DATABASE partediario;
USE partediario;


-- DROP TABLE if exists AsistenciaAlumno;
-- DROP TABLE if exists Alumnos;
-- DROP TABLE IF EXISTS Observaciones;
-- DROP TABLE if exists AsistenciaProfesor;
-- DROP TABLE if exists Cursos;
-- DROP TABLE if exists Profesores;
-- DROP TABLE if exists EspacioCurricular;
-- DROP TABLE if exists ParteDiario;
CREATE TABLE Alumnos(
dni int not null,
nombre varchar(255) not null,
apellido varchar(255) not null,
PRIMARY KEY (dni)
);


CREATE TABLE Cursos(
id int auto_increment not null,
año int not null,
curso int not null,
division int not null,
PRIMARY KEY (id)
);

ALTER TABLE Cursos ADD UNIQUE (año, curso, division);


CREATE TABLE Profesores(
dni int not null,
nombre varchar(255) not null,
apellido varchar(255) not null,
PRIMARY KEY (dni)
);


CREATE TABLE EspacioCurricular(
id INT AUTO_INCREMENT NOT NULL,
materia varchar(255) NOT NULL,
curso_key INT NOT NULL,
horas int not null,
dias varchar(255) not null,
FOREIGN KEY (curso_key) REFERENCES Cursos(id),
PRIMARY KEY (id)
);

ALTER TABLE EspacioCurricular ADD UNIQUE (materia, curso_key);

CREATE TABLE Titularidad (
profesor_key int not null,
espacioCurricular_key int not null,
FOREIGN KEY (espacioCurricular_key) REFERENCES EspacioCurricular(id),
FOREIGN KEY (profesor_key) REFERENCES Profesores(dni),
PRIMARY KEY (profesor_key, espacioCurricular_key)
);

CREATE TABLE ParteDiario(
id INT AUTO_INCREMENT NOT NULL,
fecha DATE NOT NULL,
curso INT NOT NULL,
FOREIGN KEY (curso) REFERENCES Cursos(id),
PRIMARY KEY (id)
);
ALTER TABLE ParteDiario ADD UNIQUE (fecha, curso);

CREATE TABLE AsistenciaAlumno (
alumno int not null, 
asistenciaMañana boolean not null,
asistenciaTarde boolean not null,
TardanzaMañana TIME not null,
TardanzaTarde TIME not null,
fecha date not null,
PRIMARY KEY (alumno, fecha),
foreign key (alumno) REFERENCES alumnos (dni)
);


CREATE TABLE AsistenciaProfesor (
fecha date not null,
hora datetime not null, 
espaciocurricular INT NOT NULL,
firma boolean not null,
FOREIGN KEY (fecha) REFERENCES partediario(fecha),
FOREIGN KEY (espaciocurricular) REFERENCES EspacioCurricular(id),
FOREIGN KEY (hora) REFERENCES EspacioCurricular(horas),
PRIMARY KEY (fecha)
);





-- CREATE TABLE Observaciones (
	-- id INT AUTO_INCREMENT NOT NULL,
    -- alumno INT NOT NULL,
    -- fecha DATE NOT NULL,
    -- comunicado VARCHAR(255) NOT NULL,
    -- profesor INT NOT NULL,
    -- espaciocurricular INT NOT NULL,
    -- FOREIGN KEY (alumno) REFERENCES Alumnnos(dni),
    -- FOREIGN KEY (fecha) REFERENCES partediario(id),
    -- FOREIGN KEY (profesor) REFERENCES Profesores(dni),
    -- FOREIGN KEY (espaciocurricular) REFERENCES EspacioCurricular(id)
-- );







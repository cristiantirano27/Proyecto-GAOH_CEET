CREATE DATABASE gaoh_tecnica;
USE gaoh_tecnica;

CREATE TABLE actividad (
  id      int NOT NULL AUTO_INCREMENT, 
  id_fase int NOT NULL, 
  numero  int NOT NULL, 
  nombre  varchar(100) NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (numero));
CREATE TABLE ambiente (
  id          int NOT NULL AUTO_INCREMENT, 
  id_sede     int NOT NULL, 
  numero      varchar(10) NOT NULL, 
  descripcion varchar(45) NOT NULL, 
  estado      boolean NOT NULL, 
  tipo        varchar(45) NOT NULL, 
  limitacion  int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_sede), 
  INDEX (numero));
CREATE TABLE cliente_has_rol (
  id         int NOT NULL AUTO_INCREMENT, 
  id_usuario int NOT NULL, 
  id_rol     int NOT NULL, 
  estado     int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_usuario), 
  INDEX (id_rol));
CREATE TABLE competencia (
  id          int NOT NULL AUTO_INCREMENT, 
  id_programa int NOT NULL, 
  codigo      varchar(100) NOT NULL, 
  descripcion int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (codigo));
CREATE TABLE dia (
  id                       int NOT NULL AUTO_INCREMENT, 
  nombre                   int NOT NULL UNIQUE, 
  estado                   boolean NOT NULL,  
  PRIMARY KEY (id));
CREATE TABLE disponibilidad_competencias (
  id                       int NOT NULL AUTO_INCREMENT, 
  id_resultado_aprendizaje int NOT NULL, 
  id_instructor            int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_resultado_aprendizaje));
CREATE TABLE disponibilidad_horaria (
  id            int NOT NULL AUTO_INCREMENT, 
  anio          int NOT NULL, 
  hora_inicio   date NOT NULL, 
  hora_fin      date NOT NULL, 
  id_jornada    int NOT NULL, 
  id_dia        int NOT NULL, 
  id_instructor int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (anio), 
  INDEX (hora_inicio), 
  INDEX (id_jornada), 
  INDEX (id_dia), 
  INDEX (id_instructor));
CREATE TABLE documento (
  id     int NOT NULL AUTO_INCREMENT, 
  tipo   varchar(10) NOT NULL UNIQUE, 
  nombre varchar(45) NOT NULL, 
  estado boolean NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE especialidad (
  id     int NOT NULL AUTO_INCREMENT, 
  nombre varchar(30) NOT NULL UNIQUE, 
  estado boolean NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE estado_ficha (
  id     int NOT NULL AUTO_INCREMENT, 
  nombre varchar(20) NOT NULL UNIQUE, 
  estado boolean NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE fase (
  id          int NOT NULL AUTO_INCREMENT, 
  id_proyecto int NOT NULL, 
  nombre      varchar(30) NOT NULL, 
  estado      boolean NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (nombre));
CREATE TABLE ficha (
  id              int NOT NULL AUTO_INCREMENT, 
  id_programa     int NOT NULL, 
  numero_ficha    varchar(100) NOT NULL, 
  fecha_inicio    varchar(20) NOT NULL, 
  fecha_fin       varchar(20) NOT NULL, 
  ruta            varchar(50) NOT NULL, 
  id_estado_ficha int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_programa), 
  INDEX (numero_ficha));
CREATE TABLE ficha_has_trimestre (
  id           int NOT NULL AUTO_INCREMENT, 
  id_ficha     int NOT NULL, 
  id_trimestre int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_ficha), 
  INDEX (id_trimestre));
CREATE TABLE horario (
  id                     int NOT NULL AUTO_INCREMENT, 
  hora_inicio            varchar(45) NOT NULL, 
  hora_fin               varchar(45) NOT NULL, 
  id_ficha_has_trimestre int NOT NULL, 
  id_instructor          int NOT NULL, 
  id_ambiente            int NOT NULL, 
  id_dia                 int NOT NULL, 
  id_modalidad           int NOT NULL, 
  id_version             int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (hora_inicio), 
  INDEX (id_ficha_has_trimestre), 
  INDEX (id_instructor), 
  INDEX (id_ambiente), 
  INDEX (id_dia), 
  INDEX (id_modalidad), 
  INDEX (id_version));
CREATE TABLE instructor (
  id             int NOT NULL AUTO_INCREMENT, 
  id_vinculacion int NOT NULL, 
  id_usuario     int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_usuario), 
  INDEX (id_vinculacion));
CREATE TABLE instructor_has_especialidad (
  id              int NOT NULL AUTO_INCREMENT, 
  id_instructor   int NOT NULL, 
  id_especialidad int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_especialidad));
CREATE TABLE jornada (
  id           int NOT NULL AUTO_INCREMENT, 
  sigla        varchar(10) NOT NULL UNIQUE, 
  nombre       varchar(45) NOT NULL UNIQUE, 
  descripcion varchar(100) NOT NULL, 
  imagen       blob NOT NULL, 
  estado       boolean NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE limitacion_ambiente (
  id                       int NOT NULL AUTO_INCREMENT, 
  id_resultado_aprendizaje int NOT NULL, 
  id_ambiente              int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_resultado_aprendizaje));
CREATE TABLE modalidad (
  id     int NOT NULL AUTO_INCREMENT, 
  nombre varchar(100) NOT NULL UNIQUE, 
  estado boolean NOT NULL, 
  color  varchar(45) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE nivel_formacion (
  id              int NOT NULL AUTO_INCREMENT, 
  nivel_formacion varchar(50) NOT NULL UNIQUE, 
  estado          int NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE planeacion (
  id         int NOT NULL AUTO_INCREMENT, 
  planeacion varchar(40) NOT NULL UNIQUE, 
  estado     boolean NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE planeacion_trimestre (
  id                       int NOT NULL AUTO_INCREMENT, 
  id_planeacion            int NOT NULL, 
  id_resultado_aprendizaje int NOT NULL, 
  id_trimestre             int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_planeacion), 
  INDEX (id_trimestre), 
  INDEX (id_resultado_aprendizaje));
CREATE TABLE programa (
  id                 int NOT NULL AUTO_INCREMENT, 
  codigo             varchar(100) NOT NULL, 
  version            varchar(20) NOT NULL, 
  nombre             varchar(100) NOT NULL, 
  sigla              varchar(20) NOT NULL, 
  estado             varchar(20) NOT NULL, 
  id_nivel_formacion int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (Codigo), 
  INDEX (version));
CREATE TABLE proyecto (
  id     int NOT NULL AUTO_INCREMENT, 
  codigo varchar(100) NOT NULL UNIQUE, 
  nombre varchar(100) NOT NULL, 
  estado boolean NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE ra_has_actividad (
  id                      int NOT NULL AUTO_INCREMENT, 
  id_actividad            int NOT NULL, 
  id_planeacion_trimestre int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_actividad), 
  INDEX (id_planeacion_trimestre));
CREATE TABLE resultado_aprendizaje (
  id             int NOT NULL AUTO_INCREMENT, 
  id_competencia int NOT NULL, 
  codigo         varchar(100) NOT NULL, 
  descripcion    varchar(300) NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_competencia), 
  INDEX (codigo));
CREATE TABLE resultado_vistos (
  id                       int NOT NULL AUTO_INCREMENT, 
  id_ficha_has_trimestre   int NOT NULL, 
  id_resultado_aprendizaje int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_ficha_has_trimestre), 
  INDEX (id_resultado_aprendizaje));
CREATE TABLE rol (
  id          int NOT NULL AUTO_INCREMENT, 
  nombre      varchar(10) NOT NULL UNIQUE, 
  descripcion varchar(100) NOT NULL, 
  estado      boolean NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE sede (
  id        int NOT NULL AUTO_INCREMENT, 
  nombre    varchar(100) NOT NULL UNIQUE, 
  direccion varchar(45) NOT NULL, 
  estado    boolean NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE servidor_correo_electronico (
  id           int NOT NULL AUTO_INCREMENT, 
  correo       varchar(100) NOT NULL UNIQUE, 
  contrasenia  varchar(64) NOT NULL, 
  recuperacion varchar(50) NOT NULL, 
  mensaje      varchar(200) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE trimestre (
  id                 int NOT NULL AUTO_INCREMENT, 
  nombre             varchar(20) NOT NULL, 
  id_jornada         int NOT NULL, 
  id_nivel_formacion int NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (nombre), 
  INDEX (id_nivel_formacion), 
  INDEX (id_jornada));
CREATE TABLE trimestre_vigente (
  id               int NOT NULL AUTO_INCREMENT, 
  trimestre_actual varchar(12) NOT NULL, 
  anio             int NOT NULL, 
  fecha_inicio     date NOT NULL, 
  fecha_fin        date NOT NULL, 
  estado           boolean NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (trimestre_actual), 
  INDEX (anio));
CREATE TABLE usuario (
  id               int NOT NULL AUTO_INCREMENT, 
  id_documento     int NOT NULL, 
  numero_documento varchar(15) NOT NULL, 
  pirmer_nombre    varchar(20) NOT NULL, 
  segundo_nombre   varchar(20), 
  primer_apellido  varchar(20) NOT NULL, 
  segundo_apellido varchar(20), 
  foto             blob, 
  correo           varchar(100) NOT NULL UNIQUE, 
  contraseina      varchar(100) NOT NULL, 
  fecha_fin        varchar(20) NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_documento), 
  INDEX (numero_documento));
CREATE TABLE version (
  id                   int NOT NULL AUTO_INCREMENT, 
  id_trimestre_vigente int NOT NULL, 
  numero               int NOT NULL, 
  activa               boolean NOT NULL, 
  PRIMARY KEY (id), 
  INDEX (id_trimestre_vigente), 
  INDEX (numero));
CREATE TABLE vinculacion (
  id     int NOT NULL AUTO_INCREMENT, 
  tipo   varchar(20) NOT NULL UNIQUE, 
  horas  int NOT NULL, 
  estado boolean NOT NULL, 
  PRIMARY KEY (id));
ALTER TABLE limitacion_ambiente ADD CONSTRAINT FKlimitacion_ambiente FOREIGN KEY (id_ambiente) REFERENCES ambiente (id);
ALTER TABLE disponibilidad_competencias ADD CONSTRAINT FKdisponibilidad_competencia FOREIGN KEY (id_instructor) REFERENCES instructor (id);
ALTER TABLE fase ADD CONSTRAINT FKfase FOREIGN KEY (id_proyecto) REFERENCES proyecto (id);
ALTER TABLE actividad ADD CONSTRAINT FKactividad FOREIGN KEY (id_fase) REFERENCES fase (id);
ALTER TABLE horario ADD CONSTRAINT FKhorario FOREIGN KEY (id_instructor) REFERENCES instructor (id);
ALTER TABLE cliente_has_rol ADD CONSTRAINT FKcliente_has_rol FOREIGN KEY (id_rol) REFERENCES rol (id);
ALTER TABLE cliente_has_rol ADD CONSTRAINT FKcliente_has_rol2 FOREIGN KEY (id_usuario) REFERENCES usuario (id);
ALTER TABLE usuario ADD CONSTRAINT FKusuario FOREIGN KEY (id_documento) REFERENCES documento (id);
ALTER TABLE disponibilidad_horaria ADD CONSTRAINT FKdisponibilidad_horario FOREIGN KEY (id_instructor) REFERENCES instructor (id);
ALTER TABLE instructor ADD CONSTRAINT FKinstructor FOREIGN KEY (id_vinculacion) REFERENCES vinculacion (id);
ALTER TABLE instructor_has_especialidad ADD CONSTRAINT FKinstructor_has_especialidad FOREIGN KEY (id_instructor) REFERENCES instructor (id);
ALTER TABLE disponibilidad_horaria ADD CONSTRAINT FKdisponibilidad_horario2 FOREIGN KEY (id_dia) REFERENCES dia (id);
ALTER TABLE disponibilidad_horaria ADD CONSTRAINT FKdisponibilidad_horario3 FOREIGN KEY (id_jornada) REFERENCES jornada (id);
ALTER TABLE instructor_has_especialidad ADD CONSTRAINT FKinstructor_has_especialidad2 FOREIGN KEY (id_especialidad) REFERENCES especialidad (id);
ALTER TABLE instructor ADD CONSTRAINT FKinstructor2 FOREIGN KEY (id_usuario) REFERENCES usuario (id);
ALTER TABLE horario ADD CONSTRAINT FKhorario2 FOREIGN KEY (id_dia) REFERENCES dia (id);
ALTER TABLE version ADD CONSTRAINT FKversion FOREIGN KEY (id_trimestre_vigente) REFERENCES trimestre_vigente (id);
ALTER TABLE horario ADD CONSTRAINT FKhorario3 FOREIGN KEY (id_modalidad) REFERENCES modalidad (id);
ALTER TABLE horario ADD CONSTRAINT FKhorario4 FOREIGN KEY (id_version) REFERENCES version (id);
ALTER TABLE horario ADD CONSTRAINT FKhorario5 FOREIGN KEY (id_ambiente) REFERENCES ambiente (id);
ALTER TABLE horario ADD CONSTRAINT FKhorario6 FOREIGN KEY (id_ficha_has_trimestre) REFERENCES ficha_has_trimestre (id);
ALTER TABLE ambiente ADD CONSTRAINT FKambiente FOREIGN KEY (id_sede) REFERENCES sede (id);
ALTER TABLE disponibilidad_competencias ADD CONSTRAINT FKdisponibilidad_competencia2 FOREIGN KEY (id_resultado_aprendizaje) REFERENCES resultado_aprendizaje (id);
ALTER TABLE ra_has_actividad ADD CONSTRAINT FKra_has_actividad FOREIGN KEY (id_actividad) REFERENCES actividad (id);
ALTER TABLE competencia ADD CONSTRAINT FKcompetencia FOREIGN KEY (id_programa) REFERENCES programa (id);
ALTER TABLE ra_has_actividad ADD CONSTRAINT FKra_has_actividad2 FOREIGN KEY (id_planeacion_trimestre) REFERENCES planeacion_trimestre (id);
ALTER TABLE resultado_vistos ADD CONSTRAINT FKresultado_vistos FOREIGN KEY (id_resultado_aprendizaje) REFERENCES resultado_aprendizaje (id);
ALTER TABLE resultado_vistos ADD CONSTRAINT FKresultado_vistos2 FOREIGN KEY (id_ficha_has_trimestre) REFERENCES ficha_has_trimestre (id);
ALTER TABLE planeacion_trimestre ADD CONSTRAINT FKplaneacion_trimeste FOREIGN KEY (id_planeacion) REFERENCES planeacion (id);
ALTER TABLE trimestre ADD CONSTRAINT FKtrimestre FOREIGN KEY (id_nivel_formacion) REFERENCES nivel_formacion (id);
ALTER TABLE programa ADD CONSTRAINT FKprograma FOREIGN KEY (id_nivel_formacion) REFERENCES nivel_formacion (id);
ALTER TABLE ficha ADD CONSTRAINT FKficha FOREIGN KEY (id_programa) REFERENCES programa (id);
ALTER TABLE limitacion_ambiente ADD CONSTRAINT FKlimitacion_ambiente2 FOREIGN KEY (id_resultado_aprendizaje) REFERENCES resultado_aprendizaje (id);
ALTER TABLE planeacion_trimestre ADD CONSTRAINT FKplaneacion_trimestre2 FOREIGN KEY (id_trimestre) REFERENCES trimestre (id);
ALTER TABLE planeacion_trimestre ADD CONSTRAINT FKplaneacion_trimestre3 FOREIGN KEY (id_resultado_aprendizaje) REFERENCES resultado_aprendizaje (id);
ALTER TABLE resultado_aprendizaje ADD CONSTRAINT FKresultado_aprendizaje FOREIGN KEY (id_competencia) REFERENCES competencia (id);
ALTER TABLE trimestre ADD CONSTRAINT FKtrimestre2 FOREIGN KEY (id_jornada) REFERENCES jornada (id);
ALTER TABLE ficha_has_trimestre ADD CONSTRAINT FKficha_has_trimestre FOREIGN KEY (id_trimestre) REFERENCES trimestre (id);
ALTER TABLE ficha_has_trimestre ADD CONSTRAINT FKficha_has_trimestre2 FOREIGN KEY (id_ficha) REFERENCES ficha (id);
ALTER TABLE ficha ADD CONSTRAINT FKficha2 FOREIGN KEY (id_estado_ficha) REFERENCES estado_ficha (id);

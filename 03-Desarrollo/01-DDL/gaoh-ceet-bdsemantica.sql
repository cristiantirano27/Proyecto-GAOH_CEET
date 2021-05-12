CREATE SCHEMA gaoh_semantica;
USE gaoh_semantica;

CREATE TABLE actividad (
  id_actividad         int NOT NULL, 
  nombre               varchar(200) NOT NULL, 
  nombre_fase          varchar(20) NOT NULL, 
  fase_proyecto_codigo int NOT NULL, 
  PRIMARY KEY (id_actividad, 
  nombre_fase, 
  fase_proyecto_codigo));
CREATE TABLE ambiente (
  numero_ambiente int NOT NULL, 
  descripcion     varchar(45) NOT NULL, 
  estado          int NOT NULL, 
  tipo_ambiente   varchar(45) NOT NULL, 
  nombre_sede     varchar(45) NOT NULL, 
  PRIMARY KEY (numero_ambiente, 
  nombre_sede));
CREATE TABLE cliente (
  numero_documento int NOT NULL, 
  primer_nombre    varchar(20) NOT NULL, 
  segundo_nombre   varchar(20), 
  primer_apellido  varchar(20) NOT NULL, 
  segundo_apellido varchar(20), 
  foto             blob, 
  documento        varchar(10) NOT NULL, 
  PRIMARY KEY (numero_documento, 
  documento));
CREATE TABLE cliente_has_rol (
  estado           int NOT NULL, 
  numero_documento int NOT NULL, 
  documento        varchar(10) NOT NULL, 
  rol              varchar(20) NOT NULL, 
  PRIMARY KEY (numero_documento, 
  documento, 
  rol));
CREATE TABLE competencia (
  codigo          int NOT NULL, 
  descripcion     varchar(300) NOT NULL, 
  programacodigo  int NOT NULL, 
  programaversion int NOT NULL, 
  PRIMARY KEY (codigo, 
  programacodigo, 
  programaversion));
CREATE TABLE dia (
  nombre_dia varchar(10) NOT NULL, 
  estado     int NOT NULL, 
  PRIMARY KEY (nombre_dia));
CREATE TABLE disponibilidad_competencia (
  instructor_numero_documento  int NOT NULL, 
  instructor_documento         varchar(10) NOT NULL, 
  resultado_aprendizaje_codigo int NOT NULL, 
  r_a_competencia_codigo       int NOT NULL, 
  r_a_competencia_programa     int NOT NULL, 
  r_a_competencia_version      int NOT NULL, 
  PRIMARY KEY (instructor_numero_documento, 
  instructor_documento, 
  resultado_aprendizaje_codigo, 
  r_a_competencia_codigo, 
  r_a_competencia_programa, 
  r_a_competencia_version));
CREATE TABLE disponibilidad_horario (
  hora_inicio                 time NOT NULL, 
  hora_fin                    time NOT NULL, 
  sigla_jornada               varchar(10) NOT NULL, 
  instructor_numero_documento int NOT NULL, 
  instructor_documento        varchar(10) NOT NULL, 
  nombre_dia                  varchar(10) NOT NULL, 
  PRIMARY KEY (hora_inicio, 
  sigla_jornada, 
  instructor_numero_documento, 
  instructor_documento, 
  nombre_dia));
CREATE TABLE documento (
  id_documento varchar(10) NOT NULL, 
  nombre       varchar(45) NOT NULL, 
  estado       int NOT NULL, 
  PRIMARY KEY (id_documento));
CREATE TABLE especialidad (
  nombre_especialidad varchar(30) NOT NULL, 
  estado              int NOT NULL, 
  descrpcion          varchar(100) NOT NULL, 
  PRIMARY KEY (nombre_especialidad));
CREATE TABLE estado_ficha (
  nombre_estado varchar(20) NOT NULL, 
  estado        int NOT NULL, 
  PRIMARY KEY (nombre_estado));
CREATE TABLE fase (
  nombre_fase     varchar(20) NOT NULL, 
  estado          int NOT NULL, 
  proyecto_codigo int NOT NULL, 
  PRIMARY KEY (nombre_fase, 
  proyecto_codigo));
CREATE TABLE ficha (
  numero_ficha     int NOT NULL AUTO_INCREMENT, 
  fecha_inicio     date NOT NULL, 
  fecha_fin        date NOT NULL, 
  ruta             char(4) NOT NULL, 
  nombre_estado    varchar(20) NOT NULL, 
  programa_codigo  int NOT NULL, 
  programa_version int NOT NULL, 
  PRIMARY KEY (numero_ficha));
CREATE TABLE ficha_has_trimestre (
  numero_ficha     int NOT NULL, 
  nombre_trimestre varchar(20) NOT NULL, 
  sigla_jornada    varchar(10) NOT NULL, 
  nivel_formacion  varchar(20) NOT NULL, 
  PRIMARY KEY (numero_ficha, 
  nombre_trimestre, 
  sigla_jornada, 
  nivel_formacion));
CREATE TABLE horario (
  hora_inicio              varchar(45) NOT NULL, 
  hora_fin                 varchar(45) NOT NULL, 
  publicado                binary(255) NOT NULL, 
  f_has_t_numero_ficha     int NOT NULL, 
  f_has_t_nombre_trimestre varchar(20) NOT NULL, 
  f_has_t_sigla_jornada    varchar(10) NOT NULL, 
  f_has_t_nivel_formacion  varchar(20) NOT NULL, 
  nombre_modalidad         varchar(100) NOT NULL, 
  id_version               int NOT NULL, 
  trimestre_vigente_id     int NOT NULL, 
  nombre_dia               varchar(10) NOT NULL, 
  numero_ambiente          int NOT NULL, 
  ambiente_nombre_sede     varchar(45) NOT NULL, 
  PRIMARY KEY (hora_inicio, 
  f_has_t_numero_ficha, 
  f_has_t_nombre_trimestre, 
  f_has_t_sigla_jornada, 
  f_has_t_nivel_formacion, 
  id_version, 
  trimestre_vigente_id, 
  nombre_dia, 
  numero_ambiente, 
  ambiente_nombre_sede));
CREATE TABLE instructor (
  numero_documento int NOT NULL, 
  documento        varchar(10) NOT NULL, 
  tipo_vinculacion varchar(20) NOT NULL, 
  PRIMARY KEY (numero_documento, 
  documento));
CREATE TABLE instructor_has_especialidad (
  nombre_especialidad         varchar(30) NOT NULL, 
  instructor_numero_documento int NOT NULL, 
  instructor_documento        varchar(10) NOT NULL, 
  PRIMARY KEY (nombre_especialidad, 
  instructor_numero_documento, 
  instructor_documento));
CREATE TABLE jornada (
  sigla_jornada varchar(10) NOT NULL, 
  nombre        varchar(45) NOT NULL, 
  descripcion   varchar(100) NOT NULL, 
  imagen        blob NOT NULL, 
  estado        int NOT NULL, 
  PRIMARY KEY (sigla_jornada));
CREATE TABLE limitacion_ambiente (
  resultado_aprendizaje_codigo int NOT NULL, 
  r_a_competencia_codigo       int NOT NULL, 
  r_a_competencia_programa     int NOT NULL, 
  r_a_competencia_version      int NOT NULL, 
  numero_ambiente              int NOT NULL, 
  ambiente_nombre_sede         varchar(45) NOT NULL, 
  PRIMARY KEY (resultado_aprendizaje_codigo, 
  r_a_competencia_codigo, 
  r_a_competencia_programa, 
  r_a_competencia_version, 
  numero_ambiente, 
  ambiente_nombre_sede));
CREATE TABLE modalidad (
  nombre_modalidad varchar(100) NOT NULL, 
  estado           int NOT NULL, 
  PRIMARY KEY (nombre_modalidad));
CREATE TABLE nivel_formacion (
  nivel_formacion varchar(20) NOT NULL, 
  estado          int NOT NULL, 
  PRIMARY KEY (nivel_formacion));
CREATE TABLE planeacion (
  nombre_planeacion varchar(45) NOT NULL, 
  estado            int NOT NULL, 
  PRIMARY KEY (nombre_planeacion));
CREATE TABLE planeacion_trimestre (
  nombre_planeacion         varchar(45) NOT NULL, 
  nombre_trimestre          varchar(20) NOT NULL, 
  trimestre_sigla_jornada   varchar(10) NOT NULL, 
  trimestre_nivel_formacion varchar(20) NOT NULL, 
  r_a_codigo                int NOT NULL, 
  r_a_competencia_codigo    int NOT NULL, 
  r_a_competencia_programa  int NOT NULL, 
  r_a_competencia_version   int NOT NULL, 
  PRIMARY KEY (nombre_planeacion, 
  nombre_trimestre, 
  trimestre_sigla_jornada, 
  trimestre_nivel_formacion, 
  r_a_codigo, 
  r_a_competencia_codigo, 
  r_a_competencia_programa, 
  r_a_competencia_version));
CREATE TABLE programa (
  codigo          int NOT NULL, 
  version         int NOT NULL, 
  nombre          varchar(100) NOT NULL, 
  sigla           varchar(20) NOT NULL, 
  estado          int NOT NULL, 
  nivel_formacion varchar(20) NOT NULL, 
  PRIMARY KEY (codigo, 
  version));
CREATE TABLE proyecto (
  codigo           int NOT NULL AUTO_INCREMENT, 
  nombre           varchar(200) NOT NULL, 
  estado           int NOT NULL, 
  programa_codigo  int NOT NULL, 
  programa_version int NOT NULL, 
  PRIMARY KEY (codigo));
CREATE TABLE ra_has_actividad (
  id_actividad                 int NOT NULL, 
  actividad_nombre_fase        varchar(20) NOT NULL, 
  actividad_proyecto_codigo    int NOT NULL, 
  resultado_aprendizaje_codigo int NOT NULL, 
  r_a_competencia_codigo       int NOT NULL, 
  r_a_competencia_programa     int NOT NULL, 
  r_a_competencia_version      int NOT NULL, 
  PRIMARY KEY (id_actividad, 
  actividad_nombre_fase, 
  actividad_proyecto_codigo, 
  resultado_aprendizaje_codigo, 
  r_a_competencia_codigo, 
  r_a_competencia_programa, 
  r_a_competencia_version));
CREATE TABLE resultado_aprendizaje (
  codigo               int NOT NULL, 
  descripcion          varchar(500) NOT NULL, 
  competencia_codigo   int NOT NULL, 
  competencia_programa int NOT NULL, 
  competencia_version  int NOT NULL, 
  PRIMARY KEY (codigo, 
  competencia_codigo, 
  competencia_programa, 
  competencia_version));
CREATE TABLE resultado_visto (
  numero_ficha             int NOT NULL, 
  nombre_trimestre         varchar(20) NOT NULL, 
  sigla_jornada            varchar(10) NOT NULL, 
  nivel_formacion          varchar(20) NOT NULL, 
  r_a_codigo               int NOT NULL, 
  r_a_competencia_codigo   int NOT NULL, 
  r_a_competencia_programa int NOT NULL, 
  r_a_competencia_version  int NOT NULL, 
  PRIMARY KEY (numero_ficha, 
  nombre_trimestre, 
  sigla_jornada, 
  nivel_formacion, 
  r_a_codigo, 
  r_a_competencia_codigo, 
  r_a_competencia_programa, 
  r_a_competencia_version));
CREATE TABLE rol (
  id_rol      varchar(20) NOT NULL, 
  descripcion varchar(100) NOT NULL, 
  estado      int NOT NULL, 
  PRIMARY KEY (id_rol));
CREATE TABLE sede (
  nombre_sede varchar(45) NOT NULL, 
  direccion   varchar(45) NOT NULL, 
  estado      int NOT NULL, 
  PRIMARY KEY (nombre_sede));
CREATE TABLE servidor_correo_electronico (
  correo       varchar(100) NOT NULL, 
  contrasenia  varchar(65) NOT NULL, 
  mensaje      varchar(300) NOT NULL, 
  recuperacion varchar(300) NOT NULL, 
  PRIMARY KEY (correo));
CREATE TABLE trimestre (
  nombre_trimestre varchar(20) NOT NULL, 
  sigla_jornada    varchar(10) NOT NULL, 
  nivel_formacion  varchar(20) NOT NULL, 
  PRIMARY KEY (nombre_trimestre, 
  sigla_jornada, 
  nivel_formacion));
CREATE TABLE trimestre_vigente (
  id_trimestre int NOT NULL AUTO_INCREMENT, 
  fecha_inicio date NOT NULL, 
  fecha_fin    date NOT NULL, 
  estado       int NOT NULL, 
  PRIMARY KEY (id_trimestre));
CREATE TABLE usuario (
  correo           varchar(100) NOT NULL, 
  contrasenia      varchar(100) NOT NULL, 
  fecha_trimestre  date NOT NULL, 
  numero_documento int NOT NULL, 
  documento        varchar(10) NOT NULL, 
  PRIMARY KEY (correo, 
  numero_documento, 
  documento));
CREATE TABLE version (
  id_version           int NOT NULL, 
  activa               binary(255) NOT NULL, 
  trimestre_vigente_id int NOT NULL, 
  PRIMARY KEY (id_version, 
  trimestre_vigente_id));
CREATE TABLE vinculacion (
  tipo_vinculacion varchar(20) NOT NULL, 
  horas            int NOT NULL, 
  estado           int NOT NULL, 
  PRIMARY KEY (tipo_vinculacion));
ALTER TABLE limitacion_ambiente ADD CONSTRAINT FKlimitacion_ambiente FOREIGN KEY (numero_ambiente, ambiente_nombre_sede) REFERENCES ambiente (numero_ambiente, nombre_sede);
ALTER TABLE horario ADD CONSTRAINT FKhorario FOREIGN KEY (numero_ambiente, ambiente_nombre_sede) REFERENCES ambiente (numero_ambiente, nombre_sede);
ALTER TABLE ambiente ADD CONSTRAINT FKambiente FOREIGN KEY (nombre_sede) REFERENCES sede (nombre_sede);
ALTER TABLE horario ADD CONSTRAINT FKhorario2 FOREIGN KEY (nombre_dia) REFERENCES dia (nombre_dia);
ALTER TABLE horario ADD CONSTRAINT FKhorario3 FOREIGN KEY (id_version, trimestre_vigente_id) REFERENCES version (id_version, trimestre_vigente_id);
ALTER TABLE version ADD CONSTRAINT FKversion FOREIGN KEY (trimestre_vigente_id) REFERENCES trimestre_vigente (id_trimestre);
ALTER TABLE instructor ADD CONSTRAINT FKinstructor FOREIGN KEY (tipo_vinculacion) REFERENCES vinculacion (tipo_vinculacion);
ALTER TABLE horario ADD CONSTRAINT FKhorario4 FOREIGN KEY (nombre_modalidad) REFERENCES modalidad (nombre_modalidad);
ALTER TABLE disponibilidad_competencia ADD CONSTRAINT FKdisponibilidad_competencia FOREIGN KEY (resultado_aprendizaje_codigo, r_a_competencia_codigo, r_a_competencia_programa, r_a_competencia_version) REFERENCES resultado_aprendizaje (codigo, competencia_codigo, competencia_programa, competencia_version);
ALTER TABLE disponibilidad_competencia ADD CONSTRAINT FKdisponibilidad_competencia2 FOREIGN KEY (instructor_numero_documento, instructor_documento) REFERENCES instructor (numero_documento, documento);
ALTER TABLE disponibilidad_horario ADD CONSTRAINT FKdisponibilidad_horario FOREIGN KEY (nombre_dia) REFERENCES dia (nombre_dia);
ALTER TABLE disponibilidad_horario ADD CONSTRAINT FKdisponibiiidad_horario2 FOREIGN KEY (instructor_numero_documento, instructor_documento) REFERENCES instructor (numero_documento, documento);
ALTER TABLE instructor_has_especialidad ADD CONSTRAINT FKinstructor_has_especialidad FOREIGN KEY (instructor_numero_documento, instructor_documento) REFERENCES instructor (numero_documento, documento);
ALTER TABLE instructor_has_especialidad ADD CONSTRAINT FKinstructor_has_especialidad2 FOREIGN KEY (nombre_especialidad) REFERENCES especialidad (nombre_especialidad);
ALTER TABLE limitacion_ambiente ADD CONSTRAINT FKlimitacion_ambiente2 FOREIGN KEY (resultado_aprendizaje_codigo, r_a_competencia_codigo, r_a_competencia_programa, r_a_competencia_version) REFERENCES resultado_aprendizaje (codigo, competencia_codigo, competencia_programa, competencia_version);
ALTER TABLE horario ADD CONSTRAINT FKhorario5 FOREIGN KEY (f_has_t_numero_ficha, f_has_t_nombre_trimestre, f_has_t_sigla_jornada, f_has_t_nivel_formacion) REFERENCES ficha_has_trimestre (numero_ficha, nombre_trimestre, sigla_jornada, nivel_formacion);
ALTER TABLE disponibilidad_horario ADD CONSTRAINT FKdisponibilidad_horario3 FOREIGN KEY (sigla_jornada) REFERENCES jornada (sigla_jornada);
ALTER TABLE ra_has_actividad ADD CONSTRAINT FKra_has_actividad FOREIGN KEY (resultado_aprendizaje_codigo, r_a_competencia_codigo, r_a_competencia_programa, r_a_competencia_version) REFERENCES resultado_aprendizaje (codigo, competencia_codigo, competencia_programa, competencia_version);
ALTER TABLE ra_has_actividad ADD CONSTRAINT FKra_has_actividad2 FOREIGN KEY (id_actividad, actividad_nombre_fase, actividad_proyecto_codigo) REFERENCES actividad (id_actividad, nombre_fase, fase_proyecto_codigo);
ALTER TABLE actividad ADD CONSTRAINT FKactividad FOREIGN KEY (nombre_fase, fase_proyecto_codigo) REFERENCES fase (nombre_fase, proyecto_codigo);
ALTER TABLE fase ADD CONSTRAINT FKfase FOREIGN KEY (proyecto_codigo) REFERENCES proyecto (codigo);
ALTER TABLE proyecto ADD CONSTRAINT FKproyecto FOREIGN KEY (programa_codigo, programa_version) REFERENCES programa (codigo, version);
ALTER TABLE planeacion_trimestre ADD CONSTRAINT FKplaneacion_trimestre FOREIGN KEY (r_a_codigo, r_a_competencia_codigo, r_a_competencia_programa, r_a_competencia_version) REFERENCES resultado_aprendizaje (codigo, competencia_codigo, competencia_programa, competencia_version);
ALTER TABLE planeacion_trimestre ADD CONSTRAINT FKplaneacion_trimestre2 FOREIGN KEY (nombre_trimestre, trimestre_sigla_jornada, trimestre_nivel_formacion) REFERENCES trimestre (nombre_trimestre, sigla_jornada, nivel_formacion);
ALTER TABLE planeacion_trimestre ADD CONSTRAINT FKplaneacion_trimestre3 FOREIGN KEY (nombre_planeacion) REFERENCES planeacion (nombre_planeacion);
ALTER TABLE resultado_visto ADD CONSTRAINT FKresultado_visto FOREIGN KEY (r_a_codigo, r_a_competencia_codigo, r_a_competencia_programa, r_a_competencia_version) REFERENCES resultado_aprendizaje (codigo, competencia_codigo, competencia_programa, competencia_version);
ALTER TABLE resultado_visto ADD CONSTRAINT FKresultado_visto2 FOREIGN KEY (numero_ficha, nombre_trimestre, sigla_jornada, nivel_formacion) REFERENCES ficha_has_trimestre (numero_ficha, nombre_trimestre, sigla_jornada, nivel_formacion);
ALTER TABLE resultado_aprendizaje ADD CONSTRAINT FKresultado_aprendizaje FOREIGN KEY (competencia_codigo, competencia_programa, competencia_version) REFERENCES competencia (codigo, programacodigo, programaversion);
ALTER TABLE competencia ADD CONSTRAINT FKcompetencia FOREIGN KEY (programacodigo, programaversion) REFERENCES programa (codigo, version);
ALTER TABLE programa ADD CONSTRAINT FKprograma FOREIGN KEY (nivel_formacion) REFERENCES nivel_formacion (nivel_formacion);
ALTER TABLE ficha ADD CONSTRAINT FKficha FOREIGN KEY (programa_codigo, programa_version) REFERENCES programa (codigo, version);
ALTER TABLE ficha_has_trimestre ADD CONSTRAINT FKficha_has_trimestre FOREIGN KEY (numero_ficha) REFERENCES ficha (numero_ficha);
ALTER TABLE ficha_has_trimestre ADD CONSTRAINT FKficha_has_trimestre2 FOREIGN KEY (nombre_trimestre, sigla_jornada, nivel_formacion) REFERENCES trimestre (nombre_trimestre, sigla_jornada, nivel_formacion);
ALTER TABLE trimestre ADD CONSTRAINT FKtrimestre FOREIGN KEY (nivel_formacion) REFERENCES nivel_formacion (nivel_formacion);
ALTER TABLE trimestre ADD CONSTRAINT FKtrimestre2 FOREIGN KEY (sigla_jornada) REFERENCES jornada (sigla_jornada);
ALTER TABLE ficha ADD CONSTRAINT FKficha2 FOREIGN KEY (nombre_estado) REFERENCES estado_ficha (nombre_estado);
ALTER TABLE instructor ADD CONSTRAINT FKinstructor951187 FOREIGN KEY (numero_documento, documento) REFERENCES cliente (numero_documento, documento);
ALTER TABLE cliente_has_rol ADD CONSTRAINT FKcliente_has_rol FOREIGN KEY (rol) REFERENCES rol (id_rol);
ALTER TABLE cliente_has_rol ADD CONSTRAINT FKcliente_has_rol2 FOREIGN KEY (numero_documento, documento) REFERENCES cliente (numero_documento, documento);
ALTER TABLE usuario ADD CONSTRAINT FKusuario FOREIGN KEY (numero_documento, documento) REFERENCES cliente (numero_documento, documento);
ALTER TABLE cliente ADD CONSTRAINT FKcliente FOREIGN KEY (documento) REFERENCES documento (id_documento);

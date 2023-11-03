-- Verificar si la base de datos procastgent_note existe
CREATE DATABASE IF NOT EXISTS procastgent_note;

-- Usar la base de datos procastgent_note
USE procastgent_note;

-- Definir la estructura de la tabla client
CREATE TABLE client (
  IDclient bigint(20) NOT NULL AUTO_INCREMENT,
  Name varchar(50) NOT NULL,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Cellphone bigint(20) DEFAULT NULL,
  Birthdate date DEFAULT NULL,
  PRIMARY KEY (IDclient)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Definir la estructura de la tabla customize
CREATE TABLE customize (
  IDcustom int(11) NOT NULL AUTO_INCREMENT,
  IDuser varchar(50) NOT NULL,
  DocsFileCustomize varchar(20) NOT NULL,
  PRIMARY KEY (IDcustom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Definir la estructura de la tabla note
CREATE TABLE note (
  IDnote bigint(20) NOT NULL AUTO_INCREMENT,
  IDuser bigint(20) NOT NULL,
  PathNote varchar(30) NOT NULL,
  PathCreate date NOT NULL,
  PRIMARY KEY (IDnote)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Definir la estructura de la tabla taskmanager
CREATE TABLE taskmanager (
  IDtask bigint(20) NOT NULL AUTO_INCREMENT,
  IDuser bigint(11) NOT NULL,
  IDtasktype int(11) NOT NULL,
  TaskDescription text NOT NULL,
  TaskDateCreate date NOT NULL,
  TaskDateRequired date NOT NULL,
  TaskDateComplete date DEFAULT NULL,
  TaskState bit(1) DEFAULT NULL,
  PRIMARY KEY (IDtask)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Definir la estructura de la tabla tasktype
CREATE TABLE tasktype (
  IDtaskType int(11) NOT NULL AUTO_INCREMENT,
  NameTaskType varchar(50) NOT NULL,
  PRIMARY KEY (IDtaskType)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insertar datos en la tabla tasktype
INSERT INTO tasktype (IDtaskType, NameTaskType) VALUES
(1, 'TAREA'),
(2, 'PENDIENTE'),
(3, 'URGENTE');

-- Definir la estructura de la tabla user
CREATE TABLE user (
  IDuser bigint(20) NOT NULL AUTO_INCREMENT,
  IDclient bigint(20) NOT NULL,
  Nameuser varchar(50) NOT NULL,
  Password varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  PassModifier date NOT NULL,
  Delete bit(1) DEFAULT NULL,
  DeleteDate date DEFAULT NULL,
  PRIMARY KEY (IDuser)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
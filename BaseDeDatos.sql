create database bdd;

create user 'lab'@'localhost' identified by 'Developer123!';

grant all privileges on bdd.* to 'lab'@'localhost'
with grant option;

use bdd;

CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `telefono` int NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `esVendedor` bool NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(999),
  `foto` longblob,
  `categoria` varchar(20),
  `precio` int NOT NULL,
  `inventario` int NOT NULL,
  `vendedor` int NOT NULL,
  PRIMARY KEY (`idProducto`),
  CONSTRAINT `vendedor` FOREIGN KEY (`vendedor`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `reseña` (
  `idReseña` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(999) NOT NULL,
  `calificacion` int NOT NULL,
  `idProducto` int NOT NULL,
  PRIMARY KEY (`idReseña`),
  CONSTRAINT `idProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

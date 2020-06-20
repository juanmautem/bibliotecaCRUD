ALTER TABLE libros CHANGE fechaCreacion fechaCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE autoreslibros CHANGE fechaCreacion fechaCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE autores CHANGE fechaCreacion fechaCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE direcciones CHANGE fechaCreacion fechaCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE prestamo CHANGE fechaCreacion fechaCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE tipousuarios CHANGE fechaCreacion fechaCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE usuario CHANGE fechaCreacion fechaCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE usuariotipo CHANGE fechaCreacion fechaCreacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;


INSERT INTO autores (autorID, autorNombre, autorAPat, autorAMat, autorNac, `fechaCreacion`) VALUES
(NULL, 'L.A.', 'Casillas', 'Santillán', 'Española', CURRENT_DATE()), 
(NULL, 'M.G.', 'Gintestá', NULL, 'Española', CURRENT_DATE()), 
(NULL, 'Ó.', 'Pérez', 'Mora', 'Española', CURRENT_DATE()), 
(NULL, 'R.C.', 'Paré', NULL, 'Española', CURRENT_DATE()), 
(NULL, 'A.', 'Sierra', 'Rojas', 'Mexicana', CURRENT_DATE()),
(NULL, 'M.G.', 'Gintestá', NULL, 'Española', CURRENT_DATE()), 
(NULL, 'Ó.', 'Pérez', 'Mora', 'Española', CURRENT_DATE()), 
(NULL, 'R.C.', 'Paré', NULL, 'Española', CURRENT_DATE()), 
(NULL, 'A.', 'Sierra', 'Rojas', 'Mexicana', CURRENT_DATE()),
(NULL, 'Roger S.', 'Pressman', '', 'Norteamericana', CURRENT_DATE());
INSERT INTO libros (libroID, codigoLibro, tituloLibro, libroISBN, editorialLibro, libroPaginas, fechaCreacion) VALUES 
(NULL, 'BDMS001', 'Bases de Datos en MySQL.', '9788426714688', 'FUOC', '450', CURRENT_DATE()), 
(NULL, '', 'Ingeniería de Software, un enfoque práctico', '9701054733', 'Addison-Wesley', '777', CURRENT_DATE()), 
(NULL, 'INBD0001', 'Introducción a las Bases de Datos.', '9874514785410', 'FUOC', '360', CURRENT_DATE());

INSERT INTO usuario (usuarioID, usuarioNombre, usuarioAPat, usuarioAMat, direccionID, telefonoUsuario, emailUsuario, statusUsuario, fechaCreacion, passUsuario) VALUES 
(NULL, 'Juan Pedro', 'Robles', 'Tirado', NULL, '123456789', 'juanroti@gmail.com', '0', CURRENT_DATE(), 'Biblioteca2020'), 
(NULL, 'Juan Manuel ', 'Fernández ', 'Álvarez', NULL, '3122100436', 'iscjuanmafa@biblioteca.com', '1', '2020-01-01 17:59:12', '~2!%/9(/*{*¨M¬|1'), 
(NULL, 'Laura', 'Díaz', 'López', NULL, '246810123', 'laurix_090802', '1', '2020-04-01 17:59:12', '@°23$%)=¿^`+'), 
(NULL, 'Alberto', NULL, 'Isabeles', NULL, '369121416', 'beto_isa09@hotmail.com', '1', '2020-02-03 17:59:12', '~\'´{65e3\"|1d'), 
(NULL, 'Marina', 'Gonzalez', 'Urbieta', NULL, '456789321', 'gourma@outlook.com', '0', CURRENT_DATE(), 'Biblioteca2020');

INSERT INTO tipousuarios (tipoUsuarioID, tipoNombre, descripcionTipo, fechaCreacion) VALUES 
(NULL, 'Administrador', 'El administrador tiene todo los privilegios', current_timestamp()), 
(NULL, 'Emplado', 'El empleado solo pued eregistrar libros, editarlos, agregar usuarios, agregar nuevos préstamos', current_timestamp()), 
(NULL, 'Cliente/Usuario', 'El cliente solo tiene acceso a buscar libros, solocitar préstamos de libros, entregar libros y editar su información', current_timestamp());




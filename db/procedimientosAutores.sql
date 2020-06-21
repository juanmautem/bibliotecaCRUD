--PROCEDIMIENTO PARA REGISTRAR NUEVO AUTOR
DELIMITER $$
CREATE PROCEDURE insertAutor (IN nombre  VARCHAR(30), app VARCHAR(30), apm VARCHAR(30), nac VARCHAR(10))
	BEGIN
	  INSERT INTO autores (autorID, autorNombre, autorAPat, autorAMat, autorNac, fechaCreacion) 
	  VALUES (NULL,nombre,app,apm,nac,NOW());
	END $$
DELIMITER ;

--PROCEDIMIENTO PARA REALIZAR UNA MODIFICACIÓN A UN AUTOR
DELIMITER $$
CREATE PROCEDURE updateAutor(IN id SMALLINT, nombre  VARCHAR(30), app VARCHAR(30), apm VARCHAR(30), nac VARCHAR(10))
	BEGIN
	  UPDATE autores SET 
	    autorNombre = nombre, autorAPat = app, autorAMat = apm, autorNac = nac 
	    WHERE autorID = id;
	END$$
DELIMITER ;

--PROCEDIMIENTO PARA CAMBIAR DE ESTADO A UN AUTOR
DELIMITER $$
CREATE PROCEDURE activarAutor(IN id SMALLINT, ast TINYINT(1))
	BEGIN
	  UPDATE autores SET autorStatus = 1  WHERE autorID = id;
	END$$

CREATE PROCEDURE deactivarAutor(IN id SMALLINT, ast TINYINT(1))
	BEGIN
	  UPDATE autores SET autorStatus = 0 WHERE autorID = id;
	END$$
DELIMITER ;

--PROCEDIMIENTO PARA ELIMINAR UN AUTOR
DELIMITER $$
CREATE PROCEDURE activarAutor(IN id SMALLINT, ast TINYINT(1))
	BEGIN
	  DELETE FROM autores WHERE autorID = id;
	END$$
DELIMITER ;
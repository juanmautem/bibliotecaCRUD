TABLA PARA ALMACENAR LOS CAMBIOS EN LA BASE DE DATOS
CREATE TABLE ctrlpers(
	id int auto_increment primary key,
	tabla VARCHAR(20),    
	idres INT,            
	att VARCHAR(30),      
	olddata VARCHAR(100), 
	newdata VARCHAR(100), 
	act VARCHAR(30),      
	usr VARCHAR(30),      
	dateedit DATETIME     
);

--MODIFICACIÓN A TABLA AUTORES POR SER TABLA PADRE DE UN REGISTRO DE ESTADO
ALTER TABLE autores ADD autorStatus TINYINT DEFAULT 0;

--TRIGGER PARA ALMACENAR UN CAMBIO EN ALTA DE REGISTROS DE LA TABLA AUTORES
DELIMITER $$
CREATE TRIGGER autAI AFTER INSERT ON autores
	FOR EACH ROW
	BEGIN
	  INSERT INTO ctrlpers (tabla, idres, att, olddata, newdata, act, usr, dateedit)
	  VALUES('autores', NULL, 'ALL_ATRIBUTES', NULL, NEW.autorID, 'INSERT', CURRENT_USER(),NOW());
END $$
DELIMITER ;

--TRIGGER PARA REGISTRAR MODIFICACIÓN EN TABLA AUTORES EN CUALQUIER CAMPO

DELIMITER $$
CREATE TRIGGER autAU AFTER UPDATE ON autores
	FOR EACH ROW 
	BEGIN		 
	IF(OLD.autorNombre != NEW.autorNombre) THEN
	  BEGIN
	  	  INSERT INTO ctrlpers (tabla, idres, att, olddata, newdata, action, user, dateedit)
		  VALUES('autores', NEW.autorID, 'autoNombre', OLD.autorNombre, NEW.autorNombre, 'UPDATE', CURRENT_USER(),NOW());
	  END;
	END IF;
	IF(OLD.autorAPat != NEW.autorAPat) THEN
	  BEGIN
		  INSERT INTO ctrlpers (tabla, idres, att, olddata, newdata, action, user, dateedit)
		  VALUES('autores', NEW.autorID, 'Apellido Paterno', OLD.autorAPat, NEW. autorAPat, 'UPDATE', CURRENT_USER(),NOW());
	  END;
	END IF;
	IF(OLD.autorAMat != NEW. autorAMat) THEN
	  BEGIN
		  INSERT INTO ctrlpers (tabla, idres, att, olddata, newdata, action, user, dateedit)
		  VALUES('autores', NEW.autorID, 'autorAMat', OLD.autorAMat, NEW. autorAMat, 'UPDATE', CURRENT_USER(),NOW());
	  END;
	END IF;
	IF(OLD.autorNac != NEW.autorNac) THEN
	  BEGIN
		  INSERT INTO ctrlpers (tabla, idres, att, olddata, newdata, action, user, dateedit)
		  VALUES('autores', NEW.autorID, 'autorNac', OLD.autorNac, NEW.autorNac, 'UPDATE', CURRENT_USER(),NOW());
	  END;
	END IF;
	IF(OLD.autorStatus != NEW.autorStatus) THEN
	  BEGIN
		  INSERT INTO ctrlpers (tabla, idres, att, olddata, newdata, action, user, dateedit)
		  VALUES('autores', NEW.autorID, 'autorStatus', OLD.autorStatus, NEW.autorStatus, 'UPDATE', CURRENT_USER(),NOW());
	  END;
	END IF;
END $$
DELIMITER ;

--TRIGGER PARA ELIMINAR EN CASCADA UN AUTOR Y SU RELACION CON AUTORESLIBROS
DELIMITER $$
CREATE TRIGGER delAuCascade BEFORE DELETE ON autores 
	FOR EACH ROW 
	BEGIN 
	  INSERT INTO ctrlpers (tabla, idres, att, olddata, newdata, action, user, dateedit) 
	  VALUES('autores', NULL, 'ALL_ATRIBUTES', OLD.autorID, NULL, 'DELETE', CURRENT_USER(),NOW()); 
	  DELETE FROM autoreslibros WHERE autorID = OLD.autorID; 
	  INSERT INTO ctrlpers (tabla, idres, att, olddata, newdata, action, user, dateedit) 
	  VALUES('autoreslibros', NULL, 'ALL_RELATIONS', OLD.autorID, NULL, 'DELETE', CURRENT_USER(),NOW()); 
	END $$
DELIMITER ;

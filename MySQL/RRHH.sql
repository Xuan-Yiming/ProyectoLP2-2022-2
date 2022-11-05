-- Administrador
DROP PROCEDURE IF EXISTS `INSERTAR_ADMINISTRADOR`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_ADMINISTRADOR`(
	OUT _id_usuario INT,
    IN _area VARCHAR(50),
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
    )
BEGIN
	INSERT INTO persona(tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,sexo,telefono,direccion,email,activo)
                VALUES(_tipo_de_documento, _numero_de_documento, _nombre, _apellido, _fecha_de_nacimiento,_sexo, _telefono, _direccion, _email, 1); 
                SET _id_usuario = @@LAST_INSERT_ID;
    INSERT INTO usuario(id_usuario, username, password, fecha_de_ingreso, foto_perfil, activo)
                VALUES(_id_usuario, _username, _password, _fecha_de_ingreso, _foto_perfil, 1);
    INSERT INTO administrador(id_usuario, area)
                VALUES(_id_usuario, _area);
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_ADMINISTRADOR`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_ADMINISTRADOR`(
	IN _id_usuario INT,
    IN _area VARCHAR(50),
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
    )
BEGIN
	UPDATE persona SET  tipo_de_documento=_tipo_de_documento ,numero_de_documento=_numero_de_documento,
                        nombre=_nombre,apellido=_apellido,fecha_de_nacimiento=_fecha_de_nacimiento, sexo=_sexo,
                        telefono=_telefono,direccion=_direccion,email=_email
        WHERE id_usuario = _id_usuario;
    UPDATE usuario SET username=_username, password=_password, fecha_de_ingreso=_fecha_de_ingreso,
                        foto_perfil=_foto_perfil, activo=_activo
        WHERE id_usuario = _id_usuario;
    UPDATE administrador SET area=_area
        WHERE id_usuario = _id_usuario;
END ;;
DELIMITER ;

-- Vendedor
DROP PROCEDURE IF EXISTS `INSERTAR_VENDEDOR`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_VENDEDOR`(
	OUT _id_usuario INT,
    IN _cantidad_ventas INT,
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
)
BEGIN
	INSERT INTO persona(tipo_de_documento, numero_de_documento, nombre, apellido, fecha_de_nacimiento,sexo, telefono, direccion, email, activo)
                VALUES(_tipo_de_documento, _numero_de_documento, _nombre, _apellido, _fecha_de_nacimiento,_sexo, _telefono, _direccion, _email, 1); 
                SET _id_usuario = @@LAST_INSERT_ID;
    INSERT INTO usuario(id_usuario, username, password, fecha_de_ingreso, foto_perfil, activo)
                VALUES(_id_usuario, _username, _password, _fecha_de_ingreso, _foto_perfil, 1);
    INSERT INTO vendedor(id_usuario, cantidad_ventas)
                VALUES(_id_usuario, _cantidad_ventas);
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_VENDEDOR`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_VENDEDOR`(
	IN _id_usuario INT,
    IN _cantidad_ventas INT,
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
    )
BEGIN
	UPDATE persona SET  tipo_de_documento=_tipo_de_documento ,numero_de_documento=_numero_de_documento,
                        nombre=_nombre,apellido=_apellido,fecha_de_nacimiento=_fecha_de_nacimiento, sexo=_sexo,
                        telefono=_telefono,direccion=_direccion,email=_email
        WHERE id_usuario = _id_usuario;
    UPDATE usuario SET username=_username, password=_password, fecha_de_ingreso=_fecha_de_ingreso,
                        foto_perfil=_foto_perfil, activo=_activo
        WHERE id_usuario = _id_usuario;
    UPDATE vendedor SET cantidad_ventas=_cantidad_ventas
        WHERE id_usuario = _id_usuario;
END ;;
DELIMITER ;

-- Supervisor De Almacen
DROP PROCEDURE IF EXISTS `INSERTAR_SUPERVISOR_DE_ALMACEN`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_SUPERVISOR_DE_ALMACEN`(
	OUT _id_usuario INT,
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    IN _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
)
BEGIN
	INSERT INTO persona(tipo_de_documento, numero_de_documento, nombre, apellido, fecha_de_nacimiento,sexo, telefono, direccion, email, activo)
                VALUES(_tipo_de_documento, _numero_de_documento, _nombre, _apellido, _fecha_de_nacimiento,_sexo, _telefono, _direccion, _email, 1); 
                SET _id_usuario = @@LAST_INSERT_ID;
    INSERT INTO usuario(id_usuario, username, password, fecha_de_ingreso, foto_perfil, activo)
                VALUES(_id_usuario, _username, _password, _fecha_de_ingreso, _foto_perfil, 1);
    INSERT INTO supervisorDeAlmacen(id_usuario)
                VALUES(_id_usuario);
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_SUPERVISOR_DE_ALMACEN`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_SUPERVISOR_DE_ALMACEN`(
	IN _id_usuario INT,
    IN _username VARCHAR(50),
    IN _password VARCHAR(50),
    IN _fecha_de_ingreso DATE,
    IN _foto_perfil LONGBLOB,
    IN _activo TINYINT,
    IN _tipo_de_documento VARCHAR(50),
    IN _numero_de_documento VARCHAR(50),
    IN _nombre VARCHAR(50),
    IN _apellido VARCHAR(50),
    IN _fecha_de_nacimiento DATE,
    In _sexo VARCHAR(50),
    IN _telefono VARCHAR(50),
    IN _direccion VARCHAR(50),
    IN _email VARCHAR(50)
    )
BEGIN
	UPDATE persona SET  tipo_de_documento=_tipo_de_documento ,numero_de_documento=_numero_de_documento,
                        nombre=_nombre,apellido=_apellido,fecha_de_nacimiento=_fecha_de_nacimiento, sexo=_sexo,
                        telefono=_telefono,direccion=_direccion,email=_email
        WHERE id_usuario = _id_usuario;
    UPDATE usuario SET username=_username, password=_password, fecha_de_ingreso=_fecha_de_ingreso,
                        foto_perfil=_foto_perfil, activo=_activo
        WHERE id_usuario = _id_usuario;
END ;;
DELIMITER ;

-- Procedimientos Generales
DROP PROCEDURE IF EXISTS `ELIMINAR_USUARIO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_USUARIO`(
	IN _id_usuario INT
)
BEGIN
    UPDATE usuario SET activo = 0 WHERE id_usuario = _id_usuario;
	UPDATE persona SET activo = 0 WHERE id_persona = _id_usuario;
END ;;
DELIMITER ;


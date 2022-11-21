DROP PROCEDURE IF EXISTS INSERTAR_PERSONA_NATURAL;
DELIMITER $
CREATE PROCEDURE INSERTAR_PERSONA_NATURAL(
	OUT _id_persona_natural INT,
    IN _categoria VARCHAR(50),
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
    INSERT INTO cliente(categoria, activo)
                VALUES(_categoria, 1);
    SET _id_persona_natural = @@LAST_INSERT_ID;
	INSERT INTO personaNatural(id_persona_natural, tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,sexo, telefono,direccion,email)
                VALUES(_id_persona_natural,_tipo_de_documento, _numero_de_documento, _nombre, _apellido, _fecha_de_nacimiento,_sexo,  _telefono, _direccion, _email); 
END$

DROP PROCEDURE IF EXISTS MODIFICAR_PERSONA_NATURAL;
DELIMITER $
CREATE PROCEDURE MODIFICAR_PERSONA_NATURAL(
	IN _id_persona_natural INT,
    IN _categoria VARCHAR(50),
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
    UPDATE cliente SET categoria=_categoria, activo=_activo
        WHERE id_cliente = _id_persona_natural;
	UPDATE personaNatural SET  id_persona_natural=_id_persona_natural,tipo_de_documento=_tipo_de_documento ,numero_de_documento=_numero_de_documento,
                        nombre=_nombre,apellido=_apellido,fecha_de_nacimiento=_fecha_de_nacimiento, sexo=_sexo,
                        telefono=_telefono,direccion=_direccion,email=_email
        WHERE id_persona_natural = _id_persona_natural;
END$

DROP PROCEDURE IF EXISTS INSERTAR_EMPRESA;
DELIMITER $
CREATE PROCEDURE INSERTAR_EMPRESA(
	OUT _id_empresa int,
    IN _categoria VARCHAR(100),
    IN _activo TINYINT,

    IN _RUC VARCHAR(100),
    IN _razon_social VARCHAR(100),
    IN _direccion VARCHAR(200)
)
BEGIN
	INSERT INTO cliente(categoria,activo) VALUES(_categoria,1);
	SET _id_empresa = @@last_insert_id;
    INSERT INTO empresa(id_empresa,RUC,razon_social,direccion) VALUES(_id_empresa,_RUC,_razon_social,_direccion);
END$

DROP PROCEDURE IF EXISTS MODIFICAR_EMPRESA;
DELIMITER $
CREATE PROCEDURE MODIFICAR_EMPRESA(
	IN _id_empresa int,
    IN _categoria VARCHAR(100),
    In _activo TINYINT,

    IN _RUC VARCHAR(100),
    IN _razon_social VARCHAR(100),
    IN _direccion VARCHAR(200)
)
BEGIN
    UPDATE cliente SET categoria=_categoria, activo=_activo
        WHERE id_cliente = _id_empresa;
    UPDATE empresa SET RUC=_RUC,razon_social=_razon_social,direccion=_direccion
        WHERE id_empresa = _id_empresa;
END$

DROP PROCEDURE IF EXISTS ELIMINAR_CLIENTE;
DELIMITER $
CREATE PROCEDURE ELIMINAR_CLIENTE(
	IN _id_cliente INT
)
BEGIN
	UPDATE cliente SET activo = 0 WHERE id_cliente=_id_cliente;
END$

DROP PROCEDURE IF EXISTS LISTAR_CLIENTES;
DELIMITER $
CREATE PROCEDURE LISTAR_CLIENTES()
BEGIN
	SELECT  c.id_cliente, c.categoria,
            e.RUC, e.razon_social, e.direccion as direccionE,
            p.nombre, p.apellido, p.fecha_de_nacimiento, p.telefono, p.direccion as direccionP, p.email, p.tipo_de_documento, p.numero_de_documento, p.sexo
    FROM cliente c LEFT JOIN personaNatural p ON c.id_cliente = p.id_persona_natural 
	LEFT JOIN empresa e ON c.id_cliente = e.id_empresa 
    WHERE c.activo = 1;
END$

DROP PROCEDURE IF EXISTS LISTAR_CLIENTE_X_NOMBRE_DNI_RAZON_RUC;
DELIMITER $
CREATE PROCEDURE LISTAR_CLIENTE_X_NOMBRE_DNI_RAZON_RUC(
	IN _doc_nombre VARCHAR(80)
)
BEGIN
	SELECT  c.id_cliente, c.categoria,
            e.RUC, e.razon_social, e.direccion as direccionE,
            p.nombre, p.apellido, p.fecha_de_nacimiento, p.telefono, p.direccion as direccionP, p.email, p.tipo_de_documento, p.numero_de_documento, p.sexo
    FROM cliente c LEFT JOIN personaNatural p ON c.id_cliente = p.id_persona_natural 
	LEFT JOIN empresa e ON c.id_cliente = e.id_empresa 
	where activo=1
	AND ((CONCAT(p.nombre,' ',p.apellido) LIKE CONCAT('%',_doc_nombre,'%')) 
    OR (p.numero_de_documento LIKE CONCAT('%',_doc_nombre,'%')) 
    OR (e.RUC LIKE CONCAT('%',_doc_nombre,'%'))
    OR (e.razon_social LIKE CONCAT('%',_doc_nombre,'%')));
END$
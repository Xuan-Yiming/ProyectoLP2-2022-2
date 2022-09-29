DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS devolucion;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS reclamo;
DROP TABLE IF EXISTS documentoCredito;
DROP TABLE IF EXISTS documentoDebito;
DROP TABLE IF EXISTS ordenDeCompra;
DROP TABLE IF EXISTS tipoDeCambio;
DROP TABLE IF EXISTS moneda;
DROP TABLE IF EXISTS terminoDePago;
DROP TABLE IF EXISTS empresa;
DROP TABLE IF EXISTS personaNatural;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS supervisorDeAlmacen;
DROP TABLE IF EXISTS almacen;
DROP TABLE IF EXISTS vendedor;
DROP TABLE IF EXISTS administrador;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS persona;

CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    categoria varchar(100),
    activo TINYINT
)ENGINE=InnoDB;

CREATE TABLE empresa(
	id_empresa int PRIMARY KEY,
    RUC varchar(100),
    razon_social varchar(100),
    direccion varchar(200),
	FOREIGN KEY (id_empresa) REFERENCES cliente(id_cliente)
)ENGINE=InnoDB;

CREATE TABLE personaNatural(
    id_persona_natural int PRIMARY KEY,
    tipo_de_documento varchar(50),
	numero_de_documento varchar(50),
    nombre varchar(100),
    apellido varchar(100),
    fecha_de_nacimiento date,
    telefono varchar(15),
    direccion varchar(200),
    email varchar(100),
    FOREIGN KEY (id_persona_natural) REFERENCES cliente(id_cliente)
)ENGINE=InnoDB;

CREATE TABLE persona(
	id_persona INT PRIMARY KEY AUTO_INCREMENT,
    tipo_de_documento varchar(50),
    numero_de_documento varchar(50),
    nombre varchar(100),
    apellido varchar(100),
    fecha_de_nacimiento date,
    telefono varchar(15),
    direccion varchar(200),
    email varchar(100),
    activo TINYINT
)ENGINE=InnoDB;

CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY,
    username varchar(100),
    password varchar(100),
    fecha_de_ingreso date,
    FOREIGN KEY (id_usuario) REFERENCES persona(id_persona)
)ENGINE=InnoDB;

CREATE TABLE almacen(
	id_almacen INT PRIMARY KEY AUTO_INCREMENT,
    #fid_supervisor_de_almacen INT,
	nombre VARCHAR(100),
    direccion VARCHAR(200),
    activo TINYINT
    #FOREIGN KEY (fid_supervisor_de_almacen) REFERENCES supervisorDeAlmacen(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE supervisorDeAlmacen(
	id_usuario INT PRIMARY KEY,
    fid_almacen INT,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (fid_almacen) REFERENCES almacen(id_almacen)
)ENGINE=InnoDB;

CREATE TABLE vendedor(
	id_usuario INT PRIMARY KEY,
	cantidad_ventas int,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE administrador(
	id_usuario INT PRIMARY KEY,
	area varchar(100),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE producto(
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
    fid_almacen INT,
    codigo_lote varchar(50),
    nombre varchar(100),
    precio DOUBLE,
    costo double,
    devuelto BOOLEAN,
    fecha_ingreso date,
    activo TINYINT,
    FOREIGN KEY (fid_almacen) REFERENCES almacen(id_almacen)
)ENGINE=InnoDB;

CREATE TABLE moneda(
	id_moneda INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50),
    abreviatura varchar(10),
    activo TINYINT
)ENGINE=InnoDB;

CREATE TABLE ordenDeCompra(
	id_orden_de_compra INT PRIMARY KEY AUTO_INCREMENT,
    fid_cliente int,
    fid_vendedor int,
    fid_moneda INT,
	monto double,
    direccion_de_entrega varchar(200),
    forma_de_entrega int,
    fecha_de_compra date,
    fecha_de_entrega date,
    pagado boolean,
    activo TINYINT,
    FOREIGN KEY (fid_moneda) REFERENCES moneda(id_moneda),
    FOREIGN KEY (fid_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (fid_vendedor) REFERENCES vendedor(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE pedido(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    fid_producto int,
    fid_orden_de_compra int,
    descuento double,
    activo TINYINT,
    FOREIGN KEY (fid_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (fid_orden_de_compra) REFERENCES ordenDeCompra(id_orden_de_compra)
)ENGINE=InnoDB;

CREATE TABLE reclamo(
	id_reclamo INT PRIMARY KEY AUTO_INCREMENT,
    fid_orden_de_compra int,
    fecha DATE,
    atendido boolean,
    justificacion varchar(500),
    activo TINYINT,
    FOREIGN KEY (fid_orden_de_compra) REFERENCES ordenDeCompra(id_orden_de_compra)
)ENGINE=InnoDB;

CREATE TABLE devolucion(
	id_devolucion INT PRIMARY KEY AUTO_INCREMENT,
    fid_producto INT,
    fid_reclamo INT,
    activo TINYINT,
    FOREIGN KEY (fid_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (fid_reclamo) REFERENCES reclamo(id_reclamo)
)ENGINE=InnoDB;

CREATE TABLE tipoDeCambio(
	id_tipo_de_cambio INT PRIMARY KEY AUTO_INCREMENT,
    fid_moneda int,
    fecha date,
    cambio double,
    activo TINYINT,
    FOREIGN KEY (fid_moneda) REFERENCES moneda(id_moneda)
)ENGINE=InnoDB;

CREATE TABLE terminoDePago(
	id_termino_de_pago INT PRIMARY KEY AUTO_INCREMENT,
    fecha_limite date,
    numero_cuota int,
	monto_cuota double,
    activo TINYINT
)ENGINE=InnoDB;

CREATE TABLE documentoDebito(
	id_documento_debito INT PRIMARY KEY AUTO_INCREMENT,
    fid_orden_de_compra int,
    fid_moneda int,
    fid_termino_de_pago int,
    fecha_creacion date,
    fecha_vencimiento date,
    impuesto double,
    monto double,
    saldo double,
    anulado boolean,
    activo TINYINT,
    FOREIGN KEY (fid_orden_de_compra) REFERENCES ordenDeCompra(id_orden_de_compra),
    FOREIGN KEY (fid_moneda) REFERENCES moneda(id_moneda),
    FOREIGN KEY (fid_termino_de_pago) REFERENCES terminoDePago(id_termino_de_pago)
)ENGINE=InnoDB;

CREATE TABLE documentoCredito(
	id_documento_credito INT PRIMARY KEY AUTO_INCREMENT,
    fid_orden_de_compra int,
    fid_documento_debito int,
    fid_moneda int,
    fecha_creacion date,
    fecha_vencimiento date,
    monto double,
    anulado boolean,
    activo TINYINT,
    FOREIGN KEY (fid_orden_de_compra) REFERENCES ordenDeCompra(id_orden_de_compra),
    FOREIGN KEY (fid_documento_debito) REFERENCES documentoDebito(id_documento_debito),
    FOREIGN KEY (fid_moneda) REFERENCES moneda(id_moneda)
)ENGINE=InnoDB;

DROP PROCEDURE IF EXISTS INSERTAR_EMPRESA;
DROP PROCEDURE IF EXISTS LISTAR_EMPRESAS;
DROP PROCEDURE IF EXISTS MODIFICAR_EMPRESA;
DROP PROCEDURE IF EXISTS ELIMINAR_EMPRESA;

DROP PROCEDURE IF EXISTS INSERTAR_PERSONA_NATURAL;
DROP PROCEDURE IF EXISTS LISTAR_PERSONAS_NATURALES;
DROP PROCEDURE IF EXISTS MODIFICAR_PERSONA_NATURAL;
DROP PROCEDURE IF EXISTS ELIMINAR_PERSONA_NATURAL;

DROP PROCEDURE IF EXISTS INSERTAR_SUPERVISOR_DE_ALMACEN;
DROP PROCEDURE IF EXISTS LISTAR_SUPERVISORES_DE_ALMACEN;
DROP PROCEDURE IF EXISTS MODIFICAR_SUPERVISOR_DE_ALMACEN;
DROP PROCEDURE IF EXISTS ELIMINAR_SUPERVISOR_DE_ALMACEN;

DROP PROCEDURE IF EXISTS INSERTAR_VENDEDOR;
DROP PROCEDURE IF EXISTS LISTAR_VENDEDORES;
DROP PROCEDURE IF EXISTS MODIFICAR_VENDEDOR;
DROP PROCEDURE IF EXISTS ELIMINAR_VENDEDOR;

DROP PROCEDURE IF EXISTS INSERTAR_ADMINISTRADOR;
DROP PROCEDURE IF EXISTS LISTAR_ADMINISTRADORES;
DROP PROCEDURE IF EXISTS MODIFICAR_ADMINISTRADOR;
DROP PROCEDURE IF EXISTS ELIMINAR_ADMINISTRADOR;

DROP PROCEDURE IF EXISTS INSERTAR_ALMACEN;
DROP PROCEDURE IF EXISTS LISTAR_ALMACENES;
DROP PROCEDURE IF EXISTS MODIFICAR_ALMACEN;
DROP PROCEDURE IF EXISTS ELIMINAR_ALMACEN;

DROP PROCEDURE IF EXISTS INSERTAR_PRODUCTO;
DROP PROCEDURE IF EXISTS LISTAR_PRODUCTOS;
DROP PROCEDURE IF EXISTS MODIFICAR_PRODUCTO;
DROP PROCEDURE IF EXISTS ELIMINAR_PRODUCTO;

DROP PROCEDURE IF EXISTS INSERTAR_DEVOLUCION;
DROP PROCEDURE IF EXISTS LISTAR_DEVOLUCIONES;
DROP PROCEDURE IF EXISTS MODIFICAR_DEVOLUCION;
DROP PROCEDURE IF EXISTS ELIMINAR_DEVOLUCION;

DROP PROCEDURE IF EXISTS INSERTAR_RECLAMO;
DROP PROCEDURE IF EXISTS LISTAR_RECLAMOS;
DROP PROCEDURE IF EXISTS MODIFICAR_RECLAMO;
DROP PROCEDURE IF EXISTS ELIMINAR_RECLAMO;

DROP PROCEDURE IF EXISTS INSERTAR_PEDIDO;
DROP PROCEDURE IF EXISTS LISTAR_PEDIDOS;
DROP PROCEDURE IF EXISTS MODIFICAR_PEDIDOS;
DROP PROCEDURE IF EXISTS ELIMINAR_PEDIDOS;

DROP PROCEDURE IF EXISTS INSERTAR_DOCUMENTO_CREDITO;
DROP PROCEDURE IF EXISTS LISTAR_DOCUMENTOS_CREDITO;
DROP PROCEDURE IF EXISTS MODIFICAR_DOCUMENTO_CREDITO;
DROP PROCEDURE IF EXISTS ELIMINAR_DOCUMENTO_CREDITO;

DROP PROCEDURE IF EXISTS INSERTAR_DOCUMENTO_DEBITO;
DROP PROCEDURE IF EXISTS LISTAR_DOCUMENTOS_DEBITO;
DROP PROCEDURE IF EXISTS MODIFICAR_DOCUMENTO_DEBITO;
DROP PROCEDURE IF EXISTS ELIMINAR_DOCUMENTO_DEBITO;

DROP PROCEDURE IF EXISTS INSERTAR_ORDEN_DE_COMPRA;
DROP PROCEDURE IF EXISTS LISTAR_ORDENES_DE_COMPRA;
DROP PROCEDURE IF EXISTS MODIFICAR_ORDEN_DE_COMPRA;
DROP PROCEDURE IF EXISTS ELIMINAR_ORDEN_DE_COMPRA;

DROP PROCEDURE IF EXISTS INSERTAR_MONEDA;
DROP PROCEDURE IF EXISTS LISTAR_MONEDAS;
DROP PROCEDURE IF EXISTS MODIFICAR_MONEDA;
DROP PROCEDURE IF EXISTS ELIMINAR_MONEDA;

DROP PROCEDURE IF EXISTS INSERTAR_TIPO_DE_CAMBIO;
DROP PROCEDURE IF EXISTS LISTAR_TIPOS_DE_CAMBIO;
DROP PROCEDURE IF EXISTS MODIFICAR_TIPO_DE_CAMBIO;
DROP PROCEDURE IF EXISTS ELIMINAR_TIPO_DE_CAMBIO;

DROP PROCEDURE IF EXISTS INSERTAR_TERMINO_DE_PAGO;
DROP PROCEDURE IF EXISTS LISTAR_TERMINOS_DE_PAGO;
DROP PROCEDURE IF EXISTS MODIFICAR_TERMINO_DE_PAGO;
DROP PROCEDURE IF EXISTS ELIMINAR_TERMINO_DE_PAGO;

DELIMITER $
CREATE PROCEDURE INSERTAR_EMPRESA(
	OUT _id_empresa int,
    IN _RUC varchar(100),
    IN _razon_social varchar(100),
    IN _direccion varchar(200),
    IN _categoria varchar(100)
)
BEGIN
	INSERT INTO cliente(categoria,activo) VALUES(_categoria,1);
	SET _id_empresa = @@last_insert_id;
    INSERT INTO empresa(id_empresa,RUC,razon_social,direccion) VALUES(_id_empresa,_RUC,_razon_social,_direccion);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_EMPRESAS()
BEGIN
    SELECT  e.id_empresa, e.RUC, e.razon_social, e.direccion ,c.categoria
    FROM cliente c INNER JOIN empresa e ON c.id_cliente = e.id_empresa 
    WHERE c.activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_EMPRESA(
	IN _id_empresa int,
	IN _RUC varchar(100),
    IN _razon_social varchar(100),
    IN _direccion varchar(200),
    IN _categoria varchar(100),
    IN _activo TINYINT
)
BEGIN
	UPDATE cliente SET categoria = _categoria, activo = _activo WHERE id_cliente = _id_empresa;
    UPDATE empresa SET RUC = _RUC, razon_social = _razon_social, direccion = _direccion WHERE id_empresa=_id_empresa;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_EMPRESA(
	IN _id_empresa INT
)
BEGIN
	UPDATE cliente SET activo = 0 WHERE id_cliente=_id_empresa;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_PERSONA_NATURAL(
	OUT _id_persona_natural int,
    IN _categoria varchar(100),
    IN _tipo_de_documento varchar(50),
	IN _numero_de_documento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	INSERT INTO cliente(categoria,activo) VALUES(_categoria,1);
	SET _id_persona_natural = @@last_insert_id;
    INSERT INTO personaNatural(id_persona_natural,tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email) 
		VALUES (_id_persona_natural,_tipo_de_documento,_numero_de_documento,_nombre,_apellido,_fecha_de_nacimiento,_telefono,_direccion,_email);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_PERSONAS_NATURALES()
BEGIN
	SELECT  p.id_persona_natural, p.nombre, p.apellido, p.fecha_de_nacimiento, p.telefono, p.direccion, p.email, p.tipo_de_documento, p.numero_de_documento ,c.categoria
    FROM cliente c INNER JOIN personaNatural p ON c.id_cliente = p.id_persona_natural WHERE c.activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_PERSONA_NATURAL(
	IN _id_persona_natural int,
    IN _categoria varchar(100),
    IN _tipo_de_documento varchar(50),
	IN _numero_de_documento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100),
    IN _activo TINYINT
)
BEGIN
	UPDATE cliente SET categoria = _categoria, activo = _activo WHERE id_cliente = _id_persona_natural;
    UPDATE personaNatural SET nombre = _nombre, apellido = _apellido, fecha_de_nacimiento = _fecha_de_nacimiento, telefono=_telefono, direccion = _direccion, 
			email= _email, tipo_de_documento = _tipo_de_documento, numero_de_documento = _numero_de_documento
				WHERE id_persona_natural=_id_persona_natural;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_PERSONA_NATURAL(
	IN _id_persona_natural INT
)
BEGIN
	UPDATE cliente SET activo = 0 WHERE id_cliente = _id_persona_natural;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_SUPERVISOR_DE_ALMACEN(
	OUT _id_usuario INT ,
    IN _fid_almacen INT,
    IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento int,
    IN _numero_de_documento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	INSERT INTO persona(tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email,activo) 
			VALUES(_tipo_de_documento,_numero_de_documento,_nombre,_apellido,_fecha_de_nacimiento,_telefono,_direccion,_email,1);
    INSERT INTO usuario(username,password,fecha_de_ingreso) VALUES(_username,_password,_fecha_de_ingreso);
    SET _id_usuario = @@last_insert_id;
    INSERT INTO supervisorDeAlmacen(id_usuario,fid_almacen) VALUES (_id_usuario,_fid_almacen);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_SUPERVISORES_DE_ALMACEN()
BEGIN
	SELECT p.id_persona, p.nombre, p.apellido, p.telefono, p.direccion, p.email, p.fecha_de_nacimiento, p.tipo_de_documento, p.numero_de_documento,
			u.username, u.fecha_de_ingreso, s._fid_almacen
    FROM persona p INNER JOIN usuario u ON p.id_persona = u.id_usuario INNER JOIN supervisorDeAlmacen s ON u.id_usuario = s.id_usuario WHERE p.activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_SUPERVISOR_DE_ALMACEN(
	IN _id_usuario INT ,
    IN _fid_almacen INT,
    IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento int,
    IN _numero_de_documento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100),
    IN _activo TINYINT
)
BEGIN
	UPDATE persona SET tipo_de_documento=_tipo_de_documento,numero_de_documento=_numero_de_documento, nombre=_nombre,apellido=_apellido,
		fecha_de_nacimiento=_fecha_de_nacimiento,telefono=_telefono,direccion=_direccion,email=_email,activo = _activo WHERE id_persona =_id_usuario;
    UPDATE usuario SET username = _username,password=_password,fecha_de_ingreso=_fecha_de_ingreso WHERE id_usuario=_id_usuario;
    UPDATE supervisorDeAlmacen SET fid_almacen=_fid_almacen WHERE id_usuario=_id_usuario;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_SUPERVISOR_DE_ALMACEN(
	IN _id_usuario INT
)
BEGIN
	UPDATE persona SET activo = 0 WHERE id_persona = _id_usuario;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_VENDEDOR(
	OUT _id_usuario INT ,
    IN _cantidad_ventas int,
    IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento int,
    IN _numero_de_documento varchar(50), 
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	INSERT INTO persona(tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email,activo) 
			VALUES(_tipo_de_documento,_numero_de_documento,_nombre,_apellido,_fecha_de_nacimiento,_telefono,_direccion,_email,1);
    INSERT INTO usuario(username,password,fecha_de_ingreso) VALUES(_username,_password,_fecha_de_ingreso);
    SET _id_usuario = @@last_insert_id;
    INSERT INTO vendedor(id_usuario, cantidad_ventas) VALUES (_id_usuario,_cantidad_ventas);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_VENDEDORES()
BEGIN
	SELECT p.id_persona, p.nombre, p.apellido, p.telefono, p.direccion, p.email, p.fecha_de_nacimiento, p.tipo_de_documento, p.numero_de_documento,
			u.username, u.fecha_de_ingreso, v.cantidad_ventas
    FROM persona p INNER JOIN usuario u ON p.id_persona = u.id_usuario INNER JOIN vendedor v ON u.id_usuario = v.id_usuario WHERE p.activo = 1;
END$
CREATE PROCEDURE MODIFICAR_VENDEDOR(
	IN _id_usuario INT ,
    IN _cantidad_ventas int,
    IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento int,
    IN _numero_de_documento varchar(50), 
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100),
    IN _activo TINYINT
)
BEGIN
	UPDATE persona SET tipo_de_documento=_tipo_de_documento,numero_de_documento=_numero_de_documento, nombre=_nombre,apellido=_apellido,
		fecha_de_nacimiento=_fecha_de_nacimiento,telefono=_telefono,direccion=_direccion,email=_email,activo = _activo WHERE id_persona =_id_usuario;
    UPDATE usuario SET username = _username,password=_password,fecha_de_ingreso=_fecha_de_ingreso WHERE id_usuario=_id_usuario;
    UPDATE vendedor SET cantidad_ventas = _cantidad_ventas WHERE id_usuario=_id_usuario;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_VENDEDOR(
	IN _id_usuario INT
)
BEGIN
	UPDATE persona SET activo = 0 WHERE id_persona = _id_usuario;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_ADMINISTRADOR(
	OUT _id_usuario INT ,
    IN _area varchar(100),
	IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento int,
    IN _numero_de_documento varchar(50), 
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	INSERT INTO persona(tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email,activo) 
			VALUES(_tipo_de_documento,_numero_de_documento,_nombre,_apellido,_fecha_de_nacimiento,_telefono,_direccion,_email,1);
    INSERT INTO usuario(username,password,fecha_de_ingreso) VALUES(_username,_password,_fecha_de_ingreso);
    SET _id_usuario = @@last_insert_id;
    INSERT INTO administrador(id_usuario, area) VALUES (_id_usuario,_area);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ADMINISTRADORES()
BEGIN
	SELECT p.id_persona, p.nombre, p.apellido, p.telefono, p.direccion, p.email, p.fecha_de_nacimiento, p.tipo_de_documento, p.numero_de_documento,
			u.username, u.fecha_de_ingreso, a.area
    FROM persona p INNER JOIN usuario u ON p.id_persona = u.id_usuario INNER JOIN administrador a ON u.id_usuario = a.id_usuario WHERE p.activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_ADMINISTRADOR(
	IN _id_usuario INT ,
    IN _area varchar(100),
	IN _username varchar(100),
	IN _password VARCHAR(50),     
	IN _fecha_de_ingreso date,       
	IN _tipo_de_documento int,
    IN _numero_de_documento varchar(50), 
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100),
    IN _activo TINYINT
)
BEGIN
	UPDATE persona SET tipo_de_documento=_tipo_de_documento,numero_de_documento=_numero_de_documento, nombre=_nombre,apellido=_apellido,
		fecha_de_nacimiento=_fecha_de_nacimiento,telefono=_telefono,direccion=_direccion,email=_email,activo = _activo WHERE id_persona =_id_usuario;
    UPDATE usuario SET username = _username,password=_password,fecha_de_ingreso=_fecha_de_ingreso WHERE id_usuario=_id_usuario;
    UPDATE administrador SET area=_area WHERE id_usuario=_id_usuario;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_ADMINISTRADOR(
	IN _id_usuario INT
)
BEGIN
	UPDATE persona SET activo = 0 WHERE id_persona = _id_usuario;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_ALMACEN(
	OUT _id_almacen INT,
    IN _nombre VARCHAR(100),
    IN _direccion VARCHAR(200),
    IN _activo TINYINT
)
BEGIN
	INSERT INTO almacen(id_almacen,nombre,direccion,activo) VALUES (_id_almacen,_nombre,_direccion,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ALMACENES()
BEGIN
	SELECT a.id_almacen, a.nombre, a.direccion
    FROM almacen a WHERE a.activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_ALMACEN(
	IN _id_almacen INT,
    IN _nombre VARCHAR(100),
    IN _direccion VARCHAR(200),
    IN _activo TINYINT
)
BEGIN
	UPDATE almacen SET nombre = _nombre, direccion = _direccion, activo = _activo
    WHERE id_almacen = _id_almacen;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_ALMACEN(
	IN _id_almacen INT
)
BEGIN
	UPDATE almacen SET activo = 0 WHERE id_almacen = _id_almacen;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_PRODUCTO(
	OUT _id_producto INT,
    IN _fid_almacen INT,
    IN _codigo_lote varchar(50),
    IN _nombre VARCHAR(100),
    IN _precio DOUBLE,
    IN _costo DOUBLE,
    IN _devuelto BOOLEAN,
    IN _fecha_ingreso date
)
BEGIN
	SET _id_producto = @@last_insert_id;
    INSERT INTO producto(id_producto,fid_almacen,codigo_lote,nombre,precio,costo,devuelto,fecha_ingreso,activo) 
			VALUES(_id_producto,_fid_almacen,_codigo_lote,_nombre,_precio,_costo,_devuelto,_fecha_ingreso,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_PRODUCTOS()
BEGIN
	SELECT id_producto,fid_almacen,nombre,codigo_lote,precio,costo,devuelto,fecha_ingreso
    FROM producto WHERE activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_PRODUCTO(
    IN _id_producto INT,
    IN _fid_almacen INT,
    IN _codigo_lote varchar(50),
    IN _nombre VARCHAR(100),
    IN _precio DOUBLE,
    IN _costo DOUBLE,
    IN _devuelto BOOLEAN,
    IN _fecha_ingreso date,
    IN _activo TINYINT
)
BEGIN
	UPDATE producto SET fid_almacen = _fid_almacen, codigo_lote=_codigo_lote,nombre = _nombre, precio = _precio, costo = _costo,devuelto =_devuelto,
						fecha_ingreso = _fecha_ingreso, activo = _activo
    WHERE id_producto = _id_producto;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_PRODUCTO(
	IN _id_producto INT
)
BEGIN
	UPDATE producto SET activo = 0 WHERE id_producto = _id_producto;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_DEVOLUCION(
	OUT _id_devolucion INT,
    IN _fid_producto INT,
    IN _fid_reclamo INT
)
BEGIN
	SET _id_devolucion = @@last_insert_id;
    INSERT INTO devolucion(id_devolucion,fid_producto,fid_reclamo,activo) VALUES(_id_devolucion,_fid_producto,_fid_reclamo,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_DEVOLUCIONES()
BEGIN
	SELECT d.id_devolucion,d.fid_producto,p.nombre, d.fid_reclamo 
    FROM devolucion d INNER JOIN producto p ON d.fid_producto = p.id_producto WHERE activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_DEVOLUCION(
	IN _id_devolucion INT,
    IN _fid_producto INT,
    IN _fid_reclamo INT,
    IN _activo TINYINT
)
BEGIN
	UPDATE devolucion SET fid_producto = _fid_producto, fid_reclamo = _fid_reclamo, activo = _activo WHERE id_devolucion = _id_devolucion;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_DEVOLUCION(
	IN _id_devolucion INT
)
BEGIN
	UPDATE devolucion SET activo = 0 WHERE id_devolucion = _id_devolucion;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_RECLAMO(
	OUT _id_reclamo INT ,
    IN _fid_orden_de_compra INT,
    IN _fecha DATE,
    IN _atendido boolean,
    IN _justificacion varchar(500)
)
BEGIN
	SET _id_reclamo = @@last_insert_id;
    INSERT INTO reclamo(id_reclamo,fid_orden_de_compra,fecha,atendido,justificacion,activo) 
			VALUES(_id_reclamo,_fid_orden_de_compra,_fecha,_atendido,_justificacion,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_RECLAMOS()
BEGIN
	SELECT id_reclamo,fid_orden_de_compra,fecha,atendido,justificacion
    FROM reclamo WHERE activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_RECLAMO(
    IN _id_reclamo INT ,
    IN _fid_orden_de_compra int,
    IN _fecha DATE,
    IN _atendido boolean,
    IN _justificacion varchar(500),
    IN _activo tinyint
)
BEGIN
	UPDATE reclamo SET fid_orden_de_compra = _fid_orden_de_compra, fecha = _fecha, atendido = _atendido, justificacion = _justificacion, activo = _activo 
    WHERE id_reclamo = _id_reclamo;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_RECLAMO(
	IN _id_reclamo INT
)
BEGIN
	UPDATE reclamo SET activo = 0 WHERE id_reclamo = _id_reclamo;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_PEDIDO(
	OUT _id_pedido INT ,
    IN _fid_producto INT,
    IN _fid_orden_de_compra INT,
    IN _descuento double
)
BEGIN
	SET _id_pedido = @@last_insert_id;
    INSERT INTO pedido(id_pedido,fid_producto,fid_orden_de_compra,descuento,activo) VALUES(_id_pedido,_fid_producto,_fid_orden_de_compra,_descuento,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_PEDIDOS()
BEGIN
	SELECT id_pedido,fid_producto,fid_orden_de_compra,descuento FROM pedido WHERE activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_PEDIDOS(
	IN _id_pedido INT ,
    IN _fid_producto INT,
    IN _fid_orden_de_compra INT,
    IN _descuento double,
    IN _activo TINYINT
)
BEGIN
	UPDATE pedido SET _fid_producto = _fid_producto, _fid_orden_de_compra = _fid_orden_de_compra, descuento = _descuento,  activo = _activo 
	WHERE id_pedido = _id_pedido;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_PEDIDOS(
	IN _id_pedido INT
)
BEGIN
	UPDATE pedido SET activo = 0 WHERE id_pedido = _id_pedido;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_DOCUMENTO_CREDITO(
	OUT _id_documento_credito INT ,
    IN _fid_orden_de_compra INT,
    IN _fid_documento_debito INT,
    IN _fid_moneda INT,
    IN _fecha_creacion date,
    IN _fecha_vencimiento date,
    IN _monto double,
    IN _anulado boolean
)
BEGIN
	SET _id_documento_credito = @@last_insert_id;
    INSERT INTO documentoCredito(id_documento_credito,fid_orden_de_compra,fid_documento_debito,fid_moneda,fecha_creacion,fecha_vencimiento,monto,anulado,activo) 
    VALUES(_id_documento_credito,_fid_orden_de_compra,_fid_documento_debito,_fid_moneda,fecha_creacion,_fecha_vencimiento,_monto,_anulado,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_DOCUMENTOS_CREDITO()
BEGIN
	SELECT id_documento_credito,fid_orden_de_compra,fid_documento_debito,fid_moneda,fecha_creacion,fecha_vencimiento,monto,anulado,activo 
    FROM documentoCredito WHERE activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_DOCUMENTO_CREDITO(
    IN _id_documento_credito INT ,
    IN _fid_orden_de_compra INT,
    IN _fid_documento_debito INT,
    IN _fid_moneda INT,
    IN _fecha_creacion date,
    IN _fecha_vencimiento date,
    IN _monto double,
    IN _anulado boolean,
    IN _activo tinyint
)
BEGIN
	UPDATE documentoCredito SET fid_orden_de_compra=_fid_orden_de_compra, fid_documento_debito=_fid_documento_debito, fid_moneda=_fid_moneda,
			fecha_creacion = _fecha_creacion, fecha_vencimiento= _fecha_vencimiento, monto = _monto, anulado = _anulado, activo=_activo
    WHERE id_documento_credito = _id_documento_credito;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_DOCUMENTO_CREDITO(
	IN _id_documento_credito INT
)
BEGIN
	UPDATE documentoCredito SET activo = 0 WHERE id_documento_credito = _id_documento_credito;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_DOCUMENTO_DEBITO(
	OUT _id_documento_debito INT ,
    IN _fid_orden_de_compra INT,
    IN _fid_moneda INT,
    IN _fid_termino_de_pago INT,
    IN _fecha_creacion date,
    IN _fecha_vencimiento date,
    IN _impuesto double,
    IN _monto double,
    IN _saldo double,
    IN _anulado boolean
)
BEGIN
	SET _id_documento_debito = @@last_insert_id;
    INSERT INTO documentoDebito(id_documento_debito,fid_orden_de_compra,fid_moneda,fid_termino_de_pago,fecha_creacion,fecha_vencimiento,impuesto,monto,saldo,anulado,activo) 
			VALUES (_id_documento_debito,_fid_orden_de_compra,_fid_moneda,_fid_termino_de_pago,_fecha_creacion,_fecha_vencimiento,_impuesto,_monto,_saldo,_anulado,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_DOCUMENTOS_DEBITO()
BEGIN
	SELECT id_documento_debito,fid_orden_de_compra,fid_moneda,fid_termino_de_pago,fecha_creacion,fecha_vencimiento,impuesto,monto,saldo,anulado 
    FROM documentoDebito WHERE activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_DOCUMENTO_DEBITO(
	IN _id_documento_debito INT ,
    IN _fid_orden_de_compra INT,
    IN _fid_moneda INT,
    IN _fid_termino_de_pago INT,
    IN _fecha_creacion date,
    IN _fecha_vencimiento date,
    IN _impuesto double,
    IN _monto double,
    IN _saldo double,
    IN _anulado boolean,
    IN _activo tinyint
)
BEGIN
	UPDATE documentoDebito SET fid_orden_de_compra= _fid_orden_de_compra,fid_moneda=_fid_moneda, fid_termino_de_pago=_fid_termino_de_pago ,fecha_creacion = _fecha_creacion, 
			fecha_vencimiento = _fecha_vencimiento,impuesto=_impuesto, monto=_monto, saldo=_saldo, anulado=_anulado, activo=_activo
    WHERE id_documento_debito = _id_documento_debito;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_DOCUMENTO_DEBITO(
	IN _id_documento_debito INT
)
BEGIN
	UPDATE documentoDebito SET activo = 0 WHERE id_documento_debito = _id_documento_debito;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_ORDEN_DE_COMPRA(
	OUT _id_orden_de_compra INT ,
    IN _fid_cliente INT,
    IN _fid_vendedor INT,  
    IN _fid_moneda INT,
	IN _monto double,
    IN _direccion_de_entrega varchar(200),
    IN _forma_de_entrega int,
    IN _fecha_de_compra date,
    IN _fecha_de_entrega date,
    IN _pagado boolean
)
BEGIN
	SET _id_orden_de_compra = @@last_insert_id;
    INSERT INTO ordenDeCompra(id_orden_de_compra,fid_cliente,fid_vendedor,fid_moneda ,monto,direccion_de_entrega,forma_de_entrega,fecha_de_compra,fecha_de_entrega,pagado,activo) 
    VALUES(_id_orden_de_compra,_fid_cliente,_fid_vendedor,_fid_moneda,_monto,_direccion_de_entrega,_forma_de_entrega,_fecha_de_compra,_fecha_de_entrega,_pagado,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ORDENES_DE_COMPRA()
BEGIN
	SELECT id_orden_de_compra,fid_cliente,fid_vendedor,fid_moneda ,monto,direccion_de_entrega,forma_de_entrega,fecha_de_compra,fecha_de_entrega,pagado
    FROM ordenDeCompra WHERE activo = 1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_ORDEN_DE_COMPRA(
	IN _id_orden_de_compra INT ,
    IN _fid_cliente INT,
    IN _fid_vendedor INT,  
    IN _fid_moneda INT,
	IN _monto double,
    IN _direccion_de_entrega varchar(200),
    IN _forma_de_entrega int,
    IN _fecha_de_compra date,
    IN _fecha_de_entrega date,
    IN _pagado boolean,
    IN _activo tinyint
)
BEGIN
	UPDATE ordenDeCompra SET fid_cliente=_fid_cliente,fid_vendedor=_fid_vendedor,fid_moneda=_fid_moneda,monto=_monto,direccion_de_entrega=_direccion_de_entrega,
			forma_de_entrega=_forma_de_entrega, fecha_de_compra=_fecha_de_compra, fecha_de_entrega=_fecha_de_entrega, pagado=_pagado,activo=_activo
    WHERE id_orden_de_compra=_id_orden_de_compra;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_ORDEN_DE_COMPRA(
	IN _id_orden_de_compra INT
)
BEGIN
	UPDATE ordenDeCompra SET activo = 0 WHERE id_orden_de_compra=_id_orden_de_compra;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_MONEDA(
	OUT _id_moneda INT ,
    IN _nombre varchar(50),
    IN _abreviatura varchar(10)
)
BEGIN
	SET _id_moneda = @@last_insert_id;
    INSERT INTO moneda(id_moneda,nombre,abreviatura,activo) VALUES(_id_moneda,_nombre,_abreviatura,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_MONEDAS()
BEGIN
	SELECT id_moneda,nombre,abreviatura FROM moneda WHERE activo =1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_MONEDA(
	IN _id_moneda INT ,
    IN _nombre varchar(50),
    IN _abreviatura varchar(10),
    IN _activo tinyint
)
BEGIN
	UPDATE moneda SET nombre=_nombre, abreviatura=_abreviatura, activo=_activo
    WHERE id_moneda = _id_moneda;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_MONEDA(
	IN _id_moneda INT
)
BEGIN
	UPDATE moneda SET activo = 0 WHERE id_moneda=_id_moneda;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_TIPO_DE_CAMBIO(
	OUT _id_tipo_de_cambio INT,
    IN _fid_moneda INT,
    IN _fecha date,
    IN _cambio double
)
BEGIN
	SET _id_tipo_de_cambio = @@last_insert_id;
	INSERT INTO tipoDeCambio(id_tipo_de_cambio,fid_moneda,fecha,cambio,activo) 
		VALUES(_id_tipo_de_cambio,_fid_moneda,_fecha,_cambio,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_TIPOS_DE_CAMBIO()
BEGIN
	SELECT id_tipo_de_cambio,fid_moneda,fecha,cambio 
    FROM tipoDeCambio WHERE activo=1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_TIPO_DE_CAMBIO(
	IN _id_tipo_de_cambio INT,
    IN _fid_moneda INT,
    IN _fecha date,
    IN _cambio double,
    IN _activo tinyint
)
BEGIN
	UPDATE tipoDeCambio SET fid_moneda=_fid_moneda,fecha=_fecha,cambio=_cambio, activo=_activo
    WHERE id_tipo_de_cambio=_id_tipo_de_cambio;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_TIPO_DE_CAMBIO(
	IN _id_tipo_de_cambio INT
)
BEGIN
	UPDATE tipoDeCambio SET activo = 0 WHERE id_tipo_de_cambio=_id_tipo_de_cambio;
END$

#INSERTAR_TERMINO_DE_PAGO
DELIMITER $
CREATE PROCEDURE INSERTAR_TERMINO_DE_PAGO(
	OUT _id_termino_de_pago INT,
    IN _fecha_limite DATE,
    IN _numero_cuota INT,
    IN _monto_cuota double
)
BEGIN
	SET _id_termino_de_pago = @@last_insert_id;
	INSERT INTO terminoDePago(id_termino_de_pago,fecha_limite,numero_cuota,monto_cuota,activo) 
		VALUES(_id_termino_de_pago,_fecha_limite,_numero_cuota,_monto_cuota,1);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_TERMINOS_DE_PAGO()
BEGIN
	SELECT id_termino_de_pago,fecha_limite,numero_cuota,monto_cuota
    FROM terminoDePago WHERE activo=1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_TERMINO_DE_PAGO(
	IN _id_termino_de_pago INT,
    IN _fecha_limite DATE,
    IN _numero_cuota INT,
    IN _monto_cuota double,
    IN _activo tinyint
)
BEGIN
	UPDATE terminoDePago SET fecha_limite=_fecha_limite,numero_cuota=_numero_cuota,monto_cuota=_monto_cuota,activo=_activo
    WHERE id_termino_de_pago=_id_termino_de_pago;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_TERMINO_DE_PAGO(
	IN _id_termino_de_pago INT
)
BEGIN
	UPDATE terminoDePago SET activo = 0 WHERE id_termino_de_pago=_id_termino_de_pago;
END$
DROP TABLE IF EXISTS almacen;
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS devolucion;
DROP TABLE IF EXISTS reclamo;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS documentoCredito;
DROP TABLE IF EXISTS documentoDebito;
DROP TABLE IF EXISTS ordenDeCompra;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS empresa;
DROP TABLE IF EXISTS personaNatural;
DROP TABLE IF EXISTS moneda;
DROP TABLE IF EXISTS tipoDeCambio;
DROP TABLE IF EXISTS terminoDePago;
DROP TABLE IF EXISTS persona;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS supervisorDeAlmacen;
DROP TABLE IF EXISTS vendedor;
DROP TABLE IF EXISTS administrador;


CREATE TABLE persona(
	id_persona INT PRIMARY KEY AUTO_INCREMENT,
    tipoDeDocumento varchar(50),
    numDeDocumento varchar(50),
    nombre varchar(100),
    apellido varchar(100),
    fechaDeNacimiento date,
    telefono varchar(15),
    direccion varchar(200),
    email varchar(100)
)ENGINE=lasjoyasdb;

CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY,
    password Varchar(100),
    fechaIngreso date,
    FOREIGN KEY (id_usuario) REFERENCES persona(id_persona)
)ENGINE=lasjoyasdb;

CREATE TABLE supervisorDeAlmacen(
	id_usuario INT PRIMARY KEY,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
)ENGINE=lasjoyasdb;
CREATE TABLE vendedor(
	id_usuario INT PRIMARY KEY,
	cantidad_ventas int,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
)ENGINE=lasjoyasdb;
CREATE TABLE administrador(
	id_usuario INT PRIMARY KEY,
	area varchar(100),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
)ENGINE=lasjoyasdb;


CREATE TABLE almacen(
	ID_ALMACEN INT PRIMARY KEY AUTO_INCREMENT,
	NOMBRE VARCHAR(100),
    DIRECCION VARCHAR(200),
    id_supervisorDeAlmacen INT,
    FOREIGN KEY (id_supervisorDeAlmacen) REFERENCES supervisorDeAlmacen(id_usuario)
)ENGINE=lasjoyasdb;
CREATE TABLE producto(
	ID_PRODUCTO INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(100),
    PRECIO DOUBLE,
    UNIDAD INT,
    STOCKMINIMO int,
    DEVUELTO BOOLEAN
)ENGINE=lasjoyasdb;

CREATE TABLE stock(
	ID_STOCK INT,
	FOREIGN KEY (id_stock) REFERENCES almacen(id_almacen),
    CANTIDAD INT,
    ID_PRODUCTO INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
)ENGINE=lasjoyasdb;

CREATE TABLE reclamo(
	ID_RECLAMO INT PRIMARY KEY AUTO_INCREMENT,
    FECHA DATE,
    ATENDIDO boolean,
    JUSTIFICACION varchar(500),
    id_ordenDeCompra int,
    FOREIGN KEY (id_ordenDeCompra) REFERENCES ordenDeCompra(id_ordenDeCompra)
)ENGINE=lasjoyasdb;

CREATE TABLE devolucion(
	ID_DEVOLUCION INT PRIMARY KEY AUTO_INCREMENT,
    CANTIDAD INT,
    FECHA DATE,
    unidad INT,
    id_producto INT,
    id_reclamo INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_reclamo) REFERENCES reclamo(id_reclamo)
)ENGINE=lasjoyasdb;


CREATE TABLE moneda(
	id_moneda INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50),
    abreviatura varchar(10)
)ENGINE=lasjoyasdb;

CREATE TABLE tipoDeCambio(
	id_tipoDeCambio INT,
    FOREIGN KEY (id_tipoDeCambio) REFERENCES moneda(id_moneda),
    fecha date,
    cambio double
    
)ENGINE=lasjoyasdb;
CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    categoria varchar(100)
    
)ENGINE=lasjoyasdb;

CREATE TABLE ordenDeCompra(
	id_orden_de_compra INT PRIMARY KEY AUTO_INCREMENT,
	monto double,
    id_moneda INT,
    FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda),
    direccionDeEntrega varchar(200),
    formaDeEntrega int,
    fechaDeCompra date,
    fechaDeEntrega date,
    pagado boolean,
    id_cliente int,
    id_vendedor int,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_usuario)
)ENGINE=lasjoyasdb;

CREATE TABLE pedido(
	ID_PEDIDO INT PRIMARY KEY AUTO_INCREMENT,
	CANTIDAD INT,
    DESCUENTO double,
    UNIDAD TINYINT,
    id_producto int,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    id_orden_de_compra int, 
    FOREIGN KEY (id_orden_de_compra) REFERENCES ordenDeCompra(id_orden_de_compra)
)ENGINE=lasjoyasdb;



CREATE TABLE terminoDePago(
	id_terminoDePago INT PRIMARY KEY AUTO_INCREMENT,
    fechaLimite date,
    numeroCuota int,
	montoCuota double
)ENGINE=lasjoyasdb;
CREATE TABLE documentoDebito(
	id_documentoDebito INT PRIMARY KEY AUTO_INCREMENT,
    FECHACREACION date,
    FECHAVENCIMIENTO date,
    IMPUESTO double,
    MONTO double,
    id_moneda int,
    FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda),
    SALDO double,
    ANULADO boolean,
    id_terminoDePago int,
    FOREIGN KEY (id_terminoDePago) REFERENCES terminoDePago(id_terminoDePago)
)ENGINE=lasjoyasdb;

CREATE TABLE documentoCredito(
	id_documentoCredito INT PRIMARY KEY AUTO_INCREMENT,
    FECHACREACION date,
    MONTO double,
    _ANULADO boolean,
    id_ordenDeCompra int,
    FOREIGN KEY (id_ordenDeCompra) REFERENCES ordenDeCompra(id_ordenDeCompra),
    id_documentDebito int,
    FOREIGN KEY (id_documentDebito) REFERENCES documentoDebito(id_documentDebito)
)ENGINE=lasjoyasdb;

CREATE TABLE empresa(
	RUC int,
    razonSocial varchar(100),
    direccion varchar(200),
    categoria varchar(100),
    id_empresa int,
	FOREIGN KEY (id_empresa) REFERENCES cliente(id_cliente)
)ENGINE=lasjoyasdb;
CREATE TABLE personaNatural(
    id_persona_natural int,
    FOREIGN KEY (id_persona_natural) REFERENCES cliente(id_cliente),
    categoria varchar(100),
	numDeDocumento varchar(50),
    nombre varchar(100),
    apellido varchar(100),
    fechaDeNacimiento date,
    telefono varchar(15),
    direccion varchar(200),
    email varchar(100)

)ENGINE=lasjoyasdb;


DROP PROCEDURE IF EXISTS INSERTAR_ALMACEN;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_ALMACENES;
DROP PROCEDURE IF EXISTS MODIFICAR_ALMACEN;
DROP PROCEDURE IF EXISTS ELIMINAR_ALMACEN;

DROP PROCEDURE IF EXISTS INSERTAR_STOCK;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_STOCKS;
DROP PROCEDURE IF EXISTS MODIFICAR_STOCK;
DROP PROCEDURE IF EXISTS ELIMINAR_STOCK;

DROP PROCEDURE IF EXISTS INSERTAR_PRODUCTO;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_PRODUCTOS;
DROP PROCEDURE IF EXISTS MODIFICAR_PRODUCTO;
DROP PROCEDURE IF EXISTS ELIMINAR_PRODUCTO;

DROP PROCEDURE IF EXISTS INSERTAR_DEVOLUCION;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_DEVOLUCIONES;
DROP PROCEDURE IF EXISTS MODIFICAR_DEVOLUCION;
DROP PROCEDURE IF EXISTS ELIMINAR_DEVOLUCION;

DROP PROCEDURE IF EXISTS INSERTAR_RECLAMO;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_RECLAMOS;
DROP PROCEDURE IF EXISTS MODIFICAR_RECLAMO;
DROP PROCEDURE IF EXISTS ELIMINAR_RECLAMO;

DROP PROCEDURE IF EXISTS INSERTAR_PEDIDO;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_PEDIDOS;
DROP PROCEDURE IF EXISTS MODIFICAR_PEDIDOS;
DROP PROCEDURE IF EXISTS ELIMINAR_PEDIDOS;

DROP PROCEDURE IF EXISTS INSERTAR_DOCUMENTOCREDITO;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_DOCUMENTOSCREDITO;
DROP PROCEDURE IF EXISTS MODIFICAR_DOCUMENTOCREDITO;
DROP PROCEDURE IF EXISTS ELIMINAR_DOCUMENTOCREDITO;

DROP PROCEDURE IF EXISTS INSERTAR_DOCUMENTODEBITO;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_DOCUMENTOSDEBITO;
DROP PROCEDURE IF EXISTS MODIFICAR_DOCUMENTODEBITO;
DROP PROCEDURE IF EXISTS ELIMINAR_DOCUMENTODEBITO;

DROP PROCEDURE IF EXISTS INSERTAR_ORDENDECOMPRA;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_ORDENESDECOMPRA;
DROP PROCEDURE IF EXISTS MODIFICAR_ORDENDECOMPRA;
DROP PROCEDURE IF EXISTS ELIMINAR_ORDENDECOMPRA;

DROP PROCEDURE IF EXISTS INSERTAR_CLIENTE;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_CLIENTES;
DROP PROCEDURE IF EXISTS MODIFICAR_CLIENTE;
DROP PROCEDURE IF EXISTS ELIMINAR_CLIENTE;

DROP PROCEDURE IF EXISTS INSERTAR_EMPRESA;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_EMPRESAS;
DROP PROCEDURE IF EXISTS MODIFICAR_EMPRESA;
DROP PROCEDURE IF EXISTS ELIMINAR_EMPRESA;

DROP PROCEDURE IF EXISTS INSERTAR_PERSONANATURAL;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_PERSONASNATURALES;
DROP PROCEDURE IF EXISTS MODIFICAR_PERSONANATURAL;
DROP PROCEDURE IF EXISTS ELIMINAR_PERSONANATURAL;

DROP PROCEDURE IF EXISTS INSERTAR_MONEDA;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_MONEDAS;
DROP PROCEDURE IF EXISTS MODIFICAR_MONEDAS;
DROP PROCEDURE IF EXISTS ELIMINAR_MONEDAS;

DROP PROCEDURE IF EXISTS INSERTAR_TIPODECAMBIO;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_TIPOSDECAMBIO;
DROP PROCEDURE IF EXISTS MODIFICAR_TIPODECAMBIO;
DROP PROCEDURE IF EXISTS ELIMINAR_TIPODECAMBIO;

DROP PROCEDURE IF EXISTS INSERTAR_TERMINODEPAGO;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_TERMINOSDEPAGO;
DROP PROCEDURE IF EXISTS MODIFICAR_TERMINODEPAGO;
DROP PROCEDURE IF EXISTS ELIMINAR_TERMINODEPAGO;

DROP PROCEDURE IF EXISTS INSERTAR_PERSONA;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_PERSONAS;
DROP PROCEDURE IF EXISTS MODIFICAR_PERSONA;
DROP PROCEDURE IF EXISTS ELIMINAR_PERSONA;

DROP PROCEDURE IF EXISTS INSERTAR_USUARIO;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_USUARIOS;
DROP PROCEDURE IF EXISTS MODIFICAR_USUARIO;
DROP PROCEDURE IF EXISTS ELIMINAR_USUARIO;

DROP PROCEDURE IF EXISTS INSERTAR_SUPERVISORDEALMACEN;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_SUPERVISORESDEALMACEN;
DROP PROCEDURE IF EXISTS MODIFICAR_SUPERVISORDEALMACEN;
DROP PROCEDURE IF EXISTS ELIMINAR_SUPERVISORDEALMACEN;

DROP PROCEDURE IF EXISTS INSERTAR_VENDEDOR;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_VENDEDORES;
DROP PROCEDURE IF EXISTS MODIFICAR_VENDEDOR;
DROP PROCEDURE IF EXISTS ELIMINAR_VENDEDOR;

DROP PROCEDURE IF EXISTS INSERTAR_ADMINISTRADOR;
DROP PROCEDURE IF EXISTS LISTAR_TODOS_ADMINISTRADORES;
DROP PROCEDURE IF EXISTS MODIFICAR_ADMINISTRADOR;
DROP PROCEDURE IF EXISTS ELIMINAR_ADMINISTRADOR;

DELIMITER $

CREATE PROCEDURE INSERTAR_ALMACEN(
	IN _ID_ALMACEN INT,
    IN _NOMBRE VARCHAR(100),
    IN _DIRECCION VARCHAR(200)
)
BEGIN
	INSERT INTO almacen(ID_ALMACEN,NOMBRE,DIRECCION) VALUES (_ID_ALMACEN,_NOMBRE,_DIRECCION);
END$

CREATE PROCEDURE LISTAR_ALMACENES()
BEGIN
	SELECT a.ID_ALMACEN, a.NOMBRE, a.DIRECCION
    FROM almacen a;
END$
CREATE PROCEDURE MODIFICAR_ALMACEN(
	IN _ID_ALMACEN INT,
    IN _NOMBRE VARCHAR(100),
    IN _DIRECCION VARCHAR(200)
)
BEGIN
	UPDATE almacen 
    SET ID_ALMACEN = _ID_ALMACEN, NOMBRE = _NOMBRE, DIRECCION = _DIRECCION
    WHERE ID_ALMACEN = _ID_ALMACEN;

END$
CREATE PROCEDURE ELIMINAR_ALMACEN(
	IN _ID_ALMACEN INT
)
BEGIN
	UPDATE almacen SET ID_ALMACEN = 0 WHERE ID_ALMACEN = _ID_ALMACEN;
END$



CREATE PROCEDURE INSERTAR_STOCK(
	IN _ID_STOCK INT,
	IN _CANTIDAD INT,
    IN _ID_PRODUCTO INT
)
BEGIN
	INSERT INTO stock(ID_STOCK,CANTIDAD,ID_PRODUCTO) VALUES (_ID_STOCK,_CANTIDAD,_ID_PRODUCTO);
END$
CREATE PROCEDURE LISTAR_STOCKS()
BEGIN
	SELECT s.ID_STOCK, s.CANTIDAD, p.ID_PRODUCTO
    FROM stock s;
END$
CREATE PROCEDURE MODIFICAR_STOCK(
	IN _ID_STOCK INT,
	IN _CANTIDAD INT,
    IN _ID_PRODUCTO INT
)
BEGIN
	UPDATE stock SET ID_STOCK = _ID_STOCK, CANTIDAD = _CANTIDAD, ID_PRODUCTO = _ID_PRODUCTO;
END$
CREATE PROCEDURE ELIMINAR_STOCK(
	IN _ID_STOCK INT
)
BEGIN
	UPDATE stock SET ID_STOCK = 0 WHERE ID_STOCK = _ID_STOCK;
END$

CREATE PROCEDURE INSERTAR_PRODUCTO(
	OUT _ID_PRODUCTO INT,
    IN _NOMBRE VARCHAR(100),
    IN _PRECIO DOUBLE,
    IN _UNIDAD INT,
    IN _STOCKMINIMO int,
    IN _DEVUELTO BOOLEAN
)
BEGIN
	SET _ID_PRODUCTO = @@last_insert_id;
    INSERT INTO producto(ID_PRODUCTO,NOMBRE,PRECIO,UNIDAD,STOCKMINIMO,DEVUELTO) VALUES(_ID_PRODUCTO,_NOMBRE,_PRECIO,_UNIDAD,_STOCKMINIMO,_DEVUELTO);
END$
CREATE PROCEDURE LISTAR_PRODUCTOS()
BEGIN
	SELECT ID_PRODUCTO,NOMBRE,PRECIO,UNIDAD,STOCKMINIMO,DEVUELTO 
    FROM producto p;
END$
CREATE PROCEDURE MODIFICAR_PRODUCTO(
	IN _ID_PRODUCTO INT,
    IN _NOMBRE VARCHAR(100),
    IN _PRECIO DOUBLE,
    IN _UNIDAD INT,
    IN _STOCKMINIMO int,
    IN _DEVUELTO BOOLEAN
)
BEGIN
	UPDATE producto 
    SET ID_PRODUCTO = _ID_PRODUCTO, 
    NOMBRE = _NOMBRE, 
    PRECIO = _PRECIO, 
    UNIDAD = _UNIDAD ,
    STOCKMINIMO=_STOCKMINIMO,
    DEVUELTO=_DEVUELTO
    WHERE ID_PRODUCTO = _ID_PRODUCTO;
    
END$
CREATE PROCEDURE ELIMINAR_PRODUCTO(
	IN _ID_PRODUCTO INT
)
BEGIN
	UPDATE producto SET ID_PRODUCTO = 0 WHERE ID_PRODUCTO = _ID_PRODUCTO;
END$


CREATE PROCEDURE INSERTAR_DEVOLUCION(
	OUT _ID_DEVOLUCION INT,
    IN _CANTIDAD INT,
    IN _FECHA DATE
)
BEGIN
	SET _ID_DEVOLUCION = @@last_insert_id;
    INSERT INTO empleado(ID_DEVOLUCION,CANTIDAD,FECHA) VALUES(_ID_DEVOLUCION,_CANTIDAD,_FECHA);
END$
CREATE PROCEDURE LISTAR_DEVOLUCIONES()
BEGIN
	SELECT ID_DEVOLUCION,CANTIDAD,FECHA
    FROM devolucion;
END$
CREATE PROCEDURE MODIFICAR_DEVOLUCION(
	IN _ID_DEVOLUCION INT,
    IN _CANTIDAD INT,
    IN _FECHA DATE
)
BEGIN
	UPDATE devolucion SET ID_DEVOLUCION = _ID_DEVOLUCION, CANTIDAD = _CANTIDAD, FECHA = _FECHA WHERE ID_DEVOLUCION = _ID_DEVOLUCION;
END$
CREATE PROCEDURE ELIMINAR_DEVOLUCION(
	IN _ID_DEVOLUCION INT
)
BEGIN
	UPDATE devolucion SET ID_DEVOLUCION = 0 WHERE ID_DEVOLUCION = _ID_DEVOLUCION;
END$


CREATE PROCEDURE INSERTAR_RECLAMO(
	OUT _ID_RECLAMO INT ,
    IN _FECHA DATE,
    IN _ATENDIDO boolean,
    IN _JUSTIFICACION varchar(500),
    IN _id_ordenDeCompra int
)
BEGIN
	SET _ID_RECLAMO = @@last_insert_id;
    INSERT INTO reclamo(ID_RECLAMO,FECHA,ATENDIDO,JUSTIFICACION) VALUES(_ID_RECLAMO,_FECHA,_ATENDIDO,_JUSTIFICACION);
END$
CREATE PROCEDURE LISTAR_RECLAMOS()
BEGIN
	SELECT ID_RECLAMO,FECHA,ATENDIDO,JUSTIFICACION
    FROM reclamo;
END$
CREATE PROCEDURE MODIFICAR_RECLAMO(
	IN _ID_RECLAMO INT ,
    IN _FECHA DATE,
    IN _ATENDIDO boolean,
    IN _JUSTIFICACION varchar(500),
    IN _id_ordenDeCompra int
)
BEGIN
	UPDATE reclamo SET ID_RECLAMO = _ID_RECLAMO,FECHA = _FECHA, ATENDIDO = _ATENDIDO, JUSTIFICACION = _JUSTIFICACION 
    WHERE ID_RECLAMO = _ID_RECLAMO;
END$
CREATE PROCEDURE ELIMINAR_RECLAMO(
	IN _ID_RECLAMO INT
)
BEGIN
	UPDATE reclamo SET _ID_RECLAMO = 0 WHERE ID_RECLAMO = _ID_RECLAMO;
END$


CREATE PROCEDURE INSERTAR_PEDIDO(
	OUT _ID_PEDIDO INT ,
	IN _CANTIDAD INT,
    IN _DESCUENTO double,
    IN _UNIDAD TINYINT
)
BEGIN
	SET _ID_PEDIDO = @@last_insert_id;
    INSERT INTO pedido(ID_PEDIDO,CANTIDAD,DESCUENTO,UNIDAD) VALUES(_ID_PEDIDO,_CANTIDAD,_DESCUENTO,_UNIDAD);
END$
CREATE PROCEDURE LISTAR_PEDIDOS()
BEGIN
	SELECT ID_PEDIDO,CANTIDAD,DESCUENTO,UNIDAD  FROM pedido ;
    END$
CREATE PROCEDURE MODIFICAR_PEDIDOS(
	IN _ID_PEDIDO INT,
	IN _CANTIDAD INT,
    IN _DESCUENTO double,
    IN _UNIDAD TINYINT
)
BEGIN
	UPDATE pedido SET CANTIDAD = _CANTIDAD, DESCUENTO = _DESCUENTO, UNIDAD = _UNIDAD WHERE ID_PEDIDO = _ID_PEDIDO;
END$
CREATE PROCEDURE ELIMINAR_PEDIDOS(
	IN _id_empleado INT
)
BEGIN
	UPDATE empleado SET activo = 0 WHERE id_empleado = _id_empleado;
END$



CREATE PROCEDURE insertar_documento_credito(
	OUT _id_documentoCredito INT ,
    IN _FECHACREACION date,
    IN _MONTO double,
    IN _ANULADO boolean
)
BEGIN
	SET _id_documentoCredito = @@last_insert_id;
    INSERT INTO documentoCredito(id_documentoCredito,FECHACREACION,MONTO_ANULADO) VALUES(_id_documentoCredito,_FECHACREACION,_MONTO_ANULADO);
END$
CREATE PROCEDURE LISTAR_TODOS_DOCUMENTOSCREDITO()
BEGIN
	SELECT id_documentoCredito,FECHACREACION,MONTO_ANULADO 
    FROM documentoCredito ;
END$
CREATE PROCEDURE modificar_documento_credito(
	OUT _id_documentoCredito INT ,
    IN _FECHACREACION date,
    IN _MONTO double,
    IN _ANULADO boolean
)
BEGIN
	UPDATE documentoCredito SET id_documentoCredito = _id_documentoCredito, 
    _FECHACREACION = FECHACREACION, MONTO = _MONTO WHERE ANULADO = _ANULADO;
END$
CREATE PROCEDURE eliminar_documento_credito(
	IN _id_documentoCredito INT
)
BEGIN
	UPDATE documentoCredito SET id_documentoCredito = 0 WHERE id_documentoCredito = _id_documentoCredito;
END$

CREATE TABLE documentoDebito(
	id_documentoDebito INT PRIMARY KEY AUTO_INCREMENT,
    FECHACREACION date,
    FECHAVENCIMIENTO date,
    IMPUESTO double,
    MONTO double,
    id_moneda int,
    FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda),
    SALDO double,
    ANULADO boolean,
    id_terminoDePago int,
    FOREIGN KEY (id_terminoDePago) REFERENCES terminoDePago(id_terminoDePago)
)ENGINE=lasjoyasdb;
CREATE PROCEDURE insertar_documento_debito(
	OUT _id_documentoDebito INT ,
    IN _FECHACREACION date,
    IN _FECHAVENCIMIENTO date,
    IN _IMPUESTO double,
    IN _MONTO double,
    IN _SALDO double,
    IN _ANULADO boolean,
)
BEGIN
	SET _id_documentoDebito = @@last_insert_id;
    INSERT INTO documentoDebito(id_documentoDebito,FECHACREACION,FECHAVENCIMIENTO,IMPUESTO,MONTO,SALDO,ANULADO) VALUES(_id_documentoDebito,_FECHACREACION,_FECHAVENCIMIENTO,
    _IMPUESTO,_MONTO,_SALDO,_ANULADO);
END$
CREATE PROCEDURE listar_documentos_debito()
BEGIN
	SELECT id_documentoDebito,FECHACREACION,FECHAVENCIMIENTO,IMPUESTO,MONTO,SALDO,ANULADO FROM documentoDebito ;
END$
CREATE PROCEDURE modificar_documento_debito(
	IN _id_empleado INT,
    IN _fid_area INT,
    IN _DNI VARCHAR(8),
	IN _nombre VARCHAR(40),
    IN _apellido_paterno VARCHAR(40),
    IN _genero CHAR,
    IN _fecha_nacimiento DATE,
    IN _cargo VARCHAR(40),
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	UPDATE documentoDebito SET id_documentoDebito = _id_documentoDebito, FECHACREACION = _FECHACREACION, 
    FECHAVENCIMIENTO = _FECHAVENCIMIENTO,IMPUESTO=_IMPUESTO, MONTO=_MONTO, SALDO=_SALDO, ANULADO=_ANULADO
    WHERE id_empleado = _id_empleado;
END$
CREATE PROCEDURE eliminar_documento_debito(
	IN _id_documentoDebito INT
)
BEGIN
	UPDATE documentoDebito SET id_documentoDebito = 0 WHERE id_documentoDebito = _id_documentoDebito;
END$


CREATE PROCEDURE insertar_orden_de_compra(
	OUT _id_orden_de_compra INT ,
	IN _monto double,
    IN _direccionDeEntrega varchar(200),
    IN _formaDeEntrega int,
    IN _fechaDeCompra date,
    IN _fechaDeEntrega date,
    IN _pagado boolean
)
BEGIN
	SET _id_orden_de_compra = @@last_insert_id;
    INSERT INTO ordenDeCompra(id_orden_de_compra,monto,direccionDeEntrega,formaDeEntrega,fechaDeCompra,fechaDeEntrega,pagado) 
    VALUES(_id_orden_de_compra,_monto,_direccionDeEntrega,_formaDeEntrega,_fechaDeCompra,_fechaDeEntrega,_pagado);
END$
CREATE PROCEDURE LISTAR_TODOS_ORDENESDECOMPRA()
BEGIN
	SELECT id_orden_de_compra,monto,direccionDeEntrega,formaDeEntrega,fechaDeCompra,fechaDeEntrega,pagado
    FROM ordenDeCompra ;
END$
CREATE PROCEDURE modificar_orden_de_compra(
	IN _id_empleado INT,
    IN _fid_area INT,
    IN _DNI VARCHAR(8),
	IN _nombre VARCHAR(40),
    IN _apellido_paterno VARCHAR(40),
    IN _genero CHAR,
    IN _fecha_nacimiento DATE,
    IN _cargo VARCHAR(40),
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	UPDATE ordenDeCompra SET id_orden_de_compra=_id_orden_de_compra,
    monto=_monto,direccionDeEntrega=_direccionDeEntrega,
    formaDeEntrega=_formaDeEntrega,fechaDeCompra=_fechaDeCompra,fechaDeEntrega=_fechaDeEntrega,pagado=_pagado
    WHERE id_orden_de_compra = _id_orden_de_compra;
END$
CREATE PROCEDURE eliminar_orden_de_compra(
	IN _id_empleado INT
)
BEGIN
	UPDATE ordenDeCompra SET id_orden_de_compra = 0 WHERE id_empleado = _id_empleado;
END$


CREATE PROCEDURE INSERTAR_CLIENTE(
	OUT _id_cliente INT ,
    IN _categoria varchar(100)
    
)
BEGIN
	SET _id_cliente = @@last_insert_id;
    INSERT INTO empleado(id_cliente,categoria) VALUES(_id_cliente,_categoria);
END$
CREATE PROCEDURE LISTAR_CLIENTES()
BEGIN
	SELECT id_cliente,categoria 
    FROM cliente;
END$
CREATE PROCEDURE MODIFICAR_CLIENTE(
	IN _id_cliente INT ,
    IN _categoria varchar(100)
    
)
BEGIN
	UPDATE cliente SET id_cliente = _id_cliente, categoria = _categoria WHERE id_cliente = _id_cliente;
END$
CREATE PROCEDURE ELIMINAR_CLIENTE(
	IN _id_empleado INT
)
BEGIN
	UPDATE cliente SET _id_cliente = 0 WHERE id_cliente = _id_cliente;
END$


CREATE PROCEDURE INSERTAR_EMPRESA(
	IN _RUC int,
    IN _razonSocial varchar(100),
    IN _direccion varchar(200),
    IN _categoria varchar(100),
    OUT _id_cliente int
)
BEGIN
	SET _id_cliente = @@last_insert_id;
    INSERT INTO empresa(RUC,razonSocial,direccion,categoria,id_cliente) VALUES(_RUC,_razonSocial,_direccion,_categoria,_id_cliente);
END$
CREATE PROCEDURE LISTAR_EMPRESAS()
BEGIN
	SELECT RUC,razonSocial,direccion,categoria,id_cliente
    FROM empresa ;
END$
CREATE PROCEDURE MODIFICAR_EMPRESA(
	IN _RUC int,
    IN _razonSocial varchar(100),
    IN _direccion varchar(200),
    IN _categoria varchar(100),
    IN _id_cliente int
)
BEGIN
	UPDATE empresa SET RUC = _RUC, razonSocial = _razonSocial, direccion = _direccion,
    categoria=_categoria, id_cliente=_id_cliente
    WHERE id_cliente=_id_cliente;
END$
CREATE PROCEDURE ELIMINAR_EMPRESA(
	IN _id_empleado INT
)
BEGIN
	UPDATE empresa SET id_cliente = 0 WHERE id_cliente=_id_cliente;
END$

CREATE PROCEDURE INSERTAR_PERSONA_NATURAL(
	IN _id_persona_natural int,
    IN _categoria varchar(100),
	IN _numDeDocumento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fechaDeNacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	INSERT INTO personaNatural(id_persona_natural,categoria,numDeDocumento,nombre,apellido,fechaDeNacimiento,telefono,direccion,email) 
    VALUES (_id_persona_natural,_categoria,_numDeDocumento,_nombre,_apellido,_fechaDeNacimiento,_telefono,_direccion,_email);
END$
CREATE PROCEDURE LISTAR_TODOS_PERSONASNATURALES()
BEGIN
	SELECT id_persona_natural,categoria,numDeDocumento,nombre,apellido,fechaDeNacimiento,telefono,direccion,email
    FROM personaNatural;
END$
CREATE PROCEDURE MODIFICAR_PERSONA_NATURAL(
	IN _id_empleado INT,
    IN _fid_area INT,
    IN _DNI VARCHAR(8),
	IN _nombre VARCHAR(40),
    IN _apellido_paterno VARCHAR(40),
    IN _genero CHAR,
    IN _fecha_nacimiento DATE,
    IN _cargo VARCHAR(40),
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	UPDATE personaNatural SET id_persona_natural=_id_persona_natural,categoria=_categoria
    ,numDeDocumento=_numDeDocumento,nombre=_nombre,apellido=_apellido,fechaDeNacimiento=_fechaDeNacimiento,
    telefono=_telefono,direccion=_direccion,email=_email 
    WHERE id_persona_natural = _id_persona_natural;
END$
CREATE PROCEDURE ELIMINAR_PERSONA_NATURAL(
	IN _id_empleado INT
)
BEGIN
	UPDATE personaNatural SET id_persona_natural = 0 WHERE id_persona_natural=_id_persona_natural;
END$



CREATE PROCEDURE insertar_moneda(
	OUT _id_moneda INT ,
    IN _nombre varchar(50),
    IN _abreviatura varchar(10)
)
BEGIN
	SET _id_moneda = @@last_insert_id;
    INSERT INTO moneda(id_moneda,nombre,abreviatura) VALUES(_id_moneda,_nombre,_abreviatura);
END$
CREATE PROCEDURE listar_todas_monedas()
BEGIN
	SELECT id_moneda,nombre,abreviatura
    FROM moneda ;
END$
CREATE PROCEDURE modificar_moneda(
	IN _id_empleado INT,
    IN _fid_area INT,
    IN _DNI VARCHAR(8),
	IN _nombre VARCHAR(40),
    IN _apellido_paterno VARCHAR(40),
    IN _genero CHAR,
    IN _fecha_nacimiento DATE,
    IN _cargo VARCHAR(40),
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	UPDATE moneda SET id_moneda=_id_moneda,nombre=_nombre,abreviatura=_abreviatura 
    WHERE id_moneda = _id_moneda;
END$
CREATE PROCEDURE eliminar_moneda(
	IN _id_moneda INT
)
BEGIN
	UPDATE moneda SET id_moneda = 0 WHERE id_moneda=_id_moneda;
END$



CREATE PROCEDURE insertar_tipoDeCambio(
	IN _id_tipoDeCambio INT,
    IN _fecha date,
    IN _cambio double
)
BEGIN
	INSERT INTO tipoDeCambio(id_tipoDeCambio,fecha,cambio) VALUES(_id_tipoDeCambio,_fecha,_cambio);
END$
CREATE PROCEDURE listarTodos_tipoDeCambio()
BEGIN
	SELECT id_tipoDeCambio,fecha,cambio 
    FROM tipoDeCambio ;
END$
CREATE PROCEDURE modificar_tipoDeCambio(
	IN _id_empleado INT,
    IN _fid_area INT,
    IN _DNI VARCHAR(8),
	IN _nombre VARCHAR(40),
    IN _apellido_paterno VARCHAR(40),
    IN _genero CHAR,
    IN _fecha_nacimiento DATE,
    IN _cargo VARCHAR(40),
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	UPDATE tipoDeCambio SET id_tipoDeCambio=_id_tipoDeCambio,fecha=_fecha,cambio=_cambio
    WHERE id_tipoDeCambio=_id_tipoDeCambio;
END$
CREATE PROCEDURE eliminar_tipoDeCambio(
	IN _id_tipoDeCambio INT
)
BEGIN
	UPDATE tipoDeCambio SET id_tipoDeCambio = 0 WHERE id_tipoDeCambio=_id_tipoDeCambio;
END$


CREATE PROCEDURE INSERTAR_PERSONA(
	OUT _id_persona INT,
    IN _tipoDeDocumento int,
    IN _numDeDocumento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fechaDeNacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	SET _id_persona = @@last_insert_id;
    INSERT INTO persona(id_persona,tipoDeDocumento,numDeDocumento,nombre,apellido,fechaDeNacimiento,telefono,direccion,email) 
    VALUES(_id_persona,_tipoDeDocumento,_numDeDocumento,_nombre,_apellido,_fechaDeNacimiento,_telefono,_direccion,_email);
END$
CREATE PROCEDURE LISTAR_PERSONAS()
BEGIN
	SELECT id_persona,tipoDeDocumento,numDeDocumento,nombre,apellido,fechaDeNacimiento,telefono,direccion,email
	FROM persona ;
END$
CREATE PROCEDURE MODIFICAR_PERSONA(
	IN _id_empleado INT,
    IN _fid_area INT,
    IN _DNI VARCHAR(8),
	IN _nombre VARCHAR(40),
    IN _apellido_paterno VARCHAR(40),
    IN _genero CHAR,
    IN _fecha_nacimiento DATE,
    IN _cargo VARCHAR(40),
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	UPDATE persona SET id_persona=_id_persona,tipoDeDocumento=_tipoDeDocumento,numDeDocumento=_numDeDocumento,
    nombre=_nombre,apellido=_apellido,fechaDeNacimiento=_fechaDeNacimiento,telefono=_telefono,direccion=_direccion,email=_email 
    WHERE id_persona=_id_persona;
END$
CREATE PROCEDURE ELIMINAR_PERSONA(
	IN _id_empleado INT
)
BEGIN
	UPDATE persona SET id_persona = 0 WHERE id_persona=_id_persona;
END$


CREATE PROCEDURE INSERTAR_USUARIO(
	IN _id_usuario INT,
    IN _password Varchar(100),
    IN _fechaIngreso date
)
BEGIN
	INSERT INTO usuario(id_usuario,password,fechaIngreso) VALUES(_id_usuario,_password,_fechaIngreso);
END$
CREATE PROCEDURE LISTAR_USUARIOS()
BEGIN
	SELECT  id_usuario,password,fechaIngreso 
    FROM usuario;
END$
CREATE PROCEDURE MODIFICAR_USUARIO(
	IN _id_empleado INT,
    IN _fid_area INT,
    IN _DNI VARCHAR(8),
	IN _nombre VARCHAR(40),
    IN _apellido_paterno VARCHAR(40),
    IN _genero CHAR,
    IN _fecha_nacimiento DATE,
    IN _cargo VARCHAR(40),
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	UPDATE usuario SET id_usuario=_id_usuario,password=_password,fechaIngreso=_fechaIngreso WHERE id_usuario=_id_usuario;
END$
CREATE PROCEDURE ELIMINAR_USUARIO(
	IN _id_usuario INT
)
BEGIN
	UPDATE usuario SET id_usuario = 0 WHERE id_usuario=_id_usuario;
END$


    
    
    
CREATE PROCEDURE INSERTAR_SUPERVISOR_DE_ALMACEN(
	IN _id_usuario INT ,
	IN _password VARCHAR(50),     
	IN _fechaIngreso date,       
	IN _tipoDeDocumento int,
    IN _numDeDocumento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fechaDeNacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)

)
BEGIN
	INSERT INTO supervisorDeAlmacen(id_usuario) VALUES (_id_usuario);
    
    INSERT INTO usuario(id_usuario,password,fechaIngreso) VALUES(_id_usuario,_password,_fechaIngreso);
    INSERT INTO persona(id_usuario,tipoDeDocumento,numDeDocumento,nombre,apellido,fechaDeNacimiento,telefono,direccion,email) 
    VALUES(id_usuario,_tipoDeDocumento,_numDeDocumento,_nombre,_apellido,_fechaDeNacimiento,_telefono,_direccion,_email);
END$
CREATE PROCEDURE LISTAR_SUPERVISORES_DE_ALMACEN()
BEGIN
	SELECT id_usuario
    FROM supervisorDeAlmacen ;
END$
CREATE PROCEDURE MODIFICAR_SUPERVISORDEALMACEN(
	IN _id_usuario INT ,
	IN _password VARCHAR(50),     
	IN _fechaIngreso date,       
	IN _tipoDeDocumento int,
    IN _numDeDocumento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fechaDeNacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	UPDATE usuario SET id_usuario=_id_usuario,password=_password,fechaIngreso=_fechaIngreso WHERE id_usuario=_id_usuario;
    UPDATE persona SET id_usuario=_id_usuario,tipoDeDocumento=_tipoDeDocumento,numDeDocumento=_numDeDocumento,
    nombre=_nombre,apellido=_apellido,fechaDeNacimiento=_fechaDeNacimiento,telefono=_telefono,direccion=_direccion,email=_email 
    WHERE id_usuario=_id_usuario;
END$
CREATE PROCEDURE ELIMINAR_SUPERVISOR_DE_ALMACEN(
	IN _id_usuario INT
)
BEGIN
	UPDATE supervisorDeAlmacen SET id_usuario = 0 WHERE id_usuario = _id_usuario;
END$


CREATE PROCEDURE INSERTAR_VENDEDOR(
	IN _id_usuario INT ,
    IN _cantidad_ventas int,
	IN _password VARCHAR(50),     
	IN _fechaIngreso date,       
	IN _tipoDeDocumento int,
    IN _numDeDocumento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fechaDeNacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)

)
BEGIN
	INSERT INTO vendedor(id_usuario,cantidad_ventas) VALUES (_id_usuario,_cantidad_ventas);
    
    INSERT INTO usuario(id_usuario,password,fechaIngreso) VALUES(_id_usuario,_password,_fechaIngreso);
    INSERT INTO persona(id_usuario,tipoDeDocumento,numDeDocumento,nombre,apellido,fechaDeNacimiento,telefono,direccion,email) 
    VALUES(id_usuario,_tipoDeDocumento,_numDeDocumento,_nombre,_apellido,_fechaDeNacimiento,_telefono,_direccion,_email);
END$
CREATE PROCEDURE LISTAR_TODOS_VENDEDORES()
BEGIN
	SELECT id_usuario,cantidad_ventas
    FROM vendedor ;
END$
CREATE PROCEDURE MODIFICAR_VENDEDOR(
	IN _id_usuario INT ,
    IN _cantidad_ventas int,
	IN _password VARCHAR(50),     
	IN _fechaIngreso date,       
	IN _tipoDeDocumento int,
    IN _numDeDocumento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fechaDeNacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	UPDATE vendedor set cantidad_ventas=_cantidad_ventas where id_usuario=_id_usuario;
	UPDATE usuario SET id_usuario=_id_usuario,password=_password,fechaIngreso=_fechaIngreso WHERE id_usuario=_id_usuario;
    UPDATE persona SET id_usuario=_id_usuario,tipoDeDocumento=_tipoDeDocumento,numDeDocumento=_numDeDocumento,
    nombre=_nombre,apellido=_apellido,fechaDeNacimiento=_fechaDeNacimiento,telefono=_telefono,direccion=_direccion,email=_email 
    WHERE id_usuario=_id_usuario;
END$
CREATE PROCEDURE ELIMINAR_VENDEDOR(
	IN _id_usuario INT
)
BEGIN
	UPDATE vendedor SET id_usuario = 0 WHERE id_usuario=_id_usuario;
END$


CREATE PROCEDURE INSERTAR_ADMINISTRADOR(
	IN _id_usuario INT ,
    IN _area varchar(100),
	IN _password VARCHAR(50),     
	IN _fechaIngreso date,       
	IN _tipoDeDocumento int,
    IN _numDeDocumento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fechaDeNacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	INSERT INTO administrador(id_usuario,area) VALUES (_id_usuario,_area);
    
    INSERT INTO usuario(id_usuario,password,fechaIngreso) VALUES(_id_usuario,_password,_fechaIngreso);
    INSERT INTO persona(id_usuario,tipoDeDocumento,numDeDocumento,nombre,apellido,fechaDeNacimiento,telefono,direccion,email) 
    VALUES(id_usuario,_tipoDeDocumento,_numDeDocumento,_nombre,_apellido,_fechaDeNacimiento,_telefono,_direccion,_email);
END$
CREATE PROCEDURE LISTAR_ADMINISTRADORES()
BEGIN
	SELECT id_usuario,area
    FROM administrador ;
END$
CREATE PROCEDURE MODIFICAR_ADMINISTRADOR(
	IN _id_usuario INT ,
    IN _area varchar(100),
	IN _password VARCHAR(50),     
	IN _fechaIngreso date,       
	IN _tipoDeDocumento int,
    IN _numDeDocumento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fechaDeNacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	UPDATE administrador set area=_area where id_usuario=_id_usuario;
	UPDATE usuario SET id_usuario=_id_usuario,password=_password,fechaIngreso=_fechaIngreso WHERE id_usuario=_id_usuario;
    UPDATE persona SET id_usuario=_id_usuario,tipoDeDocumento=_tipoDeDocumento,numDeDocumento=_numDeDocumento,
    nombre=_nombre,apellido=_apellido,fechaDeNacimiento=_fechaDeNacimiento,telefono=_telefono,direccion=_direccion,email=_email 
    WHERE id_usuario=_id_usuario;
END$
CREATE PROCEDURE ELIMINAR_ADMINISTRADOR(
	IN id_usuario INT
)
BEGIN
	UPDATE administrador SET id_usuario = 0 WHERE id_usuario = _id_usuario;
END$



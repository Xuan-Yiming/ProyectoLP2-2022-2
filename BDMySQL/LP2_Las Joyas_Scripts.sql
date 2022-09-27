/*DROP TABLE IF EXISTS stock;*/
DROP TABLE IF EXISTS almacen;
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
DROP TABLE IF EXISTS tipoDeCambio;
DROP TABLE IF EXISTS moneda;
DROP TABLE IF EXISTS terminoDePago;
DROP TABLE IF EXISTS supervisorDeAlmacen;
DROP TABLE IF EXISTS vendedor;
DROP TABLE IF EXISTS administrador;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS persona;

CREATE TABLE persona(
	id_persona INT PRIMARY KEY AUTO_INCREMENT,
    tipo_de_documento varchar(50),
    numero_de_documento varchar(50),
    nombre varchar(100),
    apellido varchar(100),
    fecha_de_nacimiento date,
    telefono varchar(15),
    direccion varchar(200),
    email varchar(100)
)ENGINE=InnoDB;

CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    categoria varchar(100)
)ENGINE=InnoDB;

CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY,
    password Varchar(100),
    fecha_de_ingreso date,
    FOREIGN KEY (id_usuario) REFERENCES persona(id_persona)
)ENGINE=InnoDB;

CREATE TABLE empresa(
	RUC int,
    razon_social varchar(100),
    direccion varchar(200),
    categoria varchar(100),
    id_empresa int,
	FOREIGN KEY (id_empresa) REFERENCES cliente(id_cliente)
)ENGINE=InnoDB;

CREATE TABLE personaNatural(
    id_persona_natural int,
    categoria varchar(100),
	numero_de_documento varchar(50),
    nombre varchar(100),
    apellido varchar(100),
    fecha_de_nacimiento date,
    telefono varchar(15),
    direccion varchar(200),
    email varchar(100),
    FOREIGN KEY (id_persona_natural) REFERENCES cliente(id_cliente)
)ENGINE=InnoDB;

CREATE TABLE supervisorDeAlmacen(
	id_usuario INT PRIMARY KEY,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
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

CREATE TABLE almacen(
	id_almacen INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100),
    direccion VARCHAR(200),
    id_supervisor_de_almacen INT,
    FOREIGN KEY (id_supervisor_de_almacen) REFERENCES supervisorDeAlmacen(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE producto(
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DOUBLE,
    unidad INT,
    stock_minimo int,
    devuelto BOOLEAN
)ENGINE=InnoDB;

CREATE TABLE ordenDeCompra(
	id_orden_de_compra INT PRIMARY KEY AUTO_INCREMENT,
	monto double,
    id_moneda INT,
    FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda),
    direccion_de_entrega varchar(200),
    forma_de_entrega int,
    fecha_de_compra date,
    fecha_de_entrega date,
    pagado boolean,
    id_cliente int,
    id_vendedor int,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE reclamo(
	id_reclamo INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    atendido boolean,
    justificacion varchar(500),
    id_orden_de_compra int,
    FOREIGN KEY (id_orden_de_compra) REFERENCES ordenDeCompra(id_orden_de_compra)
)ENGINE=InnoDB;

CREATE TABLE devolucion(
	id_devolucion INT PRIMARY KEY AUTO_INCREMENT,
    cantidad INT,
    fecha DATE,
    unidad INT,
    id_producto INT,
    id_reclamo INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_reclamo) REFERENCES reclamo(id_reclamo)
)ENGINE=InnoDB;

CREATE TABLE moneda(
	id_moneda INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50),
    abreviatura varchar(10)
)ENGINE=InnoDB;

CREATE TABLE tipoDeCambio(
	id_tipo_de_cambio INT,
    fecha date,
    cambio double,
    FOREIGN KEY (id_tipo_de_cambio) REFERENCES moneda(id_moneda)
)ENGINE=InnoDB;

CREATE TABLE pedido(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
	cantidad INT,
    descuento double,
    unidad TINYINT,
    id_producto int,
    id_orden_de_compra int, 
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_orden_de_compra) REFERENCES ordenDeCompra(id_orden_de_compra)
)ENGINE=InnoDB;

CREATE TABLE terminoDePago(
	id_termino_de_pago INT PRIMARY KEY AUTO_INCREMENT,
    fecha_limite date,
    numero_cuota int,
	monto_cuota double
)ENGINE=InnoDB;

CREATE TABLE documentoDebito(
	id_documento_debito INT PRIMARY KEY AUTO_INCREMENT,
    fecha_creacion date,
    fecha_vencimiento date,
    impuesto double,
    monto double,
    id_moneda int,
    saldo double,
    anulado boolean,
    id_termino_de_pago int,
    FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda),
    FOREIGN KEY (id_termino_de_pago) REFERENCES terminoDePago(id_termino_de_pago)
)ENGINE=InnoDB;

CREATE TABLE documentoCredito(
	id_documento_credito INT PRIMARY KEY AUTO_INCREMENT,
    fecha_creacion date,
    monto double,
    anulado boolean,
    id_orden_de_compra int,
    id_documentDebito int,
    FOREIGN KEY (id_orden_de_compra) REFERENCES ordenDeCompra(id_orden_de_compra),
    FOREIGN KEY (id_documento_debito) REFERENCES documentoDebito(id_documento_debito)
)ENGINE=InnoDB;


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
	IN _id_almacen INT,
    IN _nombre VARCHAR(100),
    IN _direccion VARCHAR(200)
)
BEGIN
	INSERT INTO almacen(id_almacen,nombre,direccion) VALUES (_id_almacen,_nombre,_direccion);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ALMACENES()
BEGIN
	SELECT a.id_almacen, a.nombre, a.direccion
    FROM almacen a;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_ALMACEN(
	IN _id_almacen INT,
    IN _nombre VARCHAR(100),
    IN _direccion VARCHAR(200)
)
BEGIN
	UPDATE almacen 
    SET id_almacen = _id_almacen, nombre = _nombre, direccion = _direccion
    WHERE id_almacen = _id_almacen;

END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_ALMACEN(
	IN _id_almacen INT
)
BEGIN
	UPDATE almacen SET id_almacen = 0 WHERE id_almacen = _id_almacen;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_STOCK(
	IN _id_stock INT,
	IN _cantidad INT,
    IN _id_producto INT
)
BEGIN
	INSERT INTO stock(id_stock,cantidad,id_producto) VALUES (_id_stock,_cantidad,_id_producto);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_STOCKS()
BEGIN
	SELECT s.id_stock, s.cantidad, p.id_producto
    FROM stock s INNER JOIN producto p ON s.id_producto = p.id_producto;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_STOCK(
	IN _id_stock INT,
	IN _cantidad INT,
    IN _id_producto INT
)
BEGIN
	UPDATE stock SET id_stock = _id_stock, cantidad = _cantidad, id_producto = _id_producto;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_STOCK(
	IN _id_stock INT
)
BEGIN
	UPDATE stock SET id_stock = 0 WHERE id_stock = _id_stock;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_PRODUCTO(
	OUT _id_producto INT,
    IN _nombre VARCHAR(100),
    IN _precio DOUBLE,
    IN _unidad INT,
    IN _stock_minimo int,
    IN _devuelto BOOLEAN
)
BEGIN
	SET _id_producto = @@last_insert_id;
    INSERT INTO producto(id_producto,nombre,precio,unidad,stock_minimo,devuelto) VALUES(_id_producto,_nombre,_precio,_unidad,_stock_minimo,_devuelto);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_PRODUCTOS()
BEGIN
	SELECT p.id_producto,p.nombre,p.precio,p.unidad,p.stock_minimo,p.devuelto 
    FROM producto p;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_PRODUCTO(
    IN _id_producto INT,
    IN _nombre VARCHAR(100),
    IN _precio DOUBLE,
    IN _unidad INT,
    IN _stock_minimo int,
    IN _devuelto BOOLEAN
)
BEGIN
	UPDATE producto 
    SET id_producto = _id_producto, 
    nombre = _nombre, 
    precio = _precio, 
    unidad = _unidad ,
    stock_minimo =_stock_minimo,
    devuelto =_devuelto
    WHERE id_producto = _id_producto;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_PRODUCTO(
	IN _id_producto INT
)
BEGIN
	UPDATE producto SET id_producto = 0 WHERE id_producto = _id_producto;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_DEVOLUCION(
	OUT _id_devolucion INT,
    IN _cantidad INT,
    IN _fecha DATE
)
BEGIN
	SET _id_devolucion = @@last_insert_id;
    INSERT INTO empleado(id_devolucion,cantidad,fecha) VALUES(_id_devolucion,_cantidad,_fecha);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_DEVOLUCIONES()
BEGIN
	SELECT id_devolucion,cantidad,fecha
    FROM devolucion;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_DEVOLUCION(
	IN _id_devolucion INT,
    IN _cantidad INT,
    IN _fecha DATE
)
BEGIN
	UPDATE devolucion SET id_devolucion = _id_devolucion, cantidad = _cantidad, fecha = _fecha WHERE id_devolucion = _id_devolucion;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_DEVOLUCION(
	IN _id_devolucion INT
)
BEGIN
	UPDATE devolucion SET id_devolucion = 0 WHERE id_devolucion = _id_devolucion;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_RECLAMO(
	OUT _id_reclamo INT ,
    IN _fecha DATE,
    IN _atendido boolean,
    IN _justificacion varchar(500),
    IN _id_orden_de_compra int
)
BEGIN
	SET _id_reclamo = @@last_insert_id;
    INSERT INTO reclamo(id_reclamo,fecha,atendido,justificacion) VALUES(_id_reclamo,_fecha,_atendido,_justificacion);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_RECLAMOS()
BEGIN
	SELECT id_reclamo,fecha,atendido,justificacion
    FROM reclamo;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_RECLAMO(
    IN _id_reclamo INT ,
    IN _fecha DATE,
    IN _atendido boolean,
    IN _justificacion varchar(500),
    IN _id_orden_de_compra int
)
BEGIN
	UPDATE reclamo SET id_reclamo = _id_reclamo, fecha = _fecha, atendido = _atendido, justificacion = _justificacion 
    WHERE id_reclamo = _id_reclamo;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_RECLAMO(
	IN _id_reclamo INT
)
BEGIN
	UPDATE reclamo SET _id_reclamo = 0 WHERE id_reclamo = _id_reclamo;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_PEDIDO(
	OUT _id_pedido INT ,
	IN _cantidad INT,
    IN _descuento double,
    IN _unidad TINYINT
)
BEGIN
	SET _id_pedido = @@last_insert_id;
    INSERT INTO pedido(id_pedido,cantidad,descuento,unidad) VALUES(_id_pedido,_cantidad,_descuento,_unidad);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_PEDIDOS()
BEGIN
	SELECT id_pedido,cantidad,descuento,unidad FROM pedido ;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_PEDIDOS(
    IN _id_pedido INT ,
	IN _cantidad INT,
    IN _descuento double,
    IN _unidad TINYINT
)
BEGIN
	UPDATE pedido SET cantidad = _cantidad, descuento = _descuento, unidad = _unidad WHERE id_pedido = _id_pedido;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_PEDIDOS(
	IN _id_empleado INT
)
BEGIN
	UPDATE empleado SET activo = 0 WHERE id_empleado = _id_empleado;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_DOCUMENTO_CREDITO(
	OUT _id_documento_credito INT ,
    IN _fecha_creacion date,
    IN _monto double,
    IN _anulado boolean
)
BEGIN
	SET _id_documento_credito = @@last_insert_id;
    INSERT INTO documentoCredito(id_documento_credito,fecha_creacion,monto,anulado) VALUES(_id_documento_credito,_fecha_creacion,_monto,_anulado);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_TODOS_DOCUMENTOS_CREDITO()
BEGIN
	SELECT id_documento_credito,fecha_creacion,monto,anulado 
    FROM documentoCredito ;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_DOCUMENTO_CREDITO(
    IN _id_documento_credito INT ,
    IN _fecha_creacion date,
    IN _monto double,
    IN _anulado boolean
)
BEGIN
	UPDATE documentoCredito SET fecha_creacion = _fecha_creacion, monto = _monto, anulado = _anulado 
    WHERE id_documento_credito = _id_documento_credito;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_DOCUMENTO_CREDITO(
	IN _id_documento_credito INT
)
BEGIN
	UPDATE documentoCredito SET id_documento_credito = 0 WHERE id_documento_credito = _id_documento_credito;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_DOCUMENTO_DEBITO(
	OUT _id_documento_debito INT ,
    IN _fecha_creacion date,
    IN _fecha_vencimiento date,
    IN _impuesto double,
    IN _monto double,
    IN _saldo double,
    IN _anulado boolean
)
BEGIN
	SET _id_documento_debito = @@last_insert_id;
    INSERT INTO documentoDebito(id_documento_debito,fecha_creacion,fecha_vencimiento,impuesto,monto,saldo,anulado) VALUES(_id_documento_debito,_fecha_creacion,_fecha_vencimiento,
    _impuesto,_monto,_saldo,_anulado);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_DOCUMENTOS_DEBITO()
BEGIN
	SELECT id_documento_debito,fecha_creacion,fecha_vencimiento,impuesto,monto,saldo,anulado FROM documentoDebito ;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_DOCUMENTO_DEBITO(
	IN _id_documento_debito INT ,
    IN _fecha_creacion date,
    IN _fecha_vencimiento date,
    IN _impuesto double,
    IN _monto double,
    IN _saldo double,
    IN _anulado boolean
)
BEGIN
	UPDATE documentoDebito SET fecha_creacion = _fecha_creacion, fecha_vencimiento = _fecha_vencimiento,impuesto=_impuesto, monto=_monto, saldo=_saldo, anulado=_anulado
    WHERE id_documento_debito = _id_documento_debito;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_DOCUMENTO_DEBITO(
	IN _id_documento_debito INT
)
BEGIN
	UPDATE documentoDebito SET id_documento_debito = 0 WHERE id_documento_debito = _id_documento_debito;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_ORDEN_DE_COMPRA(
	OUT _id_orden_de_compra INT ,
	IN _monto double,
    IN _direccion_de_entrega varchar(200),
    IN _forma_de_entrega int,
    IN _fecha_de_compra date,
    IN _fecha_de_entrega date,
    IN _pagado boolean
)
BEGIN
	SET _id_orden_de_compra = @@last_insert_id;
    INSERT INTO ordenDeCompra(id_orden_de_compra,monto,direccion_de_entrega,forma_de_entrega,fecha_de_compra,fecha_de_entrega,pagado) 
    VALUES(_id_orden_de_compra,_monto,_direccion_de_entrega,_forma_de_entrega,_fecha_de_compra,_fecha_de_entrega,_pagado);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_TODOS_ORDENES_DE_COMPRA()
BEGIN
	SELECT id_orden_de_compra,monto,direccion_de_entrega,forma_de_entrega,fecha_de_compra,fecha_de_entrega,pagado
    FROM ordenDeCompra ;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_ORDEN_DE_COMPRA(
	IN _id_orden_de_compra INT ,
	IN _monto double,
    IN _direccion_de_entrega varchar(200),
    IN _forma_de_entrega int,
    IN _fecha_de_compra date,
    IN _fecha_de_entrega date,
    IN _pagado boolean
)
BEGIN
	UPDATE ordenDeCompra SET id_orden_de_compra=_id_orden_de_compra, monto=_monto,direccion_de_entrega=_direccion_de_entrega,
    forma_de_entrega=_forma_de_entrega, fecha_de_compra=_fecha_de_compra, fecha_de_entrega=_fecha_de_entrega, pagado=_pagado
    WHERE id_orden_de_compra=_id_orden_de_compra;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_ORDEN_DE_COMPRA(
	IN _id_orden_de_compra INT
)
BEGIN
	UPDATE ordenDeCompra SET id_orden_de_compra = 0 WHERE id_orden_de_compra=_id_orden_de_compra;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_CLIENTE(
	OUT _id_cliente INT ,
    IN _categoria varchar(100)
)
BEGIN
	SET _id_cliente = @@last_insert_id;
    INSERT INTO empleado(id_cliente,categoria) VALUES(_id_cliente,_categoria);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_CLIENTES()
BEGIN
	SELECT id_cliente,categoria 
    FROM cliente;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_CLIENTE(
	IN _id_cliente INT ,
    IN _categoria varchar(100)
)
BEGIN
	UPDATE cliente SET categoria = _categoria WHERE id_cliente = _id_cliente;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_CLIENTE(
	IN _id_empleado INT
)
BEGIN
	UPDATE cliente SET _id_cliente = 0 WHERE id_cliente = _id_cliente;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_EMPRESA(
	OUT _id_empresa int,
    IN _RUC int,
    IN _razon_social varchar(100),
    IN _direccion varchar(200),
    IN _categoria varchar(100)
)
BEGIN
	SET _id_empresa = @@last_insert_id;
    INSERT INTO empresa(id_empresa,RUC,razon_social,direccion,categoria) VALUES(_id_empresa,_RUC,_razon_social,_direccion,_categoria);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_EMPRESAS()
BEGIN
	SELECT id_empresa,RUC,razon_social,direccion,categoria
    FROM empresa ;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_EMPRESA(
	IN _id_empresa int,
	IN _RUC int,
    IN _razonSocial varchar(100),
    IN _direccion varchar(200),
    IN _categoria varchar(100)
)
BEGIN
	UPDATE empresa SET RUC = _RUC, razonSocial = _razonSocial, direccion = _direccion, categoria=_categoria
    WHERE id_empresa=_id_empresa;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_EMPRESA(
	IN _id_empresa INT
)
BEGIN
	UPDATE empresa SET id_empresa = 0 WHERE id_empresa=_id_empresa;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_PERSONA_NATURAL(
	OUT _id_persona_natural int,
    IN _categoria varchar(100),
	IN _numero_de_documento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	SET _id_persona_natural = @@last_insert_id;
	INSERT INTO personaNatural(id_persona_natural,categoria,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email) 
    VALUES (_id_persona_natural,_categoria,_numero_de_documento,_nombre,_apellido,_fecha_de_nacimiento,_telefono,_direccion,_email);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_TODOS_PERSONAS_NATURALES()
BEGIN
	SELECT id_persona_natural,categoria,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email
    FROM personaNatural;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_PERSONA_NATURAL(
	IN _id_persona_natural int,
    IN _categoria varchar(100),
	IN _numero_de_documento varchar(50),
    IN _nombre varchar(100),
    IN _apellido varchar(100),
    IN _fecha_de_nacimiento date,
    IN _telefono varchar(15),
    IN _direccion varchar(200),
    IN _email varchar(100)
)
BEGIN
	UPDATE personaNatural SET categoria=_categoria, numero_de_documento=_numero_de_documento,nombre=_nombre,apellido=_apellido,fecha_de_nacimiento=_fecha_de_nacimiento,
    telefono=_telefono,direccion=_direccion,email=_email 
    WHERE id_persona_natural = _id_persona_natural;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_PERSONA_NATURAL(
	IN _id_persona_natural INT
)
BEGIN
	UPDATE personaNatural SET id_persona_natural = 0 WHERE id_persona_natural=_id_persona_natural;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_MONEDA(
	OUT _id_moneda INT ,
    IN _nombre varchar(50),
    IN _abreviatura varchar(10)
)
BEGIN
	SET _id_moneda = @@last_insert_id;
    INSERT INTO moneda(id_moneda,nombre,abreviatura) VALUES(_id_moneda,_nombre,_abreviatura);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_MONEDAS()
BEGIN
	SELECT id_moneda,nombre,abreviatura
    FROM moneda ;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_MONEDA(
	IN _id_moneda INT ,
    IN _nombre varchar(50),
    IN _abreviatura varchar(10)
)
BEGIN
	UPDATE moneda SET nombre=_nombre, abreviatura=_abreviatura 
    WHERE id_moneda = _id_moneda;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_MONEDA(
	IN _id_moneda INT
)
BEGIN
	UPDATE moneda SET id_moneda = 0 WHERE id_moneda=_id_moneda;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_TIPO_DE_CAMBIO(
	OUT _id_tipo_de_cambio INT,
    IN _fecha date,
    IN _cambio double
)
BEGIN
	SET _id_tipo_de_cambio = @@last_insert_id;
	INSERT INTO tipoDeCambio(id_tipo_de_cambio,fecha,cambio) VALUES(_id_tipo_de_cambio,_fecha,_cambio);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_TIPOS_DE_CAMBIO()
BEGIN
	SELECT id_tipo_de_cambio,fecha,cambio 
    FROM tipoDeCambio ;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_TIPO_DE_CAMBIO(
	IN _id_tipo_de_cambio INT,
    IN _fecha date,
    IN _cambio double
)
BEGIN
	UPDATE tipoDeCambio SET fecha=_fecha,cambio=_cambio
    WHERE id_tipo_de_cambio=_id_tipo_de_cambio;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_TIPO_DE_CAMBIO(
	IN _id_tipo_de_cambio INT
)
BEGIN
	UPDATE tipoDeCambio SET id_tipo_de_cambio = 0 WHERE id_tipo_de_cambio=_id_tipo_de_cambio;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_PERSONA(
	OUT _id_persona INT,
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
	SET _id_persona = @@last_insert_id;
    INSERT INTO persona(id_persona,tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email) 
    VALUES(_id_persona,_tipo_de_documento,_numero_de_documento,_nombre,_apellido,_fecha_de_nacimiento,_telefono,_direccion,_email);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_PERSONAS()
BEGIN
	SELECT id_persona,tipo_de_documento,numero_de_documento,nombre,apellido,fecha_de_nacimiento,telefono,direccion,email
	FROM persona ;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_PERSONA(
	IN _id_persona INT,
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
	UPDATE persona SET tipo_de_documento=_tipo_de_documento, numero_de_documento=_numero_de_documento,
    nombre=_nombre,apellido=_apellido, fecha_de_nacimiento=_fecha_de_nacimiento,telefono=_telefono,direccion=_direccion,email=_email 
    WHERE id_persona=_id_persona;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_PERSONA(
	IN _id_persona INT
)
BEGIN
	UPDATE persona SET id_persona = 0 WHERE id_persona=_id_persona;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_USUARIO(
	OUT _id_usuario INT,
    IN _password Varchar(100),
    IN _fecha_de_ingreso date
)
BEGIN
	SET _id_usuario = @@last_insert_id;
	INSERT INTO usuario(id_usuario,password,fecha_de_ingreso) VALUES(_id_usuario,_password,_fecha_de_ingreso);
END$

DELIMITER $
CREATE PROCEDURE LISTAR_USUARIOS()
BEGIN
	SELECT  id_usuario,password,fechaIngreso 
    FROM usuario;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_USUARIO(
	IN _id_usuario INT,
    IN _password Varchar(100),
    IN _fecha_de_ingreso date
)
BEGIN
	UPDATE usuario SET password=_password,fechaIngreso=_fechaIngreso WHERE id_usuario=_id_usuario;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_USUARIO(
	IN _id_usuario INT
)
BEGIN
	UPDATE usuario SET id_usuario = 0 WHERE id_usuario=_id_usuario;
END$

DELIMITER $
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

DELIMITER $
CREATE PROCEDURE LISTAR_SUPERVISORES_DE_ALMACEN()
BEGIN
	SELECT id_usuario
    FROM supervisorDeAlmacen ;
END$

DELIMITER $
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



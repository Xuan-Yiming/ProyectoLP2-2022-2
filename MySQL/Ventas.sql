-- Producto
DROP PROCEDURE IF EXISTS `INSERTAR_PRODUCTO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_PRODUCTO`(
	OUT _id_producto INT,
    IN _nombre VARCHAR(50),    
    IN _precio DOUBLE,
    IN _costo DOUBLE,
    IN _devuelto TINYINT,
    IN _fecha_ingreso DATE,
    IN _foto LONGBLOB,
    IN _activo TINYINT
    )
BEGIN    
    INSERT INTO producto(nombre,precio,costo, devuelto,fecha_ingreso, foto,activo)
                VALUES(_nombre, _precio, _costo, _devuelto, _fecha_ingreso, _foto, 1);
    SET _id_producto = @@LAST_INSERT_ID;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_PRODUCTO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_PRODUCTO`(
    IN _id_producto INT,
    IN _nombre VARCHAR(50),    
    IN _precio DOUBLE,
    IN _costo DOUBLE,
    IN _devuelto TINYINT,
    IN _fecha_ingreso DATE,
    IN _foto LONGBLOB,
    IN _activo TINYINT
    )
BEGIN
    UPDATE producto SET nombre=_nombre, precio=_precio, costo=_costo, devuelto=_devuelto,
                        fecha_ingreso=_fecha_ingreso, activo=_activo, foto=_foto
        WHERE id_producto = _id_producto;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_PRODUCTO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_PRODUCTO`(
    IN _id_producto INT
    )
BEGIN
    UPDATE producto SET activo=0 WHERE id_producto = _id_producto;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_PRODUCTOS_X_NOMBRE`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_PRODUCTOS_X_NOMBRE`(
	IN _nombre VARCHAR(80)
)
BEGIN
	SELECT *
    FROM producto WHERE activo = 1
    AND nombre LIKE CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `BUSCAR_PRODUCTO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `BUSCAR_PRODUCTO`(
    IN _id_producto INT
)
BEGIN
    SELECT *
    FROM producto WHERE activo = 1
    AND id_producto = _id_producto;
END ;;
DELIMITER ;


-- Almacen
DROP PROCEDURE IF EXISTS `INSERTAR_ALMACEN`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_ALMACEN`(
    OUT _id_almacen INT,
    IN _fid_supervisor INT,
    IN _nombre VARCHAR(50),    
    IN _direccion VARCHAR(50),
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO almacen(fid_supervisor,nombre,direccion,activo)
                VALUES(_fid_supervisor, _nombre, _direccion, 1);
    SET _id_almacen = @@LAST_INSERT_ID;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_ALMACEN`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_ALMACEN`(
    IN _id_almacen INT,
    IN _fid_supervisor INT,
    IN _nombre VARCHAR(50),    
    IN _direccion VARCHAR(50),
    IN _activo TINYINT
    )
BEGIN
    UPDATE almacen SET fid_supervisor=_fid_supervisor, nombre=_nombre, direccion=_direccion, activo=_activo
        WHERE id_almacen = _id_almacen;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_ALMACEN`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_ALMACEN`(
    IN _id_almacen INT
    )
BEGIN
    UPDATE almacen SET activo=0 WHERE id_almacen = _id_almacen;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_ALMACENES_X_NOMBRE`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_ALMACENES_X_NOMBRE`(
    IN _nombre VARCHAR(80)
)
BEGIN
    SELECT *
    FROM almacen WHERE activo = 1
    AND nombre LIKE CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_ALMACENES`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_ALMACENES`()
BEGIN
    SELECT *
    FROM almacen WHERE activo = 1;
END ;;
DELIMITER ;
-- Stock
DROP PROCEDURE IF EXISTS `INSERTAR_STOCK`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_STOCK`(
    IN _fid_almacen INT,
    IN _fid_producto INT,
    IN _cantidad INT,
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO stock(id_almacen,id_producto,cantidad,activo)
                VALUES(_fid_almacen, _fid_producto, _cantidad,1);
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_STOCK`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_STOCK`(
    IN _fid_almacen INT,
    IN _fid_producto INT,
    IN _activo TINYINT,
    IN _cantidad INT
    )
BEGIN
    UPDATE stock SET cantidad=_cantidad, activo=_activo
        WHERE id_almacen = _fid_almacen AND id_producto = _fid_producto;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_STOCK`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_STOCK`(
        IN _fid_almacen INT,
        IN _fid_producto INT
    )
BEGIN
    UPDATE stock SET activo=0 
    WHERE fid_almacen = _fid_almacen AND fid_producto = _fid_producto;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_STOCK_X_ALMACEN`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_STOCK_X_ALMACEN`(
    IN _fid_almacen INT
    )
BEGIN
    SELECT * FROM stock WHERE id_almacen = _fid_almacen AND activo = 1;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_STOCK_X_PRODUCTO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_STOCK_X_PRODUCTO`(
    IN _fid_producto INT
    )
BEGIN
    SELECT * FROM stock WHERE id_producto = _fid_producto AND activo = 1;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_STOCK_X_ALMACEN_Y_PRODUCTO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_STOCK_X_ALMACEN_Y_PRODUCTO`(
    IN _fid_almacen INT,
    IN _fid_producto INT
    )
BEGIN
    SELECT * FROM stock WHERE id_almacen = _fid_almacen AND id_producto = _fid_producto AND activo = 1;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_STOCK_X_ALMACEN_Y_NOMBRE_PRODUCTO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_STOCK_X_ALMACEN_Y_NOMBRE_PRODUCTO`(
    IN _fid_almacen INT,
    IN _nombre VARCHAR(80)
    )
BEGIN
    SELECT * FROM stock s
    INNER JOIN producto p ON s.id_producto = p.id_producto
    WHERE s.id_almacen = _fid_almacen AND s.activo = 1 AND p.nombre LIKE CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;
-- Orden De Compra
DROP PROCEDURE IF EXISTS `INSERTAR_ORDEN_DE_COMPRA`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_ORDEN_DE_COMPRA`(
    OUT _id_orden_de_compra INT,
    IN _fid_cliente INT,
    IN _fid_vendedor INT,
    IN _fid_moneda INT,
    IN _fid_termino_de_pago INT,
    In _monto DOUBLE,
    IN _saldo DOUBLE,
    IN _direccion_de_entrega VARCHAR(200),
    IN _forma_de_enterga VARCHAR(50),
    IN _fecha_de_entrega DATE,
    IN _fecha_de_compra DATE,
    IN _pagado TINYINT,
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO orden_de_compra(fid_cliente,fid_vendedor,fid_moneda,fid_termino_de_pago,monto,saldo,direccion_de_entrega,forma_de_entrega,fecha_de_entrega,fecha_de_compra,pagado,activo)
                VALUES(_fid_cliente, _fid_vendedor, _fid_moneda, _fid_termino_de_pago, _monto, _saldo, _direccion_de_entrega, _forma_de_enterga, _fecha_de_entrega, _fecha_de_compra, _pagado, 1);
    SET _id_orden_de_compra = @@LAST_INSERT_ID;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_ORDEN_DE_COMPRA`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_ORDEN_DE_COMPRA`(
    IN _id_orden_de_compra INT,
    IN _fid_cliente INT,
    IN _fid_vendedor INT,
    IN _fid_moneda INT,
    IN _fid_termino_de_pago INT,
    In _monto DOUBLE,
    IN _saldo DOUBLE,
    IN _direccion_de_entrega VARCHAR(200),
    IN _forma_de_enterga VARCHAR(50),
    IN _fecha_de_entrega DATE,
    IN _fecha_de_compra DATE,
    IN _pagado TINYINT,
    IN _activo TINYINT
    )
BEGIN
    UPDATE orden_de_compra SET fid_cliente=_fid_cliente, fid_vendedor=_fid_vendedor, fid_moneda=_fid_moneda, fid_termino_de_pago=_fid_termino_de_pago, monto=_monto, saldo=_saldo, direccion_de_entrega=_direccion_de_entrega, forma_de_entrega=_forma_de_enterga, fecha_de_entrega=_fecha_de_entrega, fecha_de_compra=_fecha_de_compra, pagado=_pagado, activo=_activo
        WHERE id_orden_de_compra = _id_orden_de_compra;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_ORDEN_DE_COMPRA`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_ORDEN_DE_COMPRA`(
    IN _id_orden_de_compra INT
    )
BEGIN
    UPDATE orden_de_compra SET activo=0 WHERE id_orden_de_compra = _id_orden_de_compra;
END ;;
DELIMITER ;

-- Peidido
DROP PROCEDURE IF EXISTS `INSERTAR_PEDIDO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_PEDIDO`(
    OUT _id_pedido INT,
    IN _fid_orden_de_compra INT,
    IN _fid_producto INT,
    IN _cantidad INT,
    IN _descuento DOUBLE,
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO pedido(fid_orden_de_compra,fid_producto,cantidad,descuento,activo)
                VALUES(_fid_orden_de_compra, _fid_producto, _cantidad, _descuento, 1);
    SET _id_pedido = @@LAST_INSERT_ID;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_PEDIDO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_PEDIDO`(
    IN _id_pedido INT,
    IN _fid_orden_de_compra INT,
    IN _fid_producto INT,
    IN _cantidad INT,
    IN _descuento DOUBLE,
    IN _activo TINYINT
    )
BEGIN
    UPDATE pedido SET fid_orden_de_compra=_fid_orden_de_compra, fid_producto=_fid_producto, cantidad=_cantidad, descuento=_descuento, activo=_activo
        WHERE id_pedido = _id_pedido;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_PEDIDO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_PEDIDO`(
    IN _id_pedido INT
    )
BEGIN
    UPDATE pedido SET activo=0 WHERE id_pedido = _id_pedido;
END ;;
DELIMITER ;

-- Reclamo
DROP PROCEDURE IF EXISTS `INSERTAR_RECLAMO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_RECLAMO`(
    OUT _id_reclamo INT,
    IN _fid_orden_de_compra INT,
    IN _fecha DATE,
    IN _atendido TINYINT,
    IN _justificacion VARCHAR(500),
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO reclamo(fid_orden_de_compra,fecha,atendido,justificacion,activo)
                VALUES(_fid_orden_de_compra, _fecha, _atendido, _justificacion, 1);
    SET _id_reclamo = @@LAST_INSERT_ID;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_RECLAMO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_RECLAMO`(
    IN _id_reclamo INT,
    IN _fid_orden_de_compra INT,
    IN _fecha DATE,
    IN _atendido TINYINT,
    IN _justificacion VARCHAR(500),
    IN _activo TINYINT
    )
BEGIN
    UPDATE reclamo SET fid_orden_de_compra=_fid_orden_de_compra, fecha=_fecha, atendido=_atendido, justificacion=_justificacion, activo=_activo
        WHERE id_reclamo = _id_reclamo;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_RECLAMO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_RECLAMO`(
    IN _id_reclamo INT
    )
BEGIN
    UPDATE reclamo SET activo=0 WHERE id_reclamo = _id_reclamo;
END ;;
DELIMITER ;

-- devolucion
DROP PROCEDURE IF EXISTS `INSERTAR_DEVOLUCION`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_DEVOLUCION`(
    OUT _id_devolucion INT,
    IN _fid_producto INT,
    IN _fid_reclamo INT,
    IN _cantidad INT,
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO devolucion(fid_producto,fid_reclamo,cantidad,activo)
                VALUES( _fid_producto, _fid_reclamo, _cantidad, 1);
    SET _id_devolucion = @@LAST_INSERT_ID;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_DEVOLUCION`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_DEVOLUCION`(
    IN _id_devolucion INT,
    IN _fid_producto INT,
    IN _fid_reclamo INT,
    IN _cantidad INT,
    IN _activo TINYINT
    )
BEGIN
    UPDATE devolucion SET cantidad=_cantidad, activo=_activo
        WHERE id_devolucion = _id_devolucion;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_DEVOLUCION`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_DEVOLUCION`(
    IN _id_devolucion INT
    )
BEGIN
    UPDATE devolucion SET activo=0 WHERE id_devolucion = _id_devolucion;
END ;;
DELIMITER ;

-- Moneda
DROP PROCEDURE IF EXISTS `INSERTAR_MONEDA`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_MONEDA`(
    OUT _id_moneda INT,
    IN _nombre VARCHAR(50),
    IN _abreviatura VARCHAR(5),
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO moneda(nombre,abreviatura,activo)
                VALUES(_nombre, _abreviatura, 1);
    SET _id_moneda = @@LAST_INSERT_ID;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_MONEDA`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_MONEDA`(
    IN _id_moneda INT,
    IN _nombre VARCHAR(50),
    IN _abreviatura VARCHAR(5),
    IN _activo TINYINT
    )
BEGIN
    UPDATE moneda SET nombre=_nombre, abreviatura=_abreviatura, activo=_activo
        WHERE id_moneda = _id_moneda;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_MONEDA`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_MONEDA`(
    IN _id_moneda INT
    )
BEGIN
    UPDATE moneda SET activo=0 WHERE id_moneda = _id_moneda;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_MONEDAS_X_NOMBRE`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_MONEDAS_X_NOMBRE`(
	IN _nombre VARCHAR(80)
)
BEGIN
	SELECT *
    FROM moneda m
    WHERE activo = 1
    AND nombre LIKE CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_MONEDAS`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_MONEDAS`()
BEGIN
	SELECT *
    FROM moneda m
    WHERE activo = 1;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_MONEDA_ULTIMO_TIPODECAMBIO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_MONEDA_ULTIMO_TIPODECAMBIO`(
	IN _id_moneda INT
)
BEGIN
	SELECT *
    FROM tipoDeCambio T
    WHERE activo = 1
    AND fecha=(select MAX(fecha) from tipoDeCambio where fid_moneda=_id_moneda);
END ;;
DELIMITER ;

-- Tipo De Cambio
DROP PROCEDURE IF EXISTS `INSERTAR_TIPO_DE_CAMBIO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_TIPO_DE_CAMBIO`(
    OUT _id_tipo_de_cambio INT,
    IN _fid_moneda INT,
    IN _fecha DATE,
    IN _cammbio DOUBLE,
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO tipo_de_cambio(fid_moneda,fecha,cambio,activo)
                VALUES(_fid_moneda, _fecha, _cammbio, 1);
    SET _id_tipo_de_cambio = @@LAST_INSERT_ID;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_TIPO_DE_CAMBIO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_TIPO_DE_CAMBIO`(
    IN _id_tipo_de_cambio INT,
    IN _fid_moneda INT,
    IN _fecha DATE,
    IN _cammbio DOUBLE,
    IN _activo TINYINT
    )
BEGIN
    UPDATE tipo_de_cambio SET cambio=_cammbio, activo=_activo
        WHERE id_tipo_de_cambio = _id_tipo_de_cambio;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_TIPO_DE_CAMBIO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_TIPO_DE_CAMBIO`(
    IN _id_tipo_de_cambio INT
    )
BEGIN
    UPDATE tipo_de_cambio SET activo=0 WHERE id_tipo_de_cambio = _id_tipo_de_cambio;
END ;; 
DELIMITER ;

DROP PROCEDURE IF EXISTS `LISTAR_TIPOS_DE_CAMBIO_X_NOMBRE`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `LISTAR_TIPOS_DE_CAMBIO_X_NOMBRE`(
	IN _nombre VARCHAR(80)
)
BEGIN
	SELECT t.*,m.*
    FROM tipo_de_cambio t
    INNER JOIN moneda m
    ON id_moneda=fid_moneda
    WHERE activo = 1
    AND nombre LIKE CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;




-- Documento Debito
DROP PROCEDURE IF EXISTS `INSERTAR_DOCUMENTO_DEBITO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_DOCUMENTO_DEBITO`(
    OUT _id_documento_debito INT,
    IN _fid_orden_de_compra INT,
    IN _fecha_creacion DATE,
    IN _impuesto DOUBLE,
    IN _monto DOUBLE,
    IN _anulado TINYINT,
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO documento_debito(fid_orden_de_compra,fecha_creacion,impuesto,monto,anulado,activo)
                VALUES(_fid_orden_de_compra, _fecha_creacion, _impuesto, _monto, _anulado, 1);
    SET _id_documento_debito = @@LAST_INSERT_ID;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_DOCUMENTO_DEBITO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_DOCUMENTO_DEBITO`(
    IN _id_documento_debito INT,
    IN _fid_orden_de_compra INT,
    IN _fecha_creacion DATE,
    IN _impuesto DOUBLE,
    IN _monto DOUBLE,
    IN _anulado TINYINT,
    IN _activo TINYINT
    )
BEGIN
    UPDATE documento_debito SET fid_orden_de_compra=_fid_orden_de_compra, fecha_creacion=_fecha_creacion, impuesto=_impuesto, monto=_monto, anulado=_anulado, activo=_activo
        WHERE id_documento_debito = _id_documento_debito;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_DOCUMENTO_DEBITO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_DOCUMENTO_DEBITO`(
    IN _id_documento_debito INT
    )
BEGIN
    UPDATE documento_debito SET activo=0 WHERE id_documento_debito = _id_documento_debito;
END ;;
DELIMITER ;



-- Documento Credito
DROP PROCEDURE IF EXISTS `INSERTAR_DOCUMENTO_CREDITO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `INSERTAR_DOCUMENTO_CREDITO`(
    OUT _id_documento_credito INT,
    IN _fid_orden_de_compra INT,
    IN _fecha_creacion DATE,
    IN _fecha_vencimiento DATE,
    IN _monto DOUBLE,
    IN _anulado TINYINT,
    IN _activo TINYINT
    )
BEGIN
    INSERT INTO documento_credito(fid_orden_de_compra,fecha_creacion,fecha_vencimiento,monto,anulado,activo)
                VALUES(_fid_orden_de_compra, _fecha_creacion, _fecha_vencimiento, _monto, _anulado, 1);
    SET _id_documento_credito = @@LAST_INSERT_ID;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `MODIFICAR_DOCUMENTO_CREDITO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `MODIFICAR_DOCUMENTO_CREDITO`(
    IN _id_documento_credito INT,
    IN _fid_orden_de_compra INT,
    IN _fecha_creacion DATE,
    IN _fecha_vencimiento DATE,
    IN _monto DOUBLE,
    IN _anulado TINYINT,
    IN _activo TINYINT
    )
BEGIN
    UPDATE documento_credito SET fid_orden_de_compra=_fid_orden_de_compra, fecha_creacion=_fecha_creacion, fecha_vencimiento=_fecha_vencimiento, monto=_monto, anulado=_anulado, activo=_activo
        WHERE id_documento_credito = _id_documento_credito;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `ELIMINAR_DOCUMENTO_CREDITO`;
DELIMITER ;;
CREATE DEFINER=`adminjoya`@`%` PROCEDURE `ELIMINAR_DOCUMENTO_CREDITO`(
    IN _id_documento_credito INT
    )
BEGIN
    UPDATE documento_credito SET activo=0 WHERE id_documento_credito = _id_documento_credito;
END ;;
DELIMITER ;

-- Procedimientos Generales

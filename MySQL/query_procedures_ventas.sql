DROP PROCEDURE IF EXISTS INSERTAR_PRODUCTO;
DROP PROCEDURE IF EXISTS LISTAR_ULTIMAS_50_VENTAS;
DROP PROCEDURE IF EXISTS MODIFICAR_PRODUCTO;
DROP PROCEDURE IF EXISTS ELIMINAR_PRODUCTO;
DROP PROCEDURE IF EXISTS LISTAR_PRODUCTOS_X_NOMBRE;
DROP PROCEDURE IF EXISTS BUSCAR_PRODUCTO;
DROP PROCEDURE IF EXISTS INSERTAR_PEDIDO;
DROP PROCEDURE IF EXISTS ELIMINAR_PEDIDO;
DROP PROCEDURE IF EXISTS LISTAR_PEDIDOS_X_ORDEN;
DROP PROCEDURE IF EXISTS INSERTAR_RECLAMO;
DROP PROCEDURE IF EXISTS MODIFICAR_RECLAMO;
DROP PROCEDURE IF EXISTS ELIMINAR_RECLAMO;
DROP PROCEDURE IF EXISTS LISTAR_RECLAMO_X_ORDEN;
DROP PROCEDURE IF EXISTS LISTAR_RECLAMOS_TODO;
DROP PROCEDURE IF EXISTS INSERTAR_STOCK;
DROP PROCEDURE IF EXISTS MODIFICAR_STOCK;
DROP PROCEDURE IF EXISTS ELIMINAR_STOCK;
DROP PROCEDURE IF EXISTS LISTAR_STOCK_X_ALMACEN;
DROP PROCEDURE IF EXISTS LISTAR_STOCK_X_ALMACEN_Y_NOMBRE_PRODUCTO;
DROP PROCEDURE IF EXISTS INSERTAR_ALMACEN;
DROP PROCEDURE IF EXISTS MODIFICAR_ALMACEN;
DROP PROCEDURE IF EXISTS ELIMINAR_ALMACEN;
DROP PROCEDURE IF EXISTS LISTAR_ALMACENES_X_NOMBRE;
DROP PROCEDURE IF EXISTS LISTAR_ALMACENES;
DROP PROCEDURE IF EXISTS INSERTAR_ORDEN_DE_COMPRA;
DROP PROCEDURE IF EXISTS ELIMINAR_ORDEN_DE_COMPRA;
DROP PROCEDURE IF EXISTS LISTAR_ORDEN_DE_COMPRA;
DROP PROCEDURE IF EXISTS LISTAR_ORDENES_DE_COMPRA_X_CLIENTE;
DROP PROCEDURE IF EXISTS LISTAR_ORDENES_DE_COMPRA_X_FECHA;
DROP PROCEDURE IF EXISTS INSERTAR_DEVOLUCION;
DROP PROCEDURE IF EXISTS MODIFICAR_DEVOLUCION;
DROP PROCEDURE IF EXISTS ELIMINAR_DEVOLUCION;
DROP PROCEDURE IF EXISTS LISTAR_DEVOLUCIONES;
DROP PROCEDURE IF EXISTS LISTAR_DEVOLUCIONES_X_RECLAMO;

DELIMITER $
CREATE PROCEDURE INSERTAR_PRODUCTO(
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
END$


DELIMITER $
CREATE PROCEDURE MODIFICAR_PRODUCTO(
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
END$


DELIMITER $
CREATE PROCEDURE ELIMINAR_PRODUCTO(
	IN _id_producto INT
)
BEGIN
    UPDATE producto SET activo=0 WHERE id_producto = _id_producto;
END$


DELIMITER $
CREATE PROCEDURE LISTAR_PRODUCTOS_X_NOMBRE(
	IN _nombre VARCHAR(80)
)
BEGIN
	SELECT *
    FROM producto WHERE activo = 1
    AND nombre LIKE CONCAT('%',_nombre,'%');
END$


DELIMITER $
CREATE PROCEDURE BUSCAR_PRODUCTO(
    IN _id_producto INT
)
BEGIN
    SELECT *
    FROM producto WHERE activo = 1
    AND id_producto = _id_producto;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_PEDIDO(
	OUT _id_pedido INT,
    IN _fid_orden_de_compra INT,
    IN _fid_producto INT,
    IN _cantidad INT,
    IN _descuento DOUBLE,
    IN _activo TINYINT
)
BEGIN
    INSERT INTO pedido(id_pedido,fid_orden_de_compra,fid_producto,cantidad,descuento,activo) 
    VALUES(_id_pedido,_fid_orden_de_compra,_fid_producto,_cantidad,_descuento,1);
    UPDATE stock s SET s.cantidad = s.cantidad - _cantidad WHERE _fid_producto = s.id_producto;
    SET _id_pedido = @@last_insert_id;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_PEDIDO(
    IN _id_pedido INT
)
BEGIN
    UPDATE pedido SET activo=0 WHERE id_pedido = _id_pedido;
END$

DELIMITER $
CREATE PROCEDURE LISTAR_PEDIDOS_X_ORDEN(
	IN _id_orden INT
)
BEGIN
	SELECT  pro.id_producto, pro.nombre, pe.cantidad
    FROM pedido pe INNER JOIN producto pro ON pe.fid_producto = pro.id_producto
    WHERE pe.activo=1 AND pe.fid_orden_de_compra = _id_orden;
END $

DELIMITER $
CREATE PROCEDURE INSERTAR_RECLAMO(
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
END $

DELIMITER $
CREATE PROCEDURE MODIFICAR_RECLAMO(
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
END $

DELIMITER $
CREATE PROCEDURE ELIMINAR_RECLAMO(
    IN _id_reclamo INT
)
BEGIN
    UPDATE reclamo SET activo=0 WHERE id_reclamo = _id_reclamo;
END $

DELIMITER $
CREATE PROCEDURE LISTAR_RECLAMO_X_ORDEN(
	IN _id_orden INT
)
BEGIN
	SELECT  r.id_reclamo, o.id_orden_de_compra, r.fecha as fechaReclamo, r.atendido, r.justificacion, o.fecha_de_compra
    FROM reclamo r INNER JOIN ordenDeCompra o ON o.id_orden_de_compra = r.fid_orden_de_compra
    WHERE r.activo=1 AND fid_orden_de_compra=_id_orden;
END $

DELIMITER $
CREATE PROCEDURE LISTAR_RECLAMOS_TODO()
BEGIN
	SELECT id_reclamo,fid_orden_de_compra,fecha,atendido,justificacion
    FROM reclamo WHERE activo = 1;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_STOCK(
    IN _fid_almacen INT,
    IN _fid_producto INT,
    IN _cantidad INT,
    IN _activo TINYINT
)
BEGIN
    INSERT INTO stock(id_almacen,id_producto,cantidad,activo)
                VALUES(_fid_almacen, _fid_producto, _cantidad,1);
END $

DELIMITER $
CREATE PROCEDURE MODIFICAR_STOCK(
    IN _fid_almacen INT,
    IN _fid_producto INT,
    IN _activo TINYINT,
    IN _cantidad INT
)
BEGIN
    UPDATE stock SET cantidad=_cantidad, activo=_activo
        WHERE id_almacen = _fid_almacen AND id_producto = _fid_producto;
END $

DELIMITER $
CREATE PROCEDURE ELIMINAR_STOCK(
        IN _fid_almacen INT,
        IN _fid_producto INT
)
BEGIN
    UPDATE stock SET activo=0 
    WHERE fid_almacen = _fid_almacen AND fid_producto = _fid_producto;
END $

DELIMITER $
CREATE PROCEDURE LISTAR_STOCK_X_ALMACEN(
    IN _fid_almacen INT
)
BEGIN
    SELECT * FROM stock WHERE id_almacen = _fid_almacen AND activo = 1;
END $

DELIMITER $
CREATE PROCEDURE LISTAR_STOCK_X_ALMACEN_Y_NOMBRE_PRODUCTO(
    IN _fid_almacen INT,
    IN _nombre VARCHAR(80)
)
BEGIN
    SELECT * FROM stock s
    INNER JOIN producto p ON s.id_producto = p.id_producto
    WHERE s.id_almacen = _fid_almacen AND s.activo = 1 AND p.nombre LIKE CONCAT('%',_nombre,'%');
END $

DELIMITER $
CREATE PROCEDURE INSERTAR_ALMACEN(
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
END $

DELIMITER $
CREATE PROCEDURE MODIFICAR_ALMACEN(
    IN _id_almacen INT,
    IN _fid_supervisor INT,
    IN _nombre VARCHAR(50),    
    IN _direccion VARCHAR(50),
    IN _activo TINYINT
    )
BEGIN
    UPDATE almacen SET fid_supervisor=_fid_supervisor, nombre=_nombre, direccion=_direccion, activo=_activo
        WHERE id_almacen = _id_almacen;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_ALMACEN(
    IN _id_almacen INT
    )
BEGIN
    UPDATE almacen SET activo=0 WHERE id_almacen = _id_almacen;
END $

DELIMITER $
CREATE PROCEDURE LISTAR_ALMACENES_X_NOMBRE(
    IN _nombre VARCHAR(80)
)
BEGIN
    SELECT *
    FROM almacen WHERE activo = 1
    AND nombre LIKE CONCAT('%',_nombre,'%');
END $

DELIMITER $
CREATE PROCEDURE LISTAR_ALMACENES()
BEGIN
    SELECT *
    FROM almacen WHERE activo = 1;
END $

DELIMITER $
CREATE PROCEDURE INSERTAR_ORDEN_DE_COMPRA(
    OUT _id_orden_de_compra INT,
    IN _fid_cliente INT,
    IN _fid_vendedor INT,
    IN _fid_moneda INT,
    In _monto DOUBLE,
    IN _direccion_de_entrega VARCHAR(200),
    IN _forma_de_entrega VARCHAR(50),
    IN _fecha_de_entrega DATE,
    IN _fecha_de_compra DATE,
    IN _fecha_limite DATE,
    IN _pagado TINYINT,
    IN _activo TINYINT
)
BEGIN
	INSERT INTO ordenDeCompra(fid_cliente,fid_vendedor,fid_moneda,monto,direccion_de_entrega,forma_de_entrega,fecha_de_entrega,fecha_de_compra,fecha_limite,pagado,activo)
                VALUES(_fid_cliente, _fid_vendedor, _fid_moneda, _monto, _direccion_de_entrega, _forma_de_entrega, _fecha_de_entrega, _fecha_de_compra,_fecha_limite, _pagado, 1);
    SET _id_orden_de_compra = @@LAST_INSERT_ID;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_ORDEN_DE_COMPRA(
	IN _id_orden_de_compra INT
)
BEGIN
	UPDATE ordenDeCompra SET activo = 0 WHERE id_orden_de_compra=_id_orden_de_compra;
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ORDEN_DE_COMPRA(
)
BEGIN
	SELECT o.id_orden_de_compra, o.fecha_de_compra, m.nombre as nombreMoneda,  o.monto
	FROM ordenDeCompra o INNER JOIN moneda m ON o.fid_moneda = m.id_moneda WHERE o.activo = 1
	ORDER BY fecha_de_compra DESC;
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ORDENES_DE_COMPRA_X_CLIENTE(
	IN _id_cliente INT
)
BEGIN
	SELECT o.id_orden_de_compra, e.razon_social, p.nombre as nombrePersonaNatural, p.apellido as apellidoPersonaNatural, 
			o.fecha_de_compra, m.nombre as nombreMoneda, o.monto
	FROM ordenDeCompra o INNER JOIN cliente c ON o.fid_cliente = c.id_cliente 
    LEFT JOIN empresa e ON c.id_cliente = e.id_empresa
    LEFT JOIN personaNatural p ON c.id_cliente = p.id_persona_natural
    INNER JOIN moneda m ON o.fid_moneda = m.id_moneda 
    WHERE o.activo = 1 AND o.fid_cliente = _id_cliente;
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ORDENES_DE_COMPRA_X_FECHA(
	IN _fecha_compra DATE
)
BEGIN
	SELECT o.id_orden_de_compra, o.fecha_de_compra, e.razon_social, p.nombre as nombrePersonaNatural, p.apellido as apellidoPersonaNatural, 
			m.nombre as nombreMoneda, o.monto
	FROM ordenDeCompra o INNER JOIN cliente c ON o.fid_cliente = c.id_cliente 
    LEFT JOIN empresa e ON c.id_cliente = e.id_empresa
    LEFT JOIN personaNatural p ON c.id_cliente = p.id_persona_natural
    INNER JOIN moneda m ON o.fid_moneda = m.id_moneda 
    WHERE o.activo = 1 AND o.fecha_de_compra = _fecha_compra;
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ULTIMAS_50_VENTAS(
)
BEGIN
	SELECT o.id_orden_de_compra, o.fecha_de_compra, o.fecha_de_entrega, o.direccion_de_entrega, o.forma_de_entrega, o.pagado, o.fecha_limite,
			m.nombre as nombreMoneda, o.monto, c.id_cliente, c.categoria,
			e.razon_social, e.RUC,
            p.nombre as nombrePersonaNatural, p.apellido as apellidoPersonaNatural, p.tipo_de_documento,p.numero_de_documento, p.telefono,
            pv.id_persona , pv.nombre as nombreVendedor, pv.apellido as apellidoVendedor
	FROM ordenDeCompra o INNER JOIN cliente c ON o.fid_cliente = c.id_cliente
    LEFT JOIN empresa e ON c.id_cliente = e.id_empresa
    LEFT JOIN personaNatural p ON c.id_cliente = p.id_persona_natural
    INNER JOIN vendedor v ON o.fid_vendedor = v.id_usuario
    LEFT JOIN persona pv ON v.id_usuario = pv.id_persona
    INNER JOIN moneda m ON o.fid_moneda = m.id_moneda 
    WHERE o.activo = 1
	ORDER BY fecha_de_compra DESC
	LIMIT 50;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_DEVOLUCION(
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
END $

DELIMITER $
CREATE PROCEDURE MODIFICAR_DEVOLUCION(
    IN _id_devolucion INT,
    IN _fid_producto INT,
    IN _fid_reclamo INT,
    IN _cantidad INT,
    IN _activo TINYINT
    )
BEGIN
    UPDATE devolucion SET cantidad=_cantidad, activo=_activo
        WHERE id_devolucion = _id_devolucion;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_DEVOLUCION(
    IN _id_devolucion INT
    )
BEGIN
    UPDATE devolucion SET activo=0 WHERE id_devolucion = _id_devolucion;
END $

DELIMITER $
CREATE PROCEDURE LISTAR_DEVOLUCIONES()
BEGIN
    SELECT *
    FROM devolucion WHERE activo = 1;
END $

DELIMITER $
CREATE PROCEDURE LISTAR_DEVOLUCIONES_X_RECLAMO(
	IN _id_reclamo INT
)
BEGIN
    SELECT *
    FROM devolucion d INNER JOIN reclamo r ON d.fid_reclamo = r.id_reclamo
    WHERE d.activo = 1 AND d.fid_reclamo = _id_reclamo;
END $
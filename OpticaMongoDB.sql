CREATE TABLE `Empleados`(
  `ID_Empleado` INT NOT NULL,
  `Nombre` VARCHAR,
  `Ventas` INT,
  `Ventas_id_venta` INT NOT NULL,
  `Periodo_trabajo` TIME NOT NULL
);

CREATE TABLE `Proveedores`(
  id_proveedores INT NOT NULL,
  `Nombre` VARCHAR NOT NULL,
  direccion VARCHAR NOT NULL,
  telefono INT NOT NULL,
  fax INT NOT NULL,
  nif INT NOT NULL,
  `Gafas_id_gafas` INT NOT NULL,
  `Marcas_gafas_id_marca` INT NOT NULL,
  PRIMARY KEY(id_proveedores)
);

CREATE TABLE `Gafas`(
  id_gafas INT NOT NULL,
  id_proveedor INT NOT NULL,
  id_marca INT NOT NULL,
  graducacion INT NOT NULL,
  `tipo:_montura('flotante','pasta','metalica')` ENUM NOT NULL,
  color_montura VARCHAR NOT NULL,
  color_cristales VARCHAR NOT NULL,
  precio INT NOT NULL,
  `Clientes_id_cliente` INT NOT NULL,
  `Ventas_id_venta` INT NOT NULL,
  `Marcas_gafas_id_marca` INT NOT NULL,
  PRIMARY KEY(id_gafas)
);

CREATE TABLE `Clientes`(
  id_cliente INT NOT NULL,
  nombre VARCHAR,
  direccion VARCHAR,
  telefono INT,
  email VARCHAR,
  fecha_registro TIMESTAMP,
  id_gafas INT,
  `Ventas_id_venta` INT NOT NULL,
  PRIMARY KEY(id_cliente)
);

CREATE TABLE `Marcas_gafas`(
  id_marca INT NOT NULL,
  nombre VARCHAR,
  id_proveedor INT,
  PRIMARY KEY(id_marca)
);

CREATE TABLE `Ventas`(
  id_venta INT NOT NULL,
  id_gafas INT,
  id_cliente INT,
  id_empleado INT,
  fecha_venta TIMESTAMP,
  PRIMARY KEY(id_venta)
);

ALTER TABLE `Proveedores`
  ADD CONSTRAINT `Gafas_Proveedores`
    FOREIGN KEY (`Gafas_id_gafas`) REFERENCES `Gafas` (id_gafas);

ALTER TABLE `Proveedores`
  ADD CONSTRAINT `Marcas_gafas_Proveedores`
    FOREIGN KEY (`Marcas_gafas_id_marca`) REFERENCES `Marcas_gafas` (id_marca);

ALTER TABLE `Empleados`
  ADD CONSTRAINT `Ventas_Empleados`
    FOREIGN KEY (`Ventas_id_venta`) REFERENCES `Ventas` (id_venta);

ALTER TABLE `Gafas`
  ADD CONSTRAINT `Clientes_Gafas`
    FOREIGN KEY (`Clientes_id_cliente`) REFERENCES `Clientes` (id_cliente);

ALTER TABLE `Gafas`
  ADD CONSTRAINT `Ventas_Gafas`
    FOREIGN KEY (`Ventas_id_venta`) REFERENCES `Ventas` (id_venta);

ALTER TABLE `Clientes`
  ADD CONSTRAINT `Ventas_Clientes`
    FOREIGN KEY (`Ventas_id_venta`) REFERENCES `Ventas` (id_venta);

ALTER TABLE `Gafas`
  ADD CONSTRAINT `Marcas_gafas_Gafas`
    FOREIGN KEY (`Marcas_gafas_id_marca`) REFERENCES `Marcas_gafas` (id_marca);

ALTER TABLE `Ventas`
  ADD CONSTRAINT `Empleados_Ventas` FOREIGN KEY REFERENCES `Empleados`;

ALTER TABLE `Clientes`
  ADD CONSTRAINT `Empleados_Clientes` FOREIGN KEY REFERENCES `Empleados`;

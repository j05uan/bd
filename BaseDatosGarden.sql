CREATE DATABASE garden;
USE garden;

CREATE TABLE gama_producto(
    idGamaProducto INT AUTO_INCREMENT,
    gama VARCHAR(255),
    descripcionTexto TEXT,
    descripcionHTML TEXT,
    imagen VARCHAR(255),
    CONSTRAINT pkIdGamaProducto PRIMARY KEY(idGamaProducto)
);

CREATE TABLE tipo_documento(
    idTipoDocumento INT AUTO_INCREMENT,
    tipoDocumento VARCHAR(255),
    CONSTRAINT pkidTipoDocumento PRIMARY KEY(idTipoDocumento)
);

CREATE TABLE proveedor (
    idProveedor INT AUTO_INCREMENT,
    nombre VARCHAR(255),
    idTipoDocumento INT,
    numeroDocumento VARCHAR(255),
    tipoPersona ENUM('JURIDICA', 'NATURAL'),
    CONSTRAINT pkidProveedor PRIMARY KEY (idProveedor),
    CONSTRAINT fkidTipoDocumento FOREIGN KEY (idTipoDocumento) REFERENCES tipo_documento(idTipoDocumento)
);

CREATE TABLE tipoTelefono(
    idTipoTelefono INT AUTO_INCREMENT,
    tipoTelefono VARCHAR(255),
    CONSTRAINT pkidTipoTelefono PRIMARY KEY (idTipoTelefono)
);

CREATE TABLE telefono_proveedor(
    idTelefonoProveedor INT AUTO_INCREMENT,
    tipoTelefono INT,
    numero VARCHAR(255),
    idProveedor INT,
    CONSTRAINT pkidTelefonoProveedor PRIMARY KEY (idTelefonoProveedor),
    CONSTRAINT fktipoTelefono FOREIGN KEY (tipoTelefono) REFERENCES tipoTelefono(idTipoTelefono),
    CONSTRAINT fkidProveedor FOREIGN KEY (idProveedor) REFERENCES proveedor(idProveedor)
);

CREATE TABLE producto(
    idProducto INT AUTO_INCREMENT,
    nombre VARCHAR(255),
    idGamaProducto INT,
    dimension VARCHAR(255),
    proveedor INT,
    descripcion TEXT,
    cantidadEnStock SMALLINT,
    precioVenta DECIMAL(15,2),
    precioProveedor DECIMAL(15,2),
    CONSTRAINT pkidProducto PRIMARY KEY (idProducto),
    CONSTRAINT fkproveedor FOREIGN KEY (proveedor) REFERENCES proveedor(idProveedor),
    CONSTRAINT fkgama FOREIGN KEY (idGamaProducto) REFERENCES gama_producto(idGamaProducto)
);

CREATE TABLE pais(
    idPais INT AUTO_INCREMENT,
    pais VARCHAR(255),
    CONSTRAINT pkidPais PRIMARY KEY (idPais)
);

CREATE TABLE region(
    idRegion INT AUTO_INCREMENT,
    region VARCHAR(255),
    idPais INT,
    CONSTRAINT pkidRegion PRIMARY KEY (idRegion),
    CONSTRAINT fKidPais FOREIGN KEY (idPais) REFERENCES pais(idPais)
);

CREATE TABLE ciudad(
    idCiudad INT AUTO_INCREMENT,
    ciudad VARCHAR(255),
    idRegion INT,
    idPais INT,
    CONSTRAINT pkidCiudad PRIMARY KEY (idCiudad),
    CONSTRAINT fKidRegion FOREIGN KEY (idRegion) REFERENCES region(idRegion),
    CONSTRAINT fKidPais_ciudad FOREIGN KEY (idPais) REFERENCES pais(idPais)
);

CREATE TABLE codigoPostal(
    idCodigoPostal INT AUTO_INCREMENT,
    idCiudad INT,
    codigoPostal VARCHAR(255),
    CONSTRAINT pkidCodigoPostal PRIMARY KEY (idCodigoPostal),
    CONSTRAINT fkidCiudad FOREIGN KEY (idCiudad) REFERENCES ciudad(idCiudad)
);

CREATE TABLE oficina (
    idOficina INT AUTO_INCREMENT,
    idCodigoPostal INT,
    direccion VARCHAR(255),
    especificacionDireccion VARCHAR(255),
    CONSTRAINT pkidOficina PRIMARY KEY (idOficina),
    CONSTRAINT fkoficinaidCodigoPostal FOREIGN KEY (idCodigoPostal) REFERENCES        codigoPostal(idCodigoPostal)
);

CREATE TABLE telefonoOficina(
    idTelefonoOficina INT AUTO_INCREMENT,
    idTipoTelefono INT,
    numeroTelefono VARCHAR(255),
    idOficina INT,
    CONSTRAINT pkidTelefonoOficina PRIMARY KEY (idTelefonoOficina),
    CONSTRAINT fkidTipoTelefono_oficina FOREIGN KEY (idTipoTelefono) REFERENCES tipoTelefono(idTipoTelefono),
    CONSTRAINT fkidOficina_oficina FOREIGN KEY (idOficina) REFERENCES oficina(idOficina)
);

CREATE TABLE puesto(
    idPuesto INT AUTO_INCREMENT,
    puesto VARCHAR(255),
    CONSTRAINT pkidPuesto PRIMARY KEY (idPuesto)
);

CREATE TABLE empleado(
    idEmpleado INT AUTO_INCREMENT,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    extension VARCHAR(20),
    email VARCHAR(255),
    idOficina INT,
    codigoJefe INT,
    idPuesto INT,
    CONSTRAINT pkidEmpleado PRIMARY KEY (idEmpleado),
    CONSTRAINT fkidOficina_empleado FOREIGN KEY (idOficina) REFERENCES oficina(idOficina),
    CONSTRAINT fkcodigoJefe FOREIGN KEY (codigoJefe) REFERENCES empleado(idEmpleado),
    CONSTRAINT fkidPuesto_empleado FOREIGN KEY (idPuesto) REFERENCES puesto(idPuesto)
);

CREATE TABLE cliente(
    idCliente INT AUTO_INCREMENT,
    nombre VARCHAR(255),
    nombreContacto VARCHAR(255),
    apellidos VARCHAR(255),
    fax VARCHAR(20),
    direccion VARCHAR(255),
    especificacionDireccion VARCHAR(255),
    idCodigoPostal INT,
    idEmpleado INT,
    limiteCredito DECIMAL(15,2),
    CONSTRAINT pkidCliente PRIMARY KEY (idCliente),
    CONSTRAINT fkidCodigoPostal_cliente FOREIGN KEY (idCodigoPostal) REFERENCES codigoPostal(idCodigoPostal),
    CONSTRAINT fkidEmpleado_cliente FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);

CREATE TABLE telefono_cliente(
    idTelefonoCliente INT AUTO_INCREMENT,
    idTipoTelefono INT,
    numeroTelefono VARCHAR(255),
    idCliente INT,
    CONSTRAINT pkidTelefonoCliente PRIMARY KEY (idTelefonoCliente),
    CONSTRAINT fkidTipoTelefono_cliente FOREIGN KEY (idTipoTelefono) REFERENCES tipoTelefono(idTipoTelefono),
    CONSTRAINT fkidCliente_cliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE formaDePago(
    idFormaDePago INT AUTO_INCREMENT,
    tipoFormaDePago VARCHAR(255),
    CONSTRAINT pkidFormaDePago PRIMARY KEY (idFormaDePago)
);

CREATE TABLE pago(
    idPago INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idFormaDePago INT,
    fechaPago DATE,
    total DECIMAL(15,2),
    CONSTRAINT fkidCliente_pago FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    CONSTRAINT fkidFormaDePago_pago FOREIGN KEY (idFormaDePago) REFERENCES formaDePago(idFormaDePago)
);
    
CREATE TABLE estado(
    idEstado INT AUTO_INCREMENT,
    estado VARCHAR(255),
    CONSTRAINT pkidEstado PRIMARY KEY (idEstado)
);

CREATE TABLE pedido(
    idPedido INT AUTO_INCREMENT,
    fechaPedido DATE,
    fechaEsperada DATE,
    fechaEntrega DATE,
    idEstado INT,
    comentario TEXT,
    idCliente INT,
    CONSTRAINT pkIdPedido PRIMARY KEY (idPedido),
    CONSTRAINT fkidCliente_pedido FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    CONSTRAINT fkidEstado_pedido FOREIGN KEY (idEstado) REFERENCES estado(idEstado)
);
    
CREATE TABLE detallePedido(
    idDetallePedido INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    idProducto INT,
    cantidad INT,
    numero_linea SMALLINT,
    CONSTRAINT fkidProducto_detallePedido FOREIGN KEY (idProducto) REFERENCES producto(idProducto),
    CONSTRAINT fkidPedido_detallePedido FOREIGN KEY (idPedido) REFERENCES pedido(idPedido)
);

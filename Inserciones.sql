INSERT INTO pais (pais) VALUES
('España'),
('Colombia'),
('Brasil');

INSERT INTO region (region, idPais) VALUES
('Andalucía', 1),
('Aragón', 1),
('Asturias', 1),
('Islas Baleares', 1),
('Canarias', 1),
('Cantabria', 1),
('Región Caribe',2),
('Región Andina',2),
('Región Pacífica',2),
('Región Orinoquía',2),
('Región Amazónica',2),
('Región Norte',3),
('Región Nordeste',3),
('Región Centro-Oeste',3),
('Región Sudeste',3),
('Región Sur',3);

INSERT INTO ciudad (ciudad, idRegion,idPais) VALUES
('Sevilla', 1,1),
('Málaga', 1,1),
('Granada', 1,1),
('Córdoba', 1,1),
('Cádiz', 1,1),
('Huelva', 1,1),
('Jaén', 1,1),
('Almería', 1,1),
('Zaragoza', 2,1),
('Huesca', 2,1),
('Teruel', 2,1),
('Oviedo', 3,1),
('Gijon', 3,1),
('Palma de Mallorca', 4,1),
('Ibiza', 4,1),
('Menorca', 4,1),
('Formentera', 4,1),
('Las Palmas de Gran Canaria', 5,1),
('Santa Cruz de Tenerife', 5,1),
('Puerto del Rosario', 5,1),
('Arrecife', 5,1),
('Santander', 6,1),
('Torrelavega', 6,1),
('Castro Urdiales', 6,1),
('Barranquilla', 7, 2), 
('Cartagena', 7, 2),
 ('Santa Marta', 7, 2), 
('Valledupar', 7, 2),
 ('Bucaramanga', 6, 2), 
('Medellín', 7, 2), 
('Cali', 8, 2), 
('Natal', 6, 3), 
('Salvador', 7, 3), 
('Brasília', 8, 3), 
('Goiânia', 9, 3), 
('Campo Grande', 5, 3),
('Cuiabá', 1, 3),
('São Paulo', 2, 3), 
('Rio de Janeiro', 5, 3), 
('Belo Horizonte', 5, 3), 
('Vitória', 5, 3), 
('Curitiba', 5, 3), 
('Porto Alegre', 5, 3),
 ('Florianópolis', 5, 3);

INSERT INTO codigoPostal (idCiudad, codigoPostal) VALUES
(1, '69000-000'), 
(2, '66000-000'), 
(3, '78900-000'), 
(4, '69300-000'), 
(5, '77000-000'), 
(6, '65000-000'), 
(7, '60000-000'), 
(8, '50000-000'), 
(9, '59000-000'), 
(10, '40000-000'), 
(11, '70000-000'),
(12, '74000-000'),
(13, '79000-000'), 
(14, '78000-000'), 
(15, '01000-000'), 
(16, '20000-000'), 
(17, '30000-000'), 
(18, '29000-000'), 
(19, '80000-000'), 
(20, '90000-000'), 
(21, '88000-000'), 
(22, '69001-000'), 
(23, '13000-000'), 
(24, '47000-000'), 
(25, '20000-000'), 
(26, '68000-000'), 
(27, '05000-000'), 
(28, '76000-000'), 
(29, '17000-000'), 
(30, '52000-000'), 
(31, '76000-000'), 
(32, '76000-000'), 
(33, '50000-000'), 
(34, '85000-000'), 
(35, '88000-000'), 
(36, '69000-000'), 
(37, '69000-000'), 
(38, '41000-000'), 
(39, '29000-000'), 
(40, '18000-000');
INSERT INTO gama_producto (gama, descripcionTexto, descripcionHTML, imagen) VALUES
('Electrodomésticos', 'Descripción de la línea de electrodomésticos en texto', '<p>Descripción de la línea de electrodomésticos en HTML</p>', 'electro.jpg'),
('Muebles', 'Descripción de la línea de muebles en texto', '<p>Descripción de la línea de muebles en HTML</p>', 'muebles.jpg'),
('Electrónica', 'Descripción de la línea de electrónica en texto', '<p>Descripción de la línea de electrónica en HTML</p>', 'electronica.jpg');

INSERT INTO tipo_documento (tipoDocumento) VALUES
('DNI'),
('RUC'),
('Carnet de Extranjería');

INSERT INTO proveedor (nombre, idTipoDocumento, numeroDocumento, tipoPersona) VALUES
('ElectroHogar S.A.', 2, '12345678901', 'JURIDICA'),
('MueblesDeluxe E.I.R.L.', 2, '98765432109', 'JURIDICA'),
('ElectroMundo', 1, '87654321', 'NATURAL');

INSERT INTO tipoTelefono (tipoTelefono) VALUES
('Celular'),
('Fijo'),
('Fax');

INSERT INTO telefono_proveedor (tipoTelefono, numero, idProveedor) VALUES
(1, '912345678', 1),
(2, '012345678', 1),
(1, '998877665', 2),
(3, '01234567', 3);

INSERT INTO producto (nombre, idGamaProducto, dimension, proveedor, descripcion, cantidadEnStock, precioVenta, precioProveedor) VALUES
('Refrigeradora', 1, '180x70x80 cm', 1, 'Refrigeradora de acero inoxidable con congelador superior.', 10, 999.99, 799.99),
('Sofá de cuero', 2, '200x90x80 cm', 2, 'Sofá de cuero genuino con capacidad para tres personas.', 5, 1499.99, 1299.99),
('Smartphone', 3, '15x7x0.8 cm', 3, 'Smartphone con pantalla OLED de 6.5 pulgadas y cámara triple.', 20, 699.99, 599.99);

INSERT INTO oficina (idCodigoPostal, direccion, especificacionDireccion) VALUES
(1, 'Calle Principal 123', 'Edificio A, Piso 5, Oficina 502'),
(2, 'Avenida Central 456', 'Local 101'),
(15, 'Plaza Mayor 789', 'Piso 2, Oficina 201');

INSERT INTO telefonoOficina (idTipoTelefono, numeroTelefono, idOficina) VALUES
(1, '912345678', 1),
(2, '012345678', 1),
(1, '998877665', 2),
(3, '01234567', 3);

-- Inserciones para la tabla puesto
INSERT INTO puesto (puesto) VALUES
('Jefe'),
('Representante de Ventas'),
('Gerente'),
('Asistente Administrativo'),
('Contador'),
('Analista de Marketing');

-- Inserciones para la tabla empleado
INSERT INTO empleado (nombre, apellidos, extension, email, idOficina, codigoJefe, idPuesto) VALUES
('Juan', 'Perez', '101', 'juan.perez@example.com', 1, NULL, 1),
('María', 'Gómez', '102', 'maria.gomez@example.com', 1, 1, 2),
('Pedro', 'Martínez', '103', 'pedro.martinez@example.com', 2, 1, 3),
('Laura', 'López', '104', 'laura.lopez@example.com', 2, 1, 4);

INSERT INTO cliente (nombre, nombreContacto, apellidos, fax, direccion, especificacionDireccion, idCodigoPostal, idEmpleado, limiteCredito) VALUES
('Empresa A', 'Juan', 'Perez', '123456789', 'Calle Principal 123', 'Piso 5, Oficina 502', 5, 1, 10000.00),
('Empresa B', 'María', 'Gómez', '987654321', 'Avenida Central 456', 'Local 101', 6, 2, 15000.00),
('Empresa C', 'Pedro', 'Martínez', '111222333', 'Plaza Mayor 789', 'Piso 2, Oficina 201', 1, 3, 20000.00);

INSERT INTO telefono_cliente (idTipoTelefono, numeroTelefono, idCliente) VALUES
(1, '123456789', 1),  
(2, '987654321', 3),  
(3, '555555555', 1);  

INSERT INTO formaDePago (tipoFormaDePago) VALUES 
('Efectivo'), 
('Tarjeta de crédito'), (
'Transferencia bancaria');

INSERT INTO pago (idCliente, idFormaDePago, fechaPago, total) VALUES
(1, 1, '2024-05-30', 1500.00),
(1, 2, '2024-05-29', 2000.00),
(2, 3, '2024-05-28', 2500.00);

INSERT INTO estado (estado) VALUES
('En proceso'), 
('En camino'), 
('Entregado');

INSERT INTO pedido (fechaPedido, fechaEsperada, fechaEntrega, idEstado, comentario, idCliente) VALUES
('2024-05-30', '2024-06-05', NULL, 1, 'Urgente', 1),
('2024-05-29', '2024-06-04', NULL, 2, 'Cliente VIP', 1),
('2024-05-28', '2024-06-03', '2024-06-01', 3, 'Dirección de entrega especial', 2);

INSERT INTO detallePedido (idPedido, idProducto, cantidad, numero_linea) VALUES
(10, 1, 2, 1),
(12, 2, 1, 1),
(10, 3, 3, 1);

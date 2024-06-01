# bd

Consultas 
1.Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
~~~mysql
SELECT o.idOficina, c.ciudad
FROM oficina o
INNER JOIN codigoPostal cp ON o.idCodigoPostal = cp.idCodigoPostal
INNER JOIN ciudad c ON cp.idCiudad = c.idCiudad;
~~~




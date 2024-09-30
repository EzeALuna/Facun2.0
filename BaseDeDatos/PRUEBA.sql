select * from Alumnos

select * from Materias

select * from carreras

SELECT DISTINCT C.nombre, C.estado, C.a�o from Alumnos A 
INNER JOIN Carreras B ON A.id_carrera = B.id_carrera 
INNER JOIN Materias C ON B.id_carrera = C.id_carrera WHERE A.nombre = 'HUGO'
ORDER BY C.a�o

CREATE PROCEDURE MostrarMaterias
@DNI INT
AS
BEGIN
    SELECT DISTINCT A.dni, C.nombre, C.estado, C.a�o from Alumnos A 
INNER JOIN Carreras B ON A.id_carrera = B.id_carrera 
INNER JOIN Materias C ON B.id_carrera = C.id_carrera WHERE A.dni = @DNI
ORDER BY C.a�o
END
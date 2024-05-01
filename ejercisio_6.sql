--6 - Crear un procedimiento que tome a todos los estudiantes de deportes y les aumente
--2 créditos, en caso de no existir ninguno no hacer nada.
CREATE OR REPLACE PROCEDURE aumentar_creditos_deportes
AS
BEGIN
    UPDATE estudiantes
    SET creditos = creditos + 2
    WHERE especialidad = 'Deportes';
    
END aumentar_creditos_deportes;

EXECUTE aumentar_creditos_deportes;
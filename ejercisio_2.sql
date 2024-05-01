--2 - Hay una tabla llamada especialidades, que contiene 3 campos:
--? Especialidad: es el nombre de la especialidad ejemplos (Nutrición, Computación…).
--? Total créditos: es la suma de todos los créditos de los estudiantes que tienen esa
--especialidad.
--? Total estudiantes: es el conteo total de estudiantes que tienen esa especialidad.
-- un procedimiento que actualice los valores de dicha tabla.
CREATE OR REPLACE PROCEDURE update_especialidades AS
BEGIN
FOR rec IN (SELECT especialidad, SUM(creditos) AS total_creditos, COUNT(*) AS total_estudiantes
              FROM estudiantes
              GROUP BY especialidad)
  LOOP
    UPDATE especialidades
    SET totalcreditos = rec.total_creditos,
        totalestudiantes = rec.total_estudiantes
    WHERE especialidad = rec.especialidad;
  END LOOP;
END update_especialidades;

execute update_especialidades;
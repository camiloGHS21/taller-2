--2 - Hay una tabla llamada especialidades, que contiene 3 campos:
--? Especialidad: es el nombre de la especialidad ejemplos (Nutrición, Computación…).
--? Total créditos: es la suma de todos los créditos de los estudiantes que tienen esa
--especialidad.
--? Total estudiantes: es el conteo total de estudiantes que tienen esa especialidad.
-- un procedimiento que actualice los valores de dicha tabla.
CREATE OR REPLACE PROCEDURE update_especialidades AS
BEGIN
DELETE FROM especialidades;
FOR i in (SELECT especialidad as especialidad, SUM(creditos) as creditos, COUNT(*) as student FROM estudiantes GROUP BY especialidad)LOOP
    Insert into especialidades values(i.especialidad, i.creditos, i.student);
    END LOOP;
    commit;
END;

execute update_especialidades;

select * from especialidades;

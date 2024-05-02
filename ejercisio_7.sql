--7 - crear una función que retorne el futuro correo electrónico del estudiante, el correo
--debe de ser:
--● Primeras 2 letras del nombre del estudiante.
--● punto.
--● Primeras 2 letras del apellido.
--● guión medio.
--● Año en curso y luego el id del estudiante.
--● terminará en ‘@colegio.com’
--ejemplo: estudiante ID 7:
--7 Barbara Buitrago Economia 5
--Su correo:
--ba.bu-20247@colegio.com
--Nota: en caso de que el estudiante no exista avisar.
CREATE OR REPLACE FUNCTION generar_correo_estudiante(student_id  NUMBER)
RETURN VARCHAR2
IS
    v_nombre estudiantes.nombre%TYPE;
    v_apellido estudiantes.apellido%TYPE;
    v_correo VARCHAR2(100);
BEGIN
    SELECT LOWER(nombre), LOWER(apellido) INTO v_nombre, v_apellido
    FROM estudiantes
    WHERE id = student_id;
    
    v_correo := SUBSTR(v_nombre, 1, 2) || '.' || SUBSTR(v_apellido, 1, 2) || '-' || TO_CHAR(SYSDATE, 'YYYY') || student_id || '@colegio.com';
    
    RETURN v_correo;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'no existe el estudiante';
END generar_correo_estudiante;

select  generar_correo_estudiante(1) from DUAL;

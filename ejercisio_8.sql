--8 - Determinar el nivel poblacional de las matrículas de cursos, ósea: “contar cuantas
--matrículas tiene cada curso” clasificar en:
--● Baja: de 0 a 10 estudiantes.
--● Media: de 11 a 20 estudiantes.
--● Alta: más de 21 estudiantes.
DECLARE
    v_curso cursos.ncurso%TYPE;
    v_cantidad NUMBER;
    v_nivel VARCHAR2(10);
BEGIN
    FOR rec IN (SELECT ncurso, COUNT(*) AS cantidad
                FROM matriculas
                GROUP BY ncurso)
    LOOP
        v_curso := rec.ncurso;
        v_cantidad := rec.cantidad;
        
        IF v_cantidad BETWEEN 0 AND 10 THEN
            v_nivel := 'Baja';
        ELSIF v_cantidad BETWEEN 11 AND 20 THEN
            v_nivel := 'Media';
        ELSE
            v_nivel := 'Alta';
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('Curso ' || v_curso || ': ' || v_cantidad || ' estudiantes - Nivel ' || v_nivel);
    END LOOP;
END;
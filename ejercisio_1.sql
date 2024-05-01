--1 - Se pide el nombre de un estudiante por pantalla; decir cuántos estudiantes tienen el
--mismo nombre, en caso de que no existan avisar.
SET SERVEROUTPUT ON;
DECLARE
  v_student_name estudiantes.nombre%TYPE;
  v_student_count NUMBER;
BEGIN
  v_student_name := '&student_name';
  SELECT COUNT(*) INTO v_student_count FROM estudiantes WHERE nombre = v_student_name;
  
  IF v_student_count > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Hay ' || v_student_count || ' estudiantes con el nombre ' || v_student_name);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No existe ningún estudiante con el nombre ' || v_student_name);
  END IF;
END;
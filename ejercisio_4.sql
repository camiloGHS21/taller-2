--4 - Mostrar por pantalla al estudiante con el ID mayor y al estudiante con el ID menor.

DECLARE
  v_id_es_menor estudiantes.id%TYPE;
  v_id_es_mayor estudiantes.id%TYPE;
  v_nombre_menor estudiantes.nombre%TYPE;
  v_nombre_mayor estudiantes.nombre%TYPE;
BEGIN
  SELECT id, nombre INTO v_id_es_menor, v_nombre_menor
  FROM estudiantes
  WHERE id = (SELECT MIN(id) FROM estudiantes);
  SELECT id, nombre INTO v_id_es_mayor, v_nombre_mayor
  FROM estudiantes
  WHERE id = (SELECT MAX(id) FROM estudiantes);
  DBMS_OUTPUT.PUT_LINE('Estudiante con el ID menor: ' || v_id_es_menor || ', Nombre: ' || v_nombre_menor);
  DBMS_OUTPUT.PUT_LINE('Estudiante con el ID mayor: ' || v_id_es_mayor || ', Nombre: ' || v_nombre_mayor);
END;

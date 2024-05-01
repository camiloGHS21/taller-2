--5 - Crear un trigger que garantice que un estudiante no va tener menos de 6 créditos ni
--más de 15.

CREATE OR REPLACE TRIGGER estudiante_credito
BEFORE INSERT OR UPDATE ON estudiantes
FOR EACH ROW
DECLARE
    v_total_creditos NUMBER;
BEGIN
    -- Calcular el total de créditos del estudiante
    SELECT SUM(creditos)
    INTO v_total_creditos
    FROM estudiantes
    WHERE id = :NEW.id;
    -- Validar el rango de créditos
    IF v_total_creditos < 6 OR v_total_creditos > 15 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El estudiante no puede tener menos de 6 ni más de 15 créditos.');
    END IF;
END;

EXECUTE estudiante_credito;

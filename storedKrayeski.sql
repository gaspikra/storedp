use hoteles;
DELIMITER //
CREATE PROCEDURE ordenamiento(IN columna CHAR(15), IN tipo_orden CHAR(4))
BEGIN
    SET @calculo = CONCAT('SELECT * FROM habitaciones ORDER BY ', columna, ' ', tipo_orden);
    PREPARE stmt FROM @calculo;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;
call ordenamiento ('capacidad','asc');

DELIMITER //
CREATE PROCEDURE eliminacion_por_fecha(in fecha date)
BEGIN
delete from estadia where retiro<fecha;
END//
DELIMITER ;
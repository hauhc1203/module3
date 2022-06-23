USE classicmodels;

DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//

CREATE PROCEDURE findAllCustomers()

BEGIN

SELECT * FROM customers where customerNumber = 175;

END //

call	 findAllCustomers();
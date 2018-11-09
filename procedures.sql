-- Get total number of bookings made for each payment method --
DELIMITER #
CREATE PROCEDURE getTotalBookingsByPaymentMethod()
BEGIN
	SELECT DISTINCT payment_method AS "Payment Method", 
					COUNT(book_id) AS "Total number of bookings"
	FROM books B
	GROUP BY payment_method
	ORDER BY payment_method;
END #
DELIMITER ;

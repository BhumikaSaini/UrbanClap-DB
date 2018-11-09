-- Get the total number of services available given a category & city --
DELIMITER #
CREATE FUNCTION getTotalServicesByCategoryAndCity(category TEXT, city TEXT)
RETURNS INT
BEGIN
	DECLARE ans INT;
	SELECT DISTINCT COUNT(S.serv_id) INTO ans
			FROM SERVICE S INNER JOIN CITY CTY ON S.city_id = CTY.city_id
							INNER JOIN belongs_to BT ON S.serv_id = BT.serv_id
							INNER JOIN CATEGORY C ON C.cat_id = BT.cat_id
			WHERE C.cat_name=category AND CTY.city_name=CITY;
	RETURN ans;
END #
DELIMITER ;

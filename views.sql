-- Get details of the offers provided by various services --
CREATE VIEW getOffersByServices AS
SELECT DISTINCT S.serv_name AS "SERVICE NAME", 
		 		O.off_name AS "OFFER NAME", 
		 		O.off_desc AS "DESCRIPTION", 
		 		O.off_discount AS "DISCOUNT" 
FROM SERVICE S INNER JOIN proposes P ON S.serv_id=P.serv_id 
			   INNER JOIN OFFER O ON O.off_id=P.off_id;

-- Log all the insertions and updates in OFFER table --

DELIMITER #
CREATE TRIGGER before_insert_OFFER
BEFORE INSERT ON OFFER
FOR EACH ROW
BEGIN
	INSERT INTO log_OFFERS
	SET action="INSERT", off_id=new.off_id,
	off_name=new.off_name, off_desc=new.off_desc,
	off_discount=new.off_discount, changed_on=now();
END #
DELIMITER ;

DELIMITER #
CREATE TRIGGER after_update_OFFER
AFTER UPDATE ON OFFER
FOR EACH ROW
BEGIN
	INSERT INTO log_OFFERS
	SET action="UPDATE", off_id=old.off_id,
	off_name=old.off_name, off_desc=old.off_desc,
	off_discount=old.off_discount, changed_on=now();
END #
DELIMITER ;
-- update user if email is valid
DELIMITER $$
DROP TRIGGER IF EXISTS validemail$$
CREATE -- DEFINER=`root`@`127.0.0.1`
TRIGGER `validemail`
BEFORE UPDATE ON `users` FOR EACH ROW
BEGIN
IF NEW.email <> OLD.email THEN
SET NEW.valid_email = 0;
END IF;
END;
$$
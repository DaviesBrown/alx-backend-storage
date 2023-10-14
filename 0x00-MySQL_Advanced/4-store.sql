-- update items store on each order
DELIMITER $$
DROP TRIGGER IF EXISTS `store`$$
CREATE -- DEFINER=`root`@`127.0.0.1`
TRIGGER `store`
AFTER INSERT ON `orders` FOR EACH ROW
BEGIN
UPDATE `items` SET quantity = quantity - NEW.number
WHERE `items`.`name` = NEW.item_name;
END
$$

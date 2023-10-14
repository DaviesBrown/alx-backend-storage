-- average weighted score
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE user_id INT;
    
    -- Declare a cursor to iterate over all user_ids
    DECLARE cur CURSOR FOR SELECT id FROM users;
    
    -- Variables for storing total_score and total_weight
    DECLARE total_score DECIMAL(10, 4);
    DECLARE total_weight INT;
    
    -- Variables for temporary storage of cursor values
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET @done = 1;
    
    -- Open the cursor
    OPEN cur;
    
    -- Initialize total_score and total_weight
    SET total_score = 0;
    SET total_weight = 0;
    
    -- Iterate through users and calculate the total weighted score and weight
    @done = 0;
    read_loop: LOOP
        FETCH cur INTO user_id;
        IF @done = 1 THEN
            LEAVE read_loop;
        END IF;
        
        -- Calculate the total weighted score and weight for the user
        SELECT SUM(c.score * p.weight), SUM(p.weight)
        INTO total_score, total_weight
        FROM corrections c
        JOIN projects p ON c.project_id = p.id
        WHERE c.user_id = user_id;
        
        -- Calculate the average weighted score for the user
        IF total_weight > 0 THEN
            UPDATE users
            SET average_score = total_score / total_weight
            WHERE id = user_id;
        ELSE
            UPDATE users
            SET average_score = 0
            WHERE id = user_id;
        END IF;
        
        -- Reset total_score and total_weight for the next user
        SET total_score = 0;
        SET total_weight = 0;
    END LOOP;
    
    -- Close the cursor
    CLOSE cur;
END //

DELIMITER ;

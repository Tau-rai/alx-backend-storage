-- This script contains a procedure that computes and store the average score for a student

DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE average_score DECIMAL(5, 2);
    
    SELECT AVG(score) INTO avg_score 
    FROM corrections 
    WHERE user_id = users.id;
    
    UPDATE users
    SET average_score = avg_score
    WHERE id = user_id;
END $$

DELIMITER ;
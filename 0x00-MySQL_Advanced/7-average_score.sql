-- This script contains a procedure that computes and store the average score for a student

DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE average_score DECIMAL(5,2);

    -- Ensure that no division by zero occurs
    IF (SELECT COUNT(*) FROM corrections WHERE user_id = user_id) > 0 THEN
        SELECT AVG(score) INTO average_score
        FROM corrections
        WHERE user_id = user_id;
    ELSE
        SET average_score = 0;
    END IF;

    UPDATE users
    SET average_score = average_score
    WHERE id = user_id;
END $$

DELIMITER ;
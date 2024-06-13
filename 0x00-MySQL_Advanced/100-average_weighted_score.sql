-- This script creates a stored procedure that computes the average weighted score for a student
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE weighted_avg_score DECIMAL(5,2);

    -- Ensure that no division by zero occurs
    IF (SELECT COUNT(*) FROM corrections WHERE user_id = user_id) > 0 THEN
        SELECT SUM(c.score * p.weight) / SUM(p.weight) INTO weighted_avg_score
        FROM corrections c
        JOIN projects p ON c.project_id = p.id
        WHERE c.user_id = user_id;
    ELSE
        SET weighted_avg_score = 0;
    END IF;

    UPDATE users
    SET average_score = weighted_avg_score
    WHERE id = user_id;
END $$

DELIMITER ;
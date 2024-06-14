-- This script creates a stored procedure that computes the average weighted score for all students
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    -- Temporary table to store the weighted average scores
    DROP TEMPORARY TABLE IF EXISTS temp_weighted_avg_scores;
    CREATE TEMPORARY TABLE temp_weighted_avg_scores (
        user_id INT,
        weighted_avg_score FLOAT
    );

    -- Calculate the weighted average score for each user
    INSERT INTO temp_weighted_avg_scores (user_id, weighted_avg_score)
    SELECT 
        c.user_id, 
        IF(SUM(p.weight) > 0, SUM(c.score * p.weight) / SUM(p.weight), 0) AS weighted_avg_score
    FROM 
        corrections c
    JOIN 
        projects p ON c.project_id = p.id
    GROUP BY 
        c.user_id;

    -- Update the users table with the calculated scores
    UPDATE 
        users u
    JOIN 
        temp_weighted_avg_scores t ON u.id = t.user_id
    SET 
        u.average_score = t.weighted_avg_score;

    -- Clean up the temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_weighted_avg_scores;
END $$

DELIMITER ;
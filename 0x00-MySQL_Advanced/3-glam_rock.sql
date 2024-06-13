-- This query list bands that have Glam rock as their main style
-- ranked by their longevity

SELECT band_name, (2022 - formed) AS lifespan
FROM metal_bands
WHERE style = 'Glam rock' AND formed IS NOT NULL
ORDER BY lifespan DESC;
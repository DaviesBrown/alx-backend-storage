-- lists all bands with glam rock as their style
SELECT band_name, YEAR(
    DATE_SUB(CASE
                WHEN split IS NULL THEN makedate(2022,1)
                ELSE MAKEDATE(split, 1) 
            END, 
            INTERVAL formed YEAR)
) AS lifespan
FROM metal_bands 
WHERE style LIKE '%Glam rock%' 
ORDER BY lifespan DESC;

-- ranks country origin of bands by all fans
SELECT origin, SUM(fans) AS nb_fans 
FROM `metal_band`
GROUP BY origin
ORDER BY SUM(fans) DESC;

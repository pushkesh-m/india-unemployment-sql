USE unemployment_india;
 
DROP TABLE IF EXISTS unemployment;
 
CREATE TABLE unemployment (
    id                        INT AUTO_INCREMENT PRIMARY KEY,
    region                    VARCHAR(100),
    date                      VARCHAR(20),
    frequency                 VARCHAR(20),
    unemployment_rate         DECIMAL(5,2),
    estimated_employed        BIGINT,
    labour_participation_rate DECIMAL(5,2),
    area                      VARCHAR(10)
);

SELECT * FROM unemployment;

SELECT COUNT(*) FROM unemployment;
SELECT * FROM unemployment LIMIT 5;

-- FIXING REGION 
SHOW COLUMNS FROM unemployment;

ALTER TABLE unemployment 
RENAME COLUMN `region` TO Region;
-- RENAME COLUMN `ï»¿Region` TO Region;

SELECT * FROM unemployment LIMIT 5;

ALTER TABLE unemployment
RENAME COLUMN `Estimated Unemployment Rate (%)` to Unemployment_Rate;

ALTER TABLE unemployment
RENAME COLUMN `Estimated Labour Participation Rate (%)` TO labour_participation_rate;

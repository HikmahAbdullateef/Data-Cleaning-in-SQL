SELECT *
FROM layoffs;

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT layoffs_staging
SELECT *
FROM layoffs;


SELECT *
FROM layoffs_staging;

SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, industry, total_laid_off, country, `date`) AS duplicate_check
FROM layoffs_staging;

WITH DuplicateCheck AS (SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, country, stage, funds_raised_millions, `date`) AS duplicate_check
FROM layoffs_staging)
SELECT *
FROM Duplicatecheck
WHERE duplicate_check>1;

SELECT *
FROM layoffs_staging
WHERE company='CASPER';

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_number` int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, country, stage, funds_raised_millions, `date`) AS duplicate_check
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2
WHERE `row_number`>1;

DELETE
FROM layoffs_staging2
WHERE `row_number`>1;

SET SQL_SAFE_UPDATES = 0;

SELECT company
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = Trim(company);

SELECT Distinct Industry
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE '%curr%';

UPDATE layoffs_staging2
SET industry = "Crypto"
WHERE industry LIKE '%curr%';

SELECT Distinct country, TRIM(TRAILING '.' FROM Country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM Country)
WHERE country LIKE '%States%';

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y') new_date
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM layoffs_staging2
ORDER BY 1;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = ' ';

SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 
SET industry = null
WHERE industry = ' ';

SELECT *
FROM layoffs_staging2 
WHERE company = 'Airbnb';

SELECT *
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN `row_number`;

DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

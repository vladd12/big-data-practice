/* script.pig */
medicineDB = LOAD 'medicine.txt' USING PigStorage(',') AS (id:int, title:chararray, active:chararray, gender:chararray, rating:int); -- load data
activeMed = GROUP medicineDB by active; -- grouping data
sum = FOREACH activeMed GENERATE group, SUM(medicineDB.rating) as ratingSum;
sumOrd = ORDER sum by ratingSum DESC;
STORE sumOrd INTO 'result' USING PigStorage(',');
DUMP sumOrd;

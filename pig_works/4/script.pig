/* script.pig */

/* Loading Data */
booksDB = LOAD 'books.txt' USING PigStorage(',') AS (isdn:int, title:chararray, authr:chararray, year:int, publisher:chararray);

/* Grouping Books with year */
grouped = GROUP booksDB by year;
count = FOREACH grouped GENERATE group, COUNT(booksDB);
STORE count INTO 'result/res1' USING PigStorage(',');
DUMP count;

/* Grouping Books with author */
grouped = GROUP booksDB by authr;
count = FOREACH grouped GENERATE group, COUNT(booksDB);
STORE count INTO 'result/res2' USING PigStorage(',');
DUMP count;


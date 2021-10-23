/* script.pig */

/* Load Data */
moviesDB = LOAD 'movies.txt' USING PigStorage(',') AS (id:int, title:chararray, year:int, genre:chararray, rating:int);

/* Filtering Data */
filtered = FILTER moviesDB by rating >= 4;
STORE filtered INTO 'result/res1' USING PigStorage(',');
DUMP filtered;

/* Grouping Data */
grouped = GROUP moviesDB by year;
counters = FOREACH grouped GENERATE group, COUNT(moviesDB);
STORE counters INTO 'result/res2' USING PigStorage(',');
DUMP counters;

/* Sorting Data */
sorted = ORDER moviesDB by year DESC;
STORE sorted INTO 'result/res3' USING PigStorage(',');
DUMP sorted;

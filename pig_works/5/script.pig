/* script.pig */

/* Loading Data */
medicineDB = LOAD 'medicine.txt' USING PigStorage(',') AS (id:int, title:chararray, active:chararray, gender:chararray, rating:int);

/* Define Macros */
DEFINE my_macros(V, col, value)
    returns B { $B = FILTER $V by $col == '$value'; };

/* Using Macros */
result = my_macros(medicineDB, active, 'metacin');
STORE result INTO 'result' USING PigStorage(',');
DUMP result;

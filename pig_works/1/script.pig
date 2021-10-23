/* script.pig
Testing features of Pig Latina. */

A = LOAD 'employee_details.txt' USING PigStorage(',') AS (id:int, name:chararray, salary:int, ratings:int); -- load data
B = LOAD 'employee_expenses.txt' USING PigStorage(',') AS (id:int, expenses:int); -- load data

sorted = ORDER A by ratings DESC; -- sorting with 1 param
result = LIMIT sorted 3; -- get 3 value from sorted
DUMP result; -- print result

sorted = ORDER A by ratings DESC, name ASC; -- multi-sorting with 2 params
result = LIMIT sorted 3;
DUMP result;

grouped = GROUP A by ratings; -- grouping with 1 param
DUMP grouped;
mGrouped = GROUP A by (ratings, salary); -- multi-grouping with 2 params
DUMP mGrouped;

/* Generate for each tuple from "grouped"
count of employees in this tuple */
result = FOREACH grouped GENERATE group, COUNT(A.ratings);
DUMP result;

filtered = FILTER A by ratings >= 4; -- filtering with 1 param
DUMP filtered;
filtered = FILTER A by (ratings >= 4) and (salary > 1000); -- multi-filtering with 2 params
DUMP filtered;

STORE filtered INTO 'output' USING PigStorage(','); -- storing alias in path

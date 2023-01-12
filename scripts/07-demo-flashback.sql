/* source 07-demo-flashback.sql */

/* Setup */
DROP TABLE IF EXISTS test.r1, test.r2;
CREATE TABLE test.r1(id int PRIMARY KEY);

/* Insert values into test.r1 */
INSERT INTO test.r1 (id) VALUES (1);
INSERT INTO test.r1 (id) VALUES (2);

SELECT COUNT(*), NOW() FROM test.r1;

/* Check GC safe point test.r1 */
SELECT * FROM mysql.tidb WHERE variable_name = "tikv_gc_safe_point";

DROP TABLE test.r1;

/* ERROR 1146 is expected */
SELECT COUNT(*) FROM test.r1;

/* Extract the table test.r1 and its rows from previous version to test.r2 within the GC safe-point window */
FLASHBACK TABLE test.r1 TO r2;

/* You can access the data from test.r2 now */
SELECT COUNT(*) FROM test.r2;

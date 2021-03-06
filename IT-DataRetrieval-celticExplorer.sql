CREATE DATABASE celticExplorerDatabase;
USE celticExplorerDatabase;

# TCL SESSION #1: COMMIT, EDITS, & ROLLBACK
SET autocommit = 0; # MYSQL AUTOMATICALLY COMMITS CHANGES, DISABLE THIS
START TRANSACTION;
COMMIT;
DELETE FROM celticExplorer WHERE Second = 9;
ROLLBACK; # TO COMMIT
SELECT * FROM celticExplorer;

# TCL STATEMENT #3: EDITS, SAVEPOINT, EDITS, & ROLLBACK
INSERT INTO celticExplorer VALUES (2021, 2, 18, 16, 46, 38, 49.699051, -8.9256, 50.0126, 10.40, 35.23, 1002.6, 10.64, 1002.15, 417.5, 403.6, 402.1);
INSERT INTO celticExplorer VALUES (2021, 2, 18, 16, 48,	7,	49.700081,	-8.9255,	50.0170,	10.40,	35.23,	1002.8,	10.64,	1001.81,	417.2,	403.3,	401.7);
INSERT INTO celticExplorer VALUES (2021, 2, 18, 16, 49,	36,	49.701111,	-8.9253,	50.0214,	10.39,	35.23,	1002.7,	10.63,	1002.22,	417.6,	403.7,	402.2);
SAVEPOINT savePoint1;
DELETE FROM celticExplorer WHERE DayOfYear = 49.701111;
ROLLBACK TO SAVEPOINT savePoint1;
SELECT * FROM celticExplorer;

# TCL SESSION #4: EDITS, COMMIT, EDITS, SAVEPOINT, EDITS, & ROLLBACK
COMMIT;
INSERT INTO celticExplorer VALUES (2021,	2,	18,	16,	54,	3,	49.704201,	-8.9249,	50.0343,	10.38,	35.22,	1002.3,	10.63,	1002.13, 417.6,	403.6,	402.1);
SAVEPOINT savePoint2;
INSERT INTO celticExplorer VALUES (2021,	2,	18,	17,	28,	54,	49.728403,	-8.9074,	50.1375, 	10.30,	35.20,	1001.9,	10.54,	1001.45, 418.1,	403.9,	402.3);
ROLLBACK; # SKIPS OVER SAVEPOINT2, GOES BACK TO SAVEPOINT 1, NOW COMMIT
SELECT * FROM celticExplorer;
-- JOINS TUTORIALS
CREATE TABLE A(
    AID INT,
    VALUE VARCHAR(10)
);
CREATE TABLE B(
    BID INT,
    VALUE VARCHAR(10)
);
CREATE TABLE C(
    CID INT,
    VALUE VARCHAR(10)
);
INSERT INTO A (AID, VALUE) VALUES (1, 'A1'), (2, 'A2'), (3, 'A3'), (5, 'A5');
INSERT INTO B (BID, VALUE) VALUES (2, 'B2'), (3, 'B3'), (4, 'B4'), (6, 'B6');
INSERT INTO C (CID, VALUE) VALUES (3, 'C3'), (4, 'C4'), (7, 'C7');

-- INNER JOIN (Gives common records/rows)
SELECT *
FROM A INNER JOIN B
ON A.AID = B.BID;

-- LEFT JOIN (Gives common records/rows + all the rows from left table by putting NULL in place of right table)
SELECT *
FROM A LEFT JOIN B
ON A.AID = B.BID;

-- RIGHT JOIN (Gives common records/rows + all the rows from right table by putting NULL in place of left table)
SELECT *
FROM A RIGHT JOIN B
ON A.AID = B.BID; 

-- FULL JOIN (Gives common records/rows + all the rows from left/right table by putting NULL in place of right/left table respectively)
SELECT *
FROM A FULL OUTER JOIN B
ON A.AID = B.BID;

-- JOINING MULTIPLE TABLES
SELECT *
FROM A INNER JOIN B ON A.AID = B.BID
       INNER JOIN C ON A.AID = C.CID;
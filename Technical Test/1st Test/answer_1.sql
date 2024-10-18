CREATE DATABASE test_1;
USE test_1;
CREATE TABLE customers (id varchar(255), customer varchar(255));

INSERT INTO customers values ('OFA00000053', 'ABBAS, Mohammad Hasan (a.k.a. ABBAS, Mohammad Hassan; a.k.a. ABBAS, Muhammad), Damascus, Syria; DOB 01 Sep 1964; POB Al Ladhiqiyah, Syria; Gender Male (individual)');
INSERT INTO customers values ('OFA00000054', 'ABDULAH, Hassanudin (a.k.a. ABDUL, Hasanudin; a.k.a. ABDULLAH, Hasanudin), Damascus, Syria; DOB 01 Sep 1964; POB Al Ladhiqiyah, Syria; Gender Male (individual)');

SELECT 
	id,
    SUBSTRING_INDEX(TRIM(customer), '(', 1) AS Nama1,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(customer, '(a.k.a.', -1), ';', 1)) AS Nama2,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(customer, '; a.k.a.', -1), ')', 1)) AS Nama3,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(customer, '), ', -1), ';', 1)) AS Alamat,
    DATE_FORMAT(STR_TO_DATE(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(customer, 'DOB ', -1), ';', 1)), '%d %b %Y'), '%Y%m%d') AS DOB,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(customer, 'POB ', -1), ';', 1)) AS POB,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(customer, 'Gender ', -1), ' (', 1)) AS Gender
FROM 
    customers;

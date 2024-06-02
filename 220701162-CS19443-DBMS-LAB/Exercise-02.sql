
1. Run the statement in the lab8_1.sql script to build the MY_EMPLOYEE table that will be used
   for the lab.

	CREATE TABLE my_employee
	(id NUMBER(4) CONSTRAINT my_employee_id_nn NOT NULL,
	last_name VARCHAR2(25),
	first_name VARCHAR2(25),
	userid VARCHAR2(8),
	salary NUMBER(9,2));


2. Add the first row of data to the MY_EMPLOYEE table from the following sample data. Do not list
   the columns in the INSERT clause.

	ID 	LAST_NAME 	FIRST_NAME 	USERID 		SALARY

	1 	Patel 		Ralph 		rpatel 		895
	2 	Dancs 		Betty 		bdancs 		860
	3 	Biri 	   	Ben 	  	bbiri 		1100
	4 	Newman 		Chad 	  	cnewman 	750
	5 	Ropeburn 	Audrey 		aropebur	1550
	
	INSERT INTO my_employee
	VALUES (1, ’Patel’, ’Ralph’, ’rpatel’, 895);

3.Display the table with values.
           
            Select * from my_employee


4. Populate the table with the next two rows of sample data by running the insert statement in the
   script that you created.

	INSERT INTO my_employee
	VALUES (&p_id, ’&p_last_name’, ’&p_first_name’,
	lower(substr(’&p_first_name’, 1, 1) ||
	substr(’&p_last_name’, 1, 7)), &p_salary);


5. Make the data additions permanent.

	COMMIT;


6. Change the last name of employee 3 to Drexler.
    UPDATE my_employee

	SET last_name = ’Drexler’
	WHERE id = 3;

7. Change the salary to 1000 for all employees with a salary less than 900.

	UPDATE my_employee
	SET salary = 1000
	WHERE salary < 900;


8. Delete Betty Dancs from the MY_EMPLOYEE table.
	
	DELETE
	FROM my_employee
	WHERE last_name = ’Dancs’;

9.Empty the fourth row of the emp table.

   Delete from my_employee where id=4;
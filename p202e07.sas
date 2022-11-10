/* Exercise 7 */

proc print data = orion.employee_organization;
run;

data sales execs;
	set orion.employee_organization;
	if Department in ('Sales', 'Sales Management') then output sales;
	else if Department = 'Executives' then output execs;
run;

proc print data = sales (obs = 6);
run;

proc print data = execs (firstobs = 2 obs = 3);
run;



		

/* Exercise 4 */

proc print data = orion.employee_organization;
run;

proc contents data = orion.employee_organization;
run;

data admin stock purchasing;
 set orion.employee_organization;	
	 select (upcase(Department));
	 	when ('ADMINISTRATION') output admin;
		when ('STOCK & SHIPPING') output stock;
		when ('PURCHASING') output purchasing;
		otherwise;
	end;
run;

title 'Department: Administration';
proc print data = admin;
run;

title 'Department: Stock & Shipping';
proc print data = stock;
run;

title 'Department: Purchasing';
proc print data = purchasing;
run;

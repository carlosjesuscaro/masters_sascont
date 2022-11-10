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
title;

title 'Department: Stock & Shipping';
proc print data = stock;
run;
title;

title 'Department: Purchasing';
proc print data = purchasing;
run;
title;

/* Exercise 5 */

proc print data = orion.orders;
run;

data fast slow veryslow;
	set orion.orders;
		where Order_Type in (2, 3);
		ShipDays = Delivery_Date - Order_Date;
		if ShipDays < 3 then output fast;
		else if 5 <= ShipDays <= 7 then output slow;
		else if ShipDays > 7 then output veryslow; 
	drop Employee_ID;
run;

title 'Orders taking more than 7 days to deliver';
proc print data = fast;
run;
title;

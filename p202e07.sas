/* Exercise 7 */

proc print data = orion.employee_organization;
run;

data sales execs;
	set orion.employee_organization;
	if Department in ('Sales', 'Sales Management') then output sales;
	else if Department = 'Executives' then output execs;
run;

title 'Sales';
proc print data = sales (obs = 6);
run;
title;

title 'Executives';
proc print data = execs (firstobs = 2 obs = 3);
run;
title;

/* Exercise 8 */

proc print data = orion.orders;
run;

data instore (keep=Order_ID Customer_ID Order_Date) delivery (keep=Order_ID Customer_ID Order_Date ShipDays);
	set orion.orders;
	where Order_Type = 1;
	ShipDays = Delivery_Date - Order_Date;
	if ShipDays = 0 then output instore;
	else if ShipDays > 0 then output delivery;
run;

title 'In Store';
proc print data = instore;
run;
title;

title 'Delivery';
proc print data = delivery;
run;
title;

title 'In store per year';
proc freq data = instore;
	tables Order_Date;
	format Order_Date year.;
run;
title;


/* Exercise 1 */

proc print data  = orion.au_salesforce;
run;

data codes;
	set orion.au_salesforce;
	FCode1 = lowcase(substr(First_Name,1,1));
	FCode2 = lowcase(substr(First_Name,length(First_Name),1));
	LCode = lowcase(substr(Last_Name,1,4));
run;

proc print data = codes;
	var First_Name FCode1 FCOde2 Last_Name LCode;
run;

/* Exercise 2 */
proc print data  = orion.newcompetitors;
run;

data competition;
	set orion.newcompetitors;
	Country = substr(ID,1,2);
	Store_Code = left(substr(ID,3));
	if substr(Store_Code, 1, 1) = '1';
	City = propcase(City);
run;

title 'Small Stores';
proc print data = competition noobs;
	var Store_Code Country City Postal_Code;
run;
title;

/* Exercise 4 */
proc print data = orion.customers_ex5;
run;

data names;
	set orion.customers_ex5;
	First_Name = propcase(scan(Name, 2, ', '));
	Last_Name = propcase(scan(Name, 1, ' ,'));
	if Gender = 'M' then New_Name = 'Mr. '!!First_Name!!' '!!Last_Name;
	else if Gender = 'F' then New_Name = 'Ms. '!!First_Name!!' '!!Last_Name;
run;

proc print data = names;
	var New_Name Name Gender;
run;

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

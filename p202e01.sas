/* Exercise 1 */

data work.price_increase;
   set orion.prices;
   	Year = 1;
	Unit_Price = Unit_Price * Factor;
	output;
	Year = 2;
	Unit_Price = Unit_Price * Factor;
	output;
	Year =3;
	Unit_Price = Unit_Price * Factor;
	output;
run;
proc print data=work.price_increase;
	var Product_ID Unit_Price Year;
run;

proc print data = orion.prices;
run;

/* Exercise 2 */

proc print data = orion.discount;
run;

data work.extended;
	set orion.discount;
	drop Unit_Sales_Price;
	where Start_Date = '01DEC2011'd;
	Promotion = 'Happy Holidays';
	Season = 'Winter';
	output;
	Start_Date  = '01JUL2012'd;
	End_Date = '21JUL2012'd;
	Season = 'Summer';
	output;
run;

title 'All discount ranges with the Happy Holidays';
proc print data = work.extended;
run;
title;

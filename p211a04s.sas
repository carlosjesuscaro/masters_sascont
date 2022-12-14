%let year=2008;
proc print data=orion.order_fact;
   where year(order_date)=&year;
   title "Orders for &year";
run;
proc means data=orion.order_fact mean;
   where year(order_date)=&year;
   class order_type;
   var total_retail_price;
   title "Average Retail Prices for &year Orders";
   title2 "by Order_Type";
run;
title;

data income_expenses;
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   Income=50000000;
   Year=year(today())+1;
   do until (Total_Cost > Income);
      wages = wages * 1.06;
      retire=retire*1.014;
      medical=medical *1.095;
      Total_Cost=sum(wages,retire,medical);
      Income=Income *1.01;
      output;
      year+1;
   end;
run;
proc print data=income_expenses;
   format total_cost income comma14.2;
   var year income total_cost;
run;
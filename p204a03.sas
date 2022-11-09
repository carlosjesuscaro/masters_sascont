/*********************************************************************/
 /* This program uses an INFILE statement to read a raw data file.    */
 /* The INFILE statement includes a full path for Microsoft Windows.  */
 /*                                                                   */
 /* For UNIX or SAS onDemand:                                         */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path/phone2.csv" dlm=',';                 */
 /*                                                                   */
 /* For  z/OS:                                                        */
 /*      Replace  the INFILE statement with the following statement:  */
 /*               infile "&path..rawdata(newemps)" dlm=',';           */
 /*********************************************************************/

data contacts;
   length Name $ 20 Phone Mobile $ 14;
   infile "&path\phone2.csv" dlm=',';
   input Name $ Phone $ Mobile $;
run;

proc print data=contacts noobs;
run;

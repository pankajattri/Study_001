********************************************************************************;
*** Program:        QAGPharma/XMB111/Study111/programs/d0_dm.sas
*** Programmer:     Matt Becker
*** Date Created:   02FEB2014
***
*** Input :         SDTM DM, DS, VS
***
*** Output:         Derived DM dataset
***
*** Purpose:        To create the derived DM dataset
***
*** Comments:
***
*** Software:       SDD 4.x
***
*** Modifications:
***
*** Date       Programmer        Description
*** ---------  ----------------  --------------
*** 4/12/2020   pdesai			modified code
*** 4/13/2020   pdesai			fix some errors
*** 4/14/2020   pdesai			fix some errors
********************************************************************************;


%global base_path;
%macro get_basepath();
%if %symexist(_sasprogramfile) %then %do;
  %let base_path = %substr(&_sasprogramfile,1,%sysfunc(find(&_sasprogramfile,%str(/),-%length(&_sasprogramfile)))-1);
%end;
%else %do;
  %let base_path = %substr(&SYSPROCESSNAME,1,%sysfunc(find(&SYSPROCESSNAME,%str(/),-%length(&SYSPROCESSNAME)))-1);
  %let base_path = %substr(&base_path,8);
%end;
%put &base_path;

%mend get_basepath;

%get_basepath();

%include "&base_path/../../macros/autoexec_viya.sas";

data dm(label="DM Analysis Dataset");
 set derived.dm;
run;

data qc_dm;
	 set derived.dm;
	 run;


proc compare data=dm compare=qc_dm;
	 run;

*%mimpddt(micsv=DM, miin=dm, miout=&derdata..dm, mlbl=DM Analysis Dataset);

%symdel base_path/nowarn;
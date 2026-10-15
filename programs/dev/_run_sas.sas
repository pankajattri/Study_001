/* %global base_path; */
/* %macro get_basepath(); */
/*   %if %symexist(_sasprogramfile) %then %do; */
/*     %let base_path = %substr(&_sasprogramfile,1,%sysfunc(find(&_sasprogramfile,%str(/),-%length(&_sasprogramfile)))-1); */
/*   %end; */
/*   %else %do; */
/*     %let base_path = %substr(&SYSPROCESSNAME,1,%sysfunc(find(&SYSPROCESSNAME,%str(/),-%length(&SYSPROCESSNAME)))-1); */
/*     %let base_path = %substr(&base_path,8); */
/*   %end; */
/*   %put &base_path; */
/* %mend get_basepath; */
/* %get_basepath(); */
%include "data/compute-landingzone/Projects/hlsdata/study_001/programs/dev/../../macros/autoexec_viya.sas";
%run_batch(sas_prg=data/compute-landingzone/Projects/hlsdata/study_003/programs/dev/table_ae.sas);
%run_batch(sas_prg=data/compute-landingzone/Projects/hlsdata/study_003/programs/dev/table_cm.sas);


options noquotelenmax;

%global program_path base_path;
%macro get_basepath();
%if %symexist(_sasprogramfile) %then %do;
  %let program_path = %substr(&_sasprogramfile,1,%sysfunc(find(&_sasprogramfile,%str(/),-%length(&_sasprogramfile)))-1);
%end;
%else %do;
  %let program_path = %substr(&SYSPROCESSNAME,1,%sysfunc(find(&SYSPROCESSNAME,%str(/),-%length(&SYSPROCESSNAME)))-1);
  %let program_path = %substr(&program_path,8);
%end;

%let base_path = %str(&program_path);
%put &program_path;

%mend get_basepath;

%get_basepath();

%include "&program_path/../../macros/autoexec_viya.sas";


%macro run_batch(sas_prg=);

%let sas_path = %substr(&sas_prg,1,%sysfunc(find(&sas_prg,%str(/),-%length(&sas_prg)))-1);
%put sas_path = &sas_path;

%let prg_name = %scan(%scan(&sas_prg,-1,%str(/)),1,%str(.));
%put prg_name = &prg_name;


%AnalyzeIO (SASFile=%str(&sas_prg),
            worklib=%str(),
            file_io=(Y),
            master_io=%str(&program_path./../../lineage/master_io.sas7bdat)
            ); 
%mend run_batch;

%run_batch(sas_prg=%str(&program_path./adam_d0_dm.sas));


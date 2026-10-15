%include "/mnt/viya-share/data/Study_001/macros/analyzeio.sas";
%include "/mnt/viya-share/data/Study_001/macros/run_batch.sas";
%run_batch(sas_prg=/mnt/viya-share/data/Study_001/programs/dev/adam_d0_dm.sas);
%run_batch(sas_prg=/mnt/viya-share/data/Study_001/programs/dev/adam_d1_cm.sas);

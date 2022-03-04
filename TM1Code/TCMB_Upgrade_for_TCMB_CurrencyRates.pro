601,100
602,"TCMB_Upgrade_for_TCMB_CurrencyRates"
562,"NULL"
586,
585,
564,
565,"b6aU2MhFKo6Dj9i`gMaf<01Ry:QYV3XIpKQII6<F5DbtyS4oVputlXsj_ZTdaA>[K7B6kQSC?SupJr@HlG3l5kVZJUi8hV?:FqzqfV^ydEthrpR@4sa\scsD35^W5tATsjBFE[U;uQxgCKqtW7oUDx93eS4i>aC<bp?=w0GkJw<IjY2CG5ZusGh[bhqNzMXdA2PfRMe1"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,","
568,""""
570,
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,13

#****Begin: Generated Statements***
#****End: Generated Statements****



vReturnCode =  ExecuteProcess('TCMB_dim_update_Date', 'pFirstYear', 2020, 'pLastYear', 2021, 'pDim', 'TCMB_Date', 'pCleanFirst', 0);
vReturnCode =  ExecuteProcess('TCMB_dim_update_Date_Hierarchies', 'pDim', 'TCMB_Date');

vReturnCode = ExecuteProcess('TCMB_dim_create_parametric','pDim', 'TCMB_Currency', 'pElementOrderMethod','ByHierarchy', 'pFolder','TM1Code','pCleanFirst',1,'pLoadElSecRule',0);
vReturnCode = ExecuteProcess('TCMB_dim_create_parametric','pDim', 'TCMB_ReferenceCurrency', 'pElementOrderMethod','ByHierarchy', 'pFolder','TM1Code','pCleanFirst',1,'pLoadElSecRule',0, 'pFile','TCMB_Currency.csv');

vReturnCode = ExecuteProcess('TCMB_cube_create_for_TCMB_CurrencyRates', 'pCube', 'TCMB_CurrencyRates');
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,0
900,
901,
902,
938,0
937,
936,
935,
934,
932,0
933,0
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""

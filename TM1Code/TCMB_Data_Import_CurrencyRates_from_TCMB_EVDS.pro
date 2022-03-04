601,100
602,"TCMB_Data_Import_CurrencyRates_from_TCMB_EVDS"
562,"NULL"
586,
585,
564,
565,"p;EMFZxcW\EYIWJfa;;2o2=ox\]m_y=4BKOU`<avROM;6YNlShMCN8ePWOrh@^Iv7k@AfY6[Gu;4p`UU3?pL[rUMx;O8?X;s;S?c^S@PY`W70Dg?7FS4?yYRZyK^8R0yC;jGrU9jj=4_ao]h[B^:<RO5cT8kPNDZiBSvsc3C9m4o7JcxwHdw8o_nl8xjdBQbHAf`Tgat"
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
560,3
pStartDate
pEndDate
pTimeSpanFromNow
561,3
2
2
2
590,3
pStartDate,"2020-05-25"
pEndDate,"2020-05-29"
pTimeSpanFromNow,""
637,3
pStartDate,""
pEndDate,""
pTimeSpanFromNow,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,42

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter='';

IF(pTimeSpanFromNow@= '1w');
    pEndDate = TIMST(NOW(), '\Y-\m-\d');
    pStartDate = TIMST(NOW()-7, '\Y-\m-\d');
ELSEIF(pTimeSpanFromNow@= '2w');
   pEndDate = TIMST(NOW(), '\Y-\m-\d');
   pStartDate = TIMST(NOW()-14, '\Y-\m-\d');
ELSEIF(pTimeSpanFromNow@= '3w');
   pEndDate = TIMST(NOW(), '\Y-\m-\d');
   pStartDate = TIMST(NOW()-21, '\Y-\m-\d');
ELSEIF(pTimeSpanFromNow@= '1m');
   pEndDate = TIMST(NOW(), '\Y-\m-\d');
   pStartDate = TIMST(NOW()-30, '\Y-\m-\d');
ELSEIF(pTimeSpanFromNow@= '1y');
   pEndDate = TIMST(NOW(), '\Y-\m-\d');
   pStartDate = TIMST(NOW()-365, '\Y-\m-\d');
ENDIF;

pyExe = 'E:/Python/python.exe';

vLogFilePath = GetProcessErrorFileDirectory;
vLogFileParentPath = DELET(vLogFilePath,SCAN('tm1logfiles\',vLogFilePath),13);
pyFile = vLogFileParentPath | 'TM1Code' | '\' | 'TCMB_Data_Import_CurrencyRates_from_TCMB_EVDS.py' ;


py_path = pyExe |' '| pyFile |' '| '"' | pStartDate | '"' | ' ' | '"' |  pEndDate | '"' ;
cd_path = 'cd ' | vLogFileParentPath | 'TM1Code';
#'E:/Python/python.exe e:\tcmb_currencyratess\TM1Code\TCMB_Data_Import_CurrencyRates_from_TCMB_EVDS.py "2020-05-25" "2020-05-29"';

vBatFile = vLogFileParentPath | 'TM1Code' | '\' | 'TCMB_Data_Import_CurrencyRates_from_TCMB_EVDS.bat' ;

ASCIIOUTPUT(vBatFile, cd_path);
ASCIIOUTPUT(vBatFile, py_path);




573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,5

#****Begin: Generated Statements***
#****End: Generated Statements****

EXECUTECOMMAND(vBatFile, 1);
576,CubeAction=1511DataAction=1503CubeLogChanges=0_ParameterConstraints=e30
930,0
638,1
804,0
1217,1
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

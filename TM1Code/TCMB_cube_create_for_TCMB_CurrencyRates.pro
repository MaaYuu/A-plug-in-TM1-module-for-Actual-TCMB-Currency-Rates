601,100
602,"TCMB_cube_create_for_TCMB_CurrencyRates"
562,"NULL"
586,
585,
564,
565,"cnTavQKUKKxF>]YgM_ru17A:\^axeroCmMEa\2mWz`X@U:r^F7R_G6GC5XgtP[wT[CKMaKsb1wyArs<Wd\TuOLK<GpVDdl]r[1cVk?w]TQr@qqAmX?^Rc`bXRD:uHGo^]Ea<k[hz;f4MYgqTj2]F:tDGVlxH1cb3J9o]mahJ_`qTZg5e1lGD68y?J<AXpl9xRdgv1uLb"
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
560,1
pCube
561,1
2
590,1
pCube,"TCMB_CurrencyRates"
637,1
pCube,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,21

#****Begin: Generated Statements***
#****End: Generated Statements****

pKup = pCube;


#================ DimensionAttributes ===========================

IF(pKup@='TCMB_CurrencyRates');
vKup=pKup;
vMeasureDim = vKup | '_m';
vDimNumber = 4;

vDim1 = 'TCMB_Date';
vDim2 = 'TCMB_Currency';
vDim3 = 'TCMB_ReferenceCurrency'; 

vReturnCode = ExecuteProcess('TCMB_Kup_Olustur_Parametrik', 'pCube', vKup, 'pMeasureDim', vMeasureDim, 'pDimNumber', vDimNumber,
'pDim1', vDim1, 'pDim2', vDim2, 'pDim3', vDim3, 'pTimeDim', '');
ENDIF;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
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

601,100
602,"TCMB_dim_update_Date"
562,"NULL"
586,"D:\TM1\TM1Models\FPM_Dev\TM1Code\Months.csv "
585,"D:\TM1\TM1Models\FPM_Dev\TM1Code\Months.csv "
564,
565,"dawCagqM1K_NnGyrXrgqZiCFi84MaSJpdJ^[K^S0v47Kci8H0ii2kBcHIAMkHVcGjSnfj@j=SvOb=>8XWM5MgQ\<Db0rPPasOWWxvoHjO>0U@`^i?MHg`]f0jsCzfjeGtI6=ulPrG6D9x`rT5@RUpllMPRXfzFsQ84PmXp3HYt9<oP<J<sm;SWeWH1_BMlJFJiP4VbKk"
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
567,";"
588,"."
589,","
568,""""
570,
571,
569,1
592,0
599,1000
560,4
pFirstYear
pLastYear
pDim
pCleanFirst
561,4
1
1
2
1
590,4
pFirstYear,2020
pLastYear,2021
pDim,"TCMB_Date"
pCleanFirst,0
637,4
pFirstYear,""
pLastYear,""
pDim,""
pCleanFirst,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,92

#****Begin: Generated Statements***
#****End: Generated Statements****

vDim = pDim;

IF(DimensionExists(vDim)=0);
   DimensionCreate(vDim);
   DIMENSIONSORTORDER(vDim,'BYNAME','ASCENDING','BYHIERARCHY','ASCENDING');
ENDIF;

IF(pCleanFirst = 1);
   DimensionDeleteAllElements(vDim);
ENDIF;

vAttr = 'Adi';
ATTRINSERT(vDim, '', vAttr, 'A');

vAttr2 = 'OncekiDonem';
ATTRINSERT(vDim, '', vAttr2, 'S');


vTopConsol = 'All';
DIMENSIONELEMENTINSERT(vDim,'',vTopConsol,'C');

vTopConsolKüm = 'All Cumulatives';
DIMENSIONELEMENTINSERT(vDim,'',vTopConsolKüm,'C');
vEk = ' YTD';

vYear = pFirstYear;
vDay = DayNo( NumberToString(vYear) | '-01-01');
vLastDay = DayNo( NumberToString(pLastYear) | '-12-12');

WHILE(vDay <= vLastDay);

   #============== Inset Year Element
   vYearString = NumberToString(YEAR(DATE(vDay, 1)));
   IF(DIMIX(vDim, vYearString) = 0);
      DIMENSIONELEMENTINSERT(vDim,'',vYearString,'C');
      DIMENSIONELEMENTCOMPONENTADD(vDim,vTopConsol,vYearString,1);

      DIMENSIONELEMENTINSERT(vDim,'',vYearString | vEk,'C');
      DIMENSIONELEMENTCOMPONENTADD(vDim,vTopConsolKüm,vYearString | vEk,1);
   ENDIF;

   #============== Inset Quarter Element
   IF( MONTH(DATE(vDay, 1)) < 4 );
      vQuarterString = NumberToString(YEAR(DATE(vDay, 1))) | '-1Q';
   ELSEIF( MONTH(DATE(vDay, 1)) < 7 );
      vQuarterString = NumberToString(YEAR(DATE(vDay, 1))) | '-2Q';
   ELSEIF( MONTH(DATE(vDay, 1)) < 10 );
      vQuarterString = NumberToString(YEAR(DATE(vDay, 1))) | '-3Q';
   ELSE;
      vQuarterString = NumberToString(YEAR(DATE(vDay, 1))) | '-4Q';
   ENDIF;
   
   IF(DIMIX(vDim, vQuarterString) = 0);
      DIMENSIONELEMENTINSERT(vDim,'',vQuarterString,'N');
      DIMENSIONELEMENTCOMPONENTADD(vDim,vYearString,vQuarterString,1);

      DIMENSIONELEMENTINSERT(vDim,'',vQuarterString | vEk,'N');
      DIMENSIONELEMENTCOMPONENTADD(vDim,vYearString | vEk,vQuarterString | vEk,IF(SCAN('4Q', vQuarterString)>0, 1, 0));
   ENDIF;

   #============== Inset Month Element
   vMonthString = NumberToString(YEAR(DATE(vDay, 1))) | IF(MONTH(DATE(vDay, 1))<10, '-0', '-') | NumberToString(MONTH(DATE(vDay, 1)));
   IF(DIMIX(vDim, vMonthString) = 0);

      DIMENSIONELEMENTINSERT(vDim,'',vMonthString | vEk,'C');
      DIMENSIONELEMENTCOMPONENTADD(vDim, vQuarterString | vEk, vMonthString | vEk,IF(MOD(MONTH(DATE(vDay, 1)), 3)=0, 1, 0));

      DIMENSIONELEMENTINSERT(vDim,'',vMonthString,'C');
      DIMENSIONELEMENTCOMPONENTADD(vDim, vQuarterString, vMonthString,1);

                               #============== Add Months to Cumulative Elements
                                   vCurrentMonth = MONTH(DATE(vDay, 1));
                                   WHILE(vCurrentMonth<=12);
                                      vMonthStringKüm = NumberToString(YEAR(DATE(vDay, 1))) | IF(vCurrentMonth<10, '-0', '-') | NumberToString(vCurrentMonth);
                                      DIMENSIONELEMENTCOMPONENTADD(vDim, vMonthStringKüm | vEk, vMonthString,1);
                                   vCurrentMonth = vCurrentMonth + 1;
                                   END;

   ENDIF;

   #============== Inset Day Element
   vDayString = DATE(vDay, 1);
   DIMENSIONELEMENTINSERT(vDim,'',vDayString,'N');
   DIMENSIONELEMENTCOMPONENTADD(vDim,vMonthString, vDayString,1);

   #============= LOOP
   vDay = vDay + 1;
END;
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,50

#****Begin: Generated Statements***
#****End: Generated Statements****

#=========================INSERT PREVIOUS PERIOD ATTRIBUTE FOR DAYs
vYear = pFirstYear;
vDay = DayNo( NumberToString(vYear) | '-01-01');
vLastDay = DayNo( NumberToString(pLastYear) | '-12-12');

WHILE(vDay <= vLastDay);

   vAttrValue = DATE(vDay-1, 1);
   vEl = DATE(vDay, 1);
   ATTRPUTS(vAttrValue, vDim, vEl, vAttr2);

   vDay = vDay + 1;
END;

#=========================INSERT PREVIOUS PERIOD ATTRIBUTE FOR YEARs & Qs & MONTHs
vYear = pFirstYear;

WHILE(vYear<=pLastYear);

   #=================Put Attribute For Years
   vAttrValue = NumberToString(vYear-1);
   vEl = NumberToString(vYear);
   ATTRPUTS(vAttrValue, vDim, vEl, vAttr2);

   #=================Put Attribute For Quarters
   vQ=1;
   WHILE(vQ<=4);

      vAttrValue = IF(vQ=1, NumberToString(vYear-1), NumberToString(vYear)) | '-' | IF(vQ=1, '4', NumberToString(vQ-1)) | 'Q';
      vEl = NumberToString(vYear) | '-' | NumberToString(vQ) | 'Q';
      ATTRPUTS(vAttrValue, vDim, vEl, vAttr2);
      vQ = vQ + 1;
   END;

   #=================Put Attribute For Months
   vM=1;
   WHILE(vM<=12);

      vAttrValue = IF(vM=1, NumberToString(vYear-1), NumberToString(vYear)) | '-' | IF(vM=1, '12', IF(vM<11, '0', '') | NumberToString(vM-1));
      vEl = NumberToString(vYear) | '-' | IF(vM<10, '0', '') | NumberToString(vM);
      ATTRPUTS(vAttrValue, vDim, vEl, vAttr2);
      vM = vM + 1;
   END;

   vYear = vYear + 1;
END;
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

601,100
602,"TCMB_dim_update_Date_Hierarchies"
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
560,1
pDim
561,1
2
590,1
pDim,"TCMB_Date"
637,1
pDim,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,207

#****Begin: Generated Statements***
#****End: Generated Statements****

vDim = pDim;
vDayElement = 'Today';
vWeekElement = 'WeekToDay';
vMonthElement = 'Last24Months';
vMonthElement2 = 'Last2Months';
vMonthElement3 = 'CurrentMonth';
vYearElement = 'CurrentYear';
vQuarterElement = 'CurrentQuarter';
vHalfYearElement = 'CurrentHalfYear';
vReportPeriods = 'ReportPeriods';

#=========== insert c-level elements

IF(DIMIX(vDim, vDayElement)=0);
   DIMENSIONELEMENTINSERT(vDim,'',vDayElement,'C');
ENDIF;

IF(DIMIX(vDim, vWeekElement)=0);
   DIMENSIONELEMENTINSERT(vDim,'',vWeekElement,'C');
ENDIF;

IF(DIMIX(vDim, vMonthElement)=0);
   DIMENSIONELEMENTINSERT(vDim,'',vMonthElement,'C');
ENDIF;

IF(DIMIX(vDim, vMonthElement2)=0);
   DIMENSIONELEMENTINSERT(vDim,'',vMonthElement2,'C');
ENDIF;

IF(DIMIX(vDim, vMonthElement3)=0);
   DIMENSIONELEMENTINSERT(vDim,'',vMonthElement3,'C');
ENDIF;

IF(DIMIX(vDim, vYearElement)=0);
   DIMENSIONELEMENTINSERT(vDim,'',vYearElement,'C');
ENDIF;

IF(DIMIX(vDim, vHalfYearElement)=0);
   DIMENSIONELEMENTINSERT(vDim,'',vHalfYearElement,'C');
ENDIF;

IF(DIMIX(vDim, vQuarterElement)=0);
   DIMENSIONELEMENTINSERT(vDim,'',vQuarterElement,'C');
ENDIF;

IF(DIMIX(vDim, vReportPeriods)=0);
   DIMENSIONELEMENTINSERT(vDim,'',vReportPeriods,'C');
ENDIF;


#==========ungroup these hierarchies

vSize = ELCOMPN(vDim, vReportPeriods);
WHILE(vSize >0);
   vEl = ELCOMP(vDim, vReportPeriods, vSize);
   DimensionElementComponentDelete(vDim, vReportPeriods,vEl);
   vSize = vSize - 1;
END;

vSize = ELCOMPN(vDim, vDayElement);
WHILE(vSize >0);
   vEl = ELCOMP(vDim, vDayElement, vSize);
   DimensionElementComponentDelete(vDim, vDayElement,vEl);
   vSize = vSize - 1;
END;

vSize = ELCOMPN(vDim, vWeekElement);
WHILE(vSize >0);
   vEl = ELCOMP(vDim, vWeekElement, vSize);
   DimensionElementComponentDelete(vDim, vWeekElement,vEl);
   vSize = vSize - 1;
END;

vSize = ELCOMPN(vDim, vMonthElement);
WHILE(vSize >0);
   vEl = ELCOMP(vDim, vMonthElement, vSize);
   DimensionElementComponentDelete(vDim, vMonthElement,vEl);
   vSize = vSize - 1;
END;

vSize = ELCOMPN(vDim, vMonthElement2);
WHILE(vSize >0);
   vEl = ELCOMP(vDim, vMonthElement2, vSize);
   DimensionElementComponentDelete(vDim, vMonthElement2,vEl);
   vSize = vSize - 1;
END;

vSize = ELCOMPN(vDim, vMonthElement3);
WHILE(vSize >0);
   vEl = ELCOMP(vDim, vMonthElement3, vSize);
   DimensionElementComponentDelete(vDim, vMonthElement3,vEl);
   vSize = vSize - 1;
END;

vSize = ELCOMPN(vDim, vYearElement);
WHILE(vSize >0);
   vEl = ELCOMP(vDim, vYearElement, vSize);
   DimensionElementComponentDelete(vDim, vYearElement,vEl);
   vSize = vSize - 1;
END;

vSize = ELCOMPN(vDim, vHalfYearElement);
WHILE(vSize >0);
   vEl = ELCOMP(vDim, vHalfYearElement, vSize);
   DimensionElementComponentDelete(vDim, vHalfYearElement,vEl);
   vSize = vSize - 1;
END;

vSize = ELCOMPN(vDim, vQuarterElement);
WHILE(vSize >0);
   vEl = ELCOMP(vDim, vQuarterElement, vSize);
   DimensionElementComponentDelete(vDim, vQuarterElement,vEl);
   vSize = vSize - 1;
END;

#=========re-group hierarchies

#------------------re-group day
vToday = TODAY(1);
DIMENSIONELEMENTCOMPONENTADD(vDim,vDayElement, vToday,1);
DIMENSIONELEMENTCOMPONENTADD(vDim,vMonthElement3, SUBST(vToday,1,7),1);
DIMENSIONELEMENTCOMPONENTADD(vDim,vYearElement, SUBST(vToday,1,4),1);

#------------------re-group week
vTodayNo = DAYNO(vToday);

WHILE(MOD(vTodayNo, 7)<>3 );
   DIMENSIONELEMENTCOMPONENTADD(vDim,vWeekElement, DATE(vTodayNo,1),1);
   vTodayNo = vTodayNo - 1;
END;
DIMENSIONELEMENTCOMPONENTADD(vDim,vWeekElement, DATE(vTodayNo,1),1);

#------------------re-group month
vThisMonth = MONTH(TODAY(1));
vThisYear = YEAR(TODAY(1));

i=1;
WHILE(i<=24);

   IF(vThisMonth = 0);
      vThisMonth = 12;
      vThisYear = vThisYear - 1;
   ENDIF;

   DIMENSIONELEMENTCOMPONENTADD(vDim,vMonthElement, NumberToString(vThisYear) | IF(vThisMonth<10, '-0', '-') | NumberToString(vThisMonth),1);
   vThisMonth = vThisMonth - 1;
   i=i+1;
END;

#------------------re-group month2
vThisMonth = MONTH(TODAY(1));
vThisYear = YEAR(TODAY(1));

i=1;
WHILE(i<=2);

   IF(vThisMonth = 0);
      vThisMonth = 12;
      vThisYear = vThisYear - 1;
   ENDIF;

   DIMENSIONELEMENTCOMPONENTADD(vDim,vMonthElement2, NumberToString(vThisYear) | IF(vThisMonth<10, '-0', '-') | NumberToString(vThisMonth),1);
   vThisMonth = vThisMonth - 1;
   i=i+1;
END;

# ----------- re-group maliyet groups

vThisMonth = MONTH(TODAY(1));
IF( vThisMonth <>1);
   DIMENSIONELEMENTCOMPONENTADD(vDim,vReportPeriods , vYearElement,0);
ENDIF;

DIMENSIONELEMENTCOMPONENTADD(vDim,vReportPeriods , vMonthElement3,0);
# DIMENSIONELEMENTCOMPONENTADD(vDim,vReportPeriods , ATTRS(vDim,SUBST(TODAY(1),1,4),'OncekiDonem'),0);
# DIMENSIONELEMENTCOMPONENTADD(vDim,vReportPeriods , ATTRS('Donem',SUBST(TODAY(1),1,7),'1_OncekiAy'),0);
                    # ----------- previous 4 quarters

vThisQuarter = NumberToString(Year(TODAY(1))) | '-' | NumberToString((vThisMonth + MOD(ABS(MOD(vThisMonth, 3)-3),3) ) /3) | 'Q';

IF(vThisMonth>3);
  DIMENSIONELEMENTCOMPONENTADD(vDim,vReportPeriods , vThisQuarter,0);
ENDIF;

v1PrevQuarter = ATTRS(vDim,vThisQuarter,'OncekiDonem');
DIMENSIONELEMENTCOMPONENTADD(vDim,vReportPeriods , v1PrevQuarter,0);
#v2PrevQuarter = ATTRS(vDim,v1PrevQuarter,'OncekiDonem');
#DIMENSIONELEMENTCOMPONENTADD(vDim,vReportPeriods , v2PrevQuarter,0);
#v3PrevQuarter = ATTRS(vDim,v2PrevQuarter,'OncekiDonem');
#DIMENSIONELEMENTCOMPONENTADD(vDim,vReportPeriods , v3PrevQuarter,0);

# ----------- re-group quarter groups
DIMENSIONELEMENTCOMPONENTADD(vDim,vQuarterElement , vThisQuarter,1);

# ----------- re-group half year groups
DIMENSIONELEMENTCOMPONENTADD(vDim,vHalfYearElement , vThisQuarter,1);
IF( SUBST(vThisQuarter,6,1)@='2' % SUBST(vThisQuarter,6,1)@='4' );
   DIMENSIONELEMENTCOMPONENTADD(vDim,vHalfYearElement , v1PrevQuarter,1);
ELSEIF( SUBST(vThisQuarter,6,1)@='1');
   DIMENSIONELEMENTCOMPONENTADD(vDim,vHalfYearElement , SUBST(vThisQuarter,1,4) | '-2Q',1);
ELSEIF( SUBST(vThisQuarter,6,1)@='3');
   DIMENSIONELEMENTCOMPONENTADD(vDim,vHalfYearElement , SUBST(vThisQuarter,1,4) | '-4Q',1);
ENDIF;
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,17

#****Begin: Generated Statements***
#****End: Generated Statements****

ATTRPUTS('Bugün',vDim,vDayElement, 'Adi');
ATTRPUTS('Bu Ay',vDim,vMonthElement3, 'Adi');
ATTRPUTS('Bu Yıl',vDim,vYearElement, 'Adi');
ATTRPUTS('Son 2 Ay',vDim,vMonthElement2, 'Adi');
ATTRPUTS('Son 24 Ay',vDim,vMonthElement, 'Adi');
ATTRPUTS('Bu Hafta',vDim,vWeekElement, 'Adi');

ATTRPUTS('Rapor Dönemleri',vDim,vReportPeriods, 'Adi');


# ================ SEND MAIL ========
#vReturnCode = ExecuteProcess('SYS_Send_Email_for_Errors', 'pModule', 'Tarih Hiyerarsi Guncelleme', 'pProcessName', GetProcessName(), 'pFile', GetProcessErrorFilename, 'pInfo', '', 'pBaanProcess', 0);
# ================
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

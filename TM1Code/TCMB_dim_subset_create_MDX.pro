601,100
602,"TCMB_dim_subset_create_MDX"
562,"NULL"
586,
585,
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
567,","
588,","
589,"."
568,""""
570,
571,
569,0
592,0
599,1000
560,5
pDim
pSub
pMDX
pAlias
pTemp
561,5
2
2
2
2
1
590,5
pDim,""
pSub,""
pMDX,""
pAlias,""
pTemp,0
637,5
pDim,""
pSub,""
pMDX,""
pAlias,""
pTemp,""
577,0
578,0
579,0
580,0
581,0
582,0
931,1

603,0
572,22

#****Begin: Generated Statements***
#****End: Generated Statements****

#IF(SubsetExists(pDim, pSub)=1 & pAlias @= '');
#   AttrInsert(pDim, '', 'Temp_Alias', 'A');
#   SubsetAliasSet(pDim, pSub, 'Temp_Alias');
#   AttrDelete(pDim, 'Temp_Alias');
#ENDIF;

#IF(SubsetExists(pDim, pSub)=0);
# SubsetCreate(pDim, pSub);
#ENDIF;

IF(SubSetExists(pDim,pSub)=0);
    SubsetCreatebyMDX(pSub, pMDX,pTemp);
ENDIF;

IF(pAlias @<>'');
    SubsetAliasSet( pDim, pSub, pAlias );
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

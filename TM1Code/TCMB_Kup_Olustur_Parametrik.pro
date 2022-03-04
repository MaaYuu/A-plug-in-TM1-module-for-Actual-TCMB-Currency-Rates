601,100
602,"TCMB_Kup_Olustur_Parametrik"
562,"CHARACTERDELIMITED"
586,"E:\TM1\FRS\TM1Code\ICProfitElimination_m.csv"
585,"E:\TM1\FRS\TM1Code\ICProfitElimination_m.csv"
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
560,32
pCube
pDim1
pDim2
pDim3
pDim4
pDim5
pDim6
pDim7
pDim8
pDim9
pDim10
pDim11
pDim12
pDimNumber
pMeasureDim
pLogging
pProcessFeeders
pTimeDim
pDim13
pDim14
pDim15
pDim16
pDim17
pDim18
pDim19
pDim20
pDim21
pDim22
pDim23
pDim24
pDim25
pDim26
561,32
2
2
2
2
2
2
2
2
2
2
2
2
2
1
2
1
1
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
590,32
pCube,""
pDim1,""
pDim2,""
pDim3,""
pDim4,""
pDim5,""
pDim6,""
pDim7,""
pDim8,""
pDim9,""
pDim10,""
pDim11,""
pDim12,""
pDimNumber,0
pMeasureDim,""
pLogging,1
pProcessFeeders,0
pTimeDim,""
pDim13,""
pDim14,""
pDim15,""
pDim16,""
pDim17,""
pDim18,""
pDim19,""
pDim20,""
pDim21,""
pDim22,""
pDim23,""
pDim24,""
pDim25,""
pDim26,""
637,32
pCube,""
pDim1,""
pDim2,""
pDim3,""
pDim4,""
pDim5,""
pDim6,""
pDim7,""
pDim8,""
pDim9,""
pDim10,""
pDim11,""
pDim12,""
pDimNumber,""
pMeasureDim,""
pLogging,""
pProcessFeeders,""
pTimeDim,""
pDim13,""
pDim14,""
pDim15,""
pDim16,""
pDim17,""
pDim18,""
pDim19,""
pDim20,""
pDim21,""
pDim22,""
pDim23,""
pDim24,""
pDim25,""
pDim26,""
577,31
Eleman
Par1
Par2
Par3
Par1w
Par2w
Par3w
Type
Format
Picklist
DigerAd1
Guvenlik
Sira
Write_Groups
Read_Groups
Attr1
Attr1Name
Attr2
Attr2Name
Attr3
Attr3Name
Attr4
Attr4Name
Attr5
Attr5Name
Attr6
Attr6Name
Attr7
Attr7Name
Attr8
Attr8Name
578,31
2
2
2
2
1
1
1
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
579,31
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
580,31
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
581,31
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
582,31
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
VarType=33ColType=827
VarType=33ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,88

#****Begin: Generated Statements***
#****End: Generated Statements****

vKup = pCube;
vDim = IF(pMeasureDim@='', vKup | '_m', pMeasureDim);
Bosluk = '';
vFistRecord = 1;

IF(DimensionExists(vDim)=0);
    DimensionCreate(vDim);
ENDIF;

DimensionDeleteAllElements(vDim);

# =======================================

vDim = pMeasureDim;

IF(CubeExists(vKup)=0);

IF(pDimNumber=2);
CubeCreate(vKup, pDim1,vDim);
ELSEIF(pDimNumber=3);
CubeCreate(vKup, pDim1,pDim2,vDim);
ELSEIF(pDimNumber=4);
CubeCreate(vKup, pDim1,pDim2,pDim3,vDim);
ELSEIF(pDimNumber=5);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,vDim);
ELSEIF(pDimNumber=6);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,vDim);
ELSEIF(pDimNumber=7);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,vDim);
ELSEIF(pDimNumber=8);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,vDim);
ELSEIF(pDimNumber=9);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,vDim);
ELSEIF(pDimNumber=10);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,vDim);
ELSEIF(pDimNumber=11);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,vDim);
ELSEIF(pDimNumber=12);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,vDim);
ELSEIF(pDimNumber=13);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,vDim);
ELSEIF(pDimNumber=14);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,vDim);
ELSEIF(pDimNumber=15);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,vDim);
ELSEIF(pDimNumber=16);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,vDim);
ELSEIF(pDimNumber=17);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,pDim16,vDim);
ELSEIF(pDimNumber=18);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,pDim16,pDim17,vDim);
ELSEIF(pDimNumber=19);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,pDim16,pDim17,pDim18,vDim);
ELSEIF(pDimNumber=20);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,pDim16,pDim17,pDim18,pDim19,vDim);
ELSEIF(pDimNumber=21);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,pDim16,pDim17,pDim18,pDim19,pDim20,vDim);
ELSEIF(pDimNumber=22);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,pDim16,pDim17,pDim18,pDim19,pDim20,pDim21,vDim);
ELSEIF(pDimNumber=23);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,pDim16,pDim17,pDim18,pDim19,pDim20,pDim21,pDim22,vDim);
ELSEIF(pDimNumber=24);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,pDim16,pDim17,pDim18,pDim19,pDim20,pDim21,pDim22,pDim23,vDim);
ELSEIF(pDimNumber=25);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,pDim16,pDim17,pDim18,pDim19,pDim20,pDim21,pDim22,pDim23,pDim24,vDim);
ELSEIF(pDimNumber=26);
CubeCreate(vKup, pDim1,pDim2,pDim3,pDim4,pDim5,pDim6,pDim7,pDim8,pDim9,pDim10,pDim11,pDim12,pDim13,pDim14,pDim15,pDim16,pDim17,pDim18,pDim19,pDim20,pDim21,pDim22,pDim23,pDim24,pDim25,vDim);
ELSE;
ProcessError;
ENDIF;

ENDIF;

# ========================================
# Kaynak Dosya Lokasyonunu Belirle.
# ========================================
vLogFilePath = GetProcessErrorFileDirectory;
vLogFileParentPath = DELET(vLogFilePath,SCAN('tm1logfiles\',vLogFilePath),13);
vFilePath = vLogFileParentPath | 'TM1Code\' | vDim | '.csv' ;

DatasourceNameForServer=vFilePath;
DatasourceNameForClient=vFilePath;
DatasourceASCIIDelimiter=';';
DatasourceASCIIHeaderRecords=1;
573,147

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(vFistRecord = 1);
  vEleman_Pre = '';
  vType_Pre = '';
  vFistRecord = 0;
  AttrDelete(vDim, 'Sira');
ENDIF;

DIMENSIONELEMENTINSERT(vDim,'',Eleman,Type);

IF(Par1@<>Bosluk);
   DIMENSIONELEMENTINSERT(vDim,'',Par1,'C');
   DIMENSIONELEMENTCOMPONENTADD(vDim,Par1,Eleman,Par1w);
ENDIF;
IF(Par2@<>Bosluk);
   DIMENSIONELEMENTINSERT(vDim,'',Par2,'C');
   DIMENSIONELEMENTCOMPONENTADD(vDim,Par2,Eleman,Par2w);
ENDIF;
IF(Par3@<>Bosluk);
   DIMENSIONELEMENTINSERT(vDim,'',Par3,'C');
   DIMENSIONELEMENTCOMPONENTADD(vDim,Par3,Eleman,Par3w);
ENDIF;

vEleman_Pre = Eleman;
vType_Pre = Type;
vFistRecord = 0;


IF(Picklist@<>'');
   AttrInsert(vDim,'', 'Picklist','S');
ENDIF;

IF(DigerAd1@<>'');
   AttrInsert(vDim,'', 'Alias','A');
ENDIF;

IF(Format@<>'');
   AttrInsert(vDim,'', 'Format','S');
ENDIF;

Sira = IF(LONG(Sira)=1,'0','') | Sira;
IF(Sira@<>'');
   AttrInsert(vDim,'', 'Order','S');
ENDIF;

IF(Guvenlik@<>'');
   AttrInsert(vDim,'', 'Security','S');
   vKupSec = '}ElementSecurity_' | vDim;
   IF(CubeExists(vKupSec)=0);
      CubeCreate(vKupSec, vDim, '}Groups');
   ENDIF;
ENDIF;

IF(Write_Groups@<>'');
   AttrInsert(vDim,'', 'Write_Groups','S');
ENDIF;

IF(Read_Groups@<>'');
   AttrInsert(vDim,'', 'Read_Groups','S');
ENDIF;

IF(Attr1Name@<>'');
   vAttr1Name = SUBST(Attr1Name,3,LONG(Attr1Name)-2);
   vAttr1NameS= Attr1Name;
   vAttr1Type = SUBST(Attr1Name,1,1);
   IF(vAttr1Name@='Alias');
      vAttr1Type ='A';
      AttrInsert(vDim,'', vAttr1Name,vAttr1Type);
   ELSEIF(SCAN('Caption_',vAttr1Name)>0);
      vAttr1Type ='A';
      vAttr1Name = 'Caption';
      vLang1 = SUBST(Attr1Name,SCAN('Caption_',Attr1Name)+8,2);
      AttrInsert( vDim, '', 'Caption', vAttr1Type);
   ELSE;
      AttrInsert(vDim,'', vAttr1Name,vAttr1Type);
   ENDIF;

   IF(vAttr1Name@='Adi');
     AttrInsert(vDim,'', 'Kodu-Adi','A');     
   ELSEIF(vAttr1Name@='Name');
     AttrInsert(vDim,'', 'Code-Name','A');     
   ENDIF;

ENDIF;

IF(Attr2Name@<>'');
   vAttr2Name = SUBST(Attr2Name,3,LONG(Attr2Name)-2);
   vAttr2NameS= Attr2Name;
   vAttr2Type = SUBST(Attr2Name,1,1);
   IF(vAttr2Name@='Alias');
      vAttr2Type ='A';
      AttrInsert(vDim,'', vAttr2Name,vAttr2Type);
   ELSEIF(SCAN('Caption_',vAttr2Name)>0);
      vAttr2Type ='A';
      vAttr2Name = 'Caption';
      vLang2 = SUBST(Attr2Name,SCAN('Caption_',Attr2Name)+8,2);
      AttrInsert( vDim, '', 'Caption', vAttr2Type);
   ELSE;
      AttrInsert(vDim,'', vAttr2Name,vAttr2Type);
   ENDIF;

   IF(vAttr2Name@='Adi');
     AttrInsert(vDim,'', 'Kodu-Adi','A');     
   ELSEIF(vAttr2Name@='Name');
     AttrInsert(vDim,'', 'Code-Name','A');     
   ENDIF;

ENDIF;

IF(Attr3Name@<>'');
   vAttr3Name = SUBST(Attr3Name,3,LONG(Attr3Name)-2);
   vAttr3Type = SUBST(Attr3Name,1,1);
   AttrInsert(vDim,'', vAttr3Name,vAttr3Type);
ENDIF;

IF(Attr4Name@<>'');
   vAttr4Name = SUBST(Attr4Name,3,LONG(Attr4Name)-2);
   vAttr4Type = SUBST(Attr4Name,1,1);
   AttrInsert(vDim,'', vAttr4Name,vAttr4Type);
ENDIF;

IF(Attr5Name@<>'');
   vAttr5Name = SUBST(Attr5Name,3,LONG(Attr5Name)-2);
   vAttr5Type = SUBST(Attr5Name,1,1);
   AttrInsert(vDim,'', vAttr5Name,vAttr5Type);
ENDIF;

IF(Attr6Name@<>'');
   vAttr6Name = SUBST(Attr6Name,3,LONG(Attr6Name)-2);
   vAttr6Type = SUBST(Attr6Name,1,1);
   AttrInsert(vDim,'', vAttr6Name,vAttr6Type);
ENDIF;

IF(Attr7Name@<>'');
   vAttr7Name = SUBST(Attr7Name,3,LONG(Attr7Name)-2);
   vAttr7Type = SUBST(Attr7Name,1,1);
   AttrInsert(vDim,'', vAttr7Name,vAttr7Type);
ENDIF;

IF(Attr8Name@<>'');
   vAttr8Name = SUBST(Attr8Name,3,LONG(Attr8Name)-2);
   vAttr8Type = SUBST(Attr8Name,1,1);
   AttrInsert(vDim,'', vAttr8Name,vAttr8Type);
ENDIF;
574,155

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(Format@<>'');
   AttrPutS(Format,vDim,Eleman,'Format');
ENDIF;

IF(Guvenlik@<>'');
   AttrPutS(Guvenlik,vDim,Eleman,'Security');
ENDIF;

IF(Picklist@<>'');
   AttrPutS(Picklist,vDim,Eleman,'Picklist');
ENDIF;

IF(DigerAd1@<>'');
   AttrPutS(DigerAd1,vDim,Eleman,'Alias');
ENDIF;

Sira = IF(LONG(Sira)=1,'0','') | Sira;
IF(Sira@<>'');
   AttrPutS(Sira,vDim,Eleman,'Order');
ENDIF;



IF(Write_Groups@<>'');
   AttrPutS(Write_Groups,vDim,Eleman,'Write_Groups');
ENDIF;

IF(Read_Groups@<>'');
   AttrPutS(Read_Groups,vDim,Eleman,'Read_Groups');
ENDIF;


IF(vAttr1Name@<>'');
   IF(vAttr1Type@='N');
      AttrPutN(NUMBR(Attr1),vDim,Eleman,vAttr1Name);
   ELSE;
     IF(vAttr1Name@='Adi' & Attr1@<>Eleman);
        AttrPutS(Eleman | '-' | Attr1,vDim,Eleman,'Kodu-Adi');
        AttrPutS(Attr1,vDim,Eleman,vAttr1Name);
     ELSEIF(vAttr1Name@='Name'  & Attr1@<>Eleman);
        vCodeName= IF(Eleman@='#root',Attr1,Eleman | '-' | Attr1);
        AttrPutS(vCodeName,vDim,Eleman,'Code-Name');
        AttrPutS(Attr1,vDim,Eleman,vAttr1Name);
     ELSEIF(vAttr1Name@='Alias'  & Attr1@<>Eleman & Attr1@<>'');
        vCodeName= IF(Eleman@='#root',Attr1,Eleman | '-' | Attr1);
        vAlias = IF(SUBST(Attr1Name,1,1)@='S',Attr1,vCodeName);
        AttrPutS(vAlias,vDim,Eleman,'Alias');
     ELSEIF(vAttr1Name@='Caption'  & Attr1@<>Eleman & Attr1@<>'');
        vCodeName= IF(Eleman@='#root',Attr1,Eleman | '-' | Attr1);
        vCaption1 = IF(SUBST(vAttr1NameS,1,1)@='A',Attr1,vCodeName);
        AttrPutS(vCaption1,vDim,Eleman,'Caption',vLang1);
        IF(SCAN('_Default',vAttr1NameS)>0);
            AttrPutS(vCaption1,vDim,Eleman,'Caption');
        ENDIF;
     ELSE;
        AttrPutS(Attr1,vDim,Eleman,vAttr1Name);
     ENDIF;

   ENDIF;
ENDIF;

IF(vAttr2Name@<>'');
   IF(vAttr2Type@='N');
      AttrPutN(NUMBR(Attr2),vDim,Eleman,vAttr2Name);
   ELSE;
    IF(vAttr2Name@='Adi'  & Attr2@<>Eleman);
        AttrPutS(Attr2,vDim,Eleman,vAttr2Name);
        AttrPutS(Eleman | '-' | Attr2,vDim,Eleman,'Kodu-Adi');
     ELSEIF(vAttr2Name@='Name'  & Attr2@<>Eleman);
         AttrPutS(Attr2,vDim,Eleman,vAttr2Name);
        AttrPutS(Eleman | '-' | Attr2,vDim,Eleman,'Code-Name');
     ELSEIF(vAttr2Name@='Alias'  & Attr2@<>Eleman & Attr2@<>'');
        vCodeName= IF(Eleman@='#root',Attr2,Eleman | '-' | Attr2);
        vAlias = IF(SUBST(Attr2Name,1,1)@='S',Attr2,vCodeName);
        AttrPutS(vAlias,vDim,Eleman,'Alias');
     ELSEIF(vAttr2Name@='Caption'  & Attr2@<>Eleman & Attr2@<>'');
        vCodeName= IF(Eleman@='#root',Attr2,Eleman | '-' | Attr2);
        vCaption2 = IF(SUBST(vAttr2NameS,1,1)@='A',Attr2,vCodeName);
        AttrPutS(vCaption2,vDim,Eleman,'Caption',vLang2);
        IF(SCAN('_Default',vAttr2NameS)>0);
            AttrPutS(vCaption2,vDim,Eleman,'Caption');
        ENDIF;
     ELSE;
        AttrPutS(Attr2,vDim,Eleman,vAttr2Name);
     ENDIF;

    ENDIF;
ENDIF;


IF(vAttr3Name@<>'');
   IF(vAttr3Type@='N');
      AttrPutN(NUMBR(Attr3),vDim,Eleman,vAttr3Name);
   ELSE;
      IF(CellIsUpdateable('}ElementAttributes_' | vDim,Eleman,vAttr3Name)=1);
         AttrPutS(Attr3,vDim,Eleman,vAttr3Name);
      ENDIF;
   ENDIF;
ENDIF;


IF(vAttr4Name@<>'');
   IF(vAttr4Type@='N');
      AttrPutN(NUMBR(Attr4),vDim,Eleman,vAttr4Name);
   ELSE;
      IF(CellIsUpdateable('}ElementAttributes_' | vDim,Eleman,vAttr4Name)=1);
         AttrPutS(Attr4,vDim,Eleman,vAttr4Name);
      ENDIF;
   ENDIF;
ENDIF;


IF(vAttr5Name@<>'');
   IF(vAttr5Type@='N');
      AttrPutN(NUMBR(Attr5),vDim,Eleman,vAttr5Name);
   ELSE;
      IF(CellIsUpdateable('}ElementAttributes_' | vDim,Eleman,vAttr5Name)=1);
         AttrPutS(Attr5,vDim,Eleman,vAttr5Name);
      ENDIF;
   ENDIF;
ENDIF;

IF(vAttr6Name@<>'');
   IF(vAttr6Type@='N');
      AttrPutN(NUMBR(Attr6),vDim,Eleman,vAttr6Name);
   ELSE;
      IF(CellIsUpdateable('}ElementAttributes_' | vDim,Eleman,vAttr6Name)=1);
         AttrPutS(Attr6,vDim,Eleman,vAttr6Name);
      ENDIF;
   ENDIF;
ENDIF;

IF(vAttr7Name@<>'');
   IF(vAttr7Type@='N');
      AttrPutN(NUMBR(Attr7),vDim,Eleman,vAttr7Name);
   ELSE;
      IF(CellIsUpdateable('}ElementAttributes_' | vDim,Eleman,vAttr7Name)=1);
         AttrPutS(Attr7,vDim,Eleman,vAttr7Name);
      ENDIF;
   ENDIF;
ENDIF;

IF(vAttr8Name@<>'');
   IF(vAttr8Type@='N');
      AttrPutN(NUMBR(Attr8),vDim,Eleman,vAttr8Name);
   ELSE;
      IF(CellIsUpdateable('}ElementAttributes_' | vDim,Eleman,vAttr8Name)=1);
         AttrPutS(Attr8,vDim,Eleman,vAttr8Name);
      ENDIF;
   ENDIF;
ENDIF;
575,83

#****Begin: Generated Statements***
#****End: Generated Statements****

CubeSetLogChanges(vKup, pLogging);

# ========================================
# Planlama Kuralını Yükle
# ========================================
vLogFilePath = GetProcessErrorFileDirectory;
vLogFileParentPath = DELET(vLogFilePath,SCAN('tm1logfiles\',vLogFilePath),13);
vFilePath = vLogFileParentPath | 'TM1Code\' | vKup | '.txt' ;
IF(FileExists(vFilePath)=1);
   RuleLoadFromFile(vKup, vFilePath);
ENDIF;

IF(pProcessFeeders=1);
   CubeProcessFeeders(vKup);
ENDIF;

# ================Standart Görünümler Oluştur===============================
s= '_';
vSub = vDim | s | 'All';

IF(Sira@<>'');
    vMDX  = '{ORDER({TM1SUBSETALL( [' | vDim | '] )}, [' | vDim | '].[Order], BASC) }';
ELSE;
    vMDX  = '{TM1SUBSETALL( [' | vDim | '] )}';
ENDIF;
vReturnCode = ExecuteProcess('TCMB_dim_subset_create_MDX', 'pDim', vDim, 'pSub', vSub, 'pMDX', vMDX);

vSub = vDim | s | 'All' | s | 'Kodu-Adi';
IF(DIMIX('}ElementAttributes_' | vDim,'Kodu-Adi')>0);
  vReturnCode = ExecuteProcess('TCMB_dim_subset_create_MDX', 'pDim', vDim, 'pSub', vSub, 'pMDX', vMDX,'pAlias','Kodu-Adi');
ENDIF;

vSub = vDim | s | 'All' | s | 'Code-Name';
IF(DIMIX('}ElementAttributes_' | vDim,'Code-Name')>0);
  vReturnCode = ExecuteProcess('TCMB_dim_subset_create_MDX', 'pDim', vDim, 'pSub', vSub, 'pMDX', vMDX,'pAlias','Code-Name');
ENDIF;

vSub = vDim | s | 'All' | s | 'Caption';
IF(DIMIX('}ElementAttributes_' | vDim,'Caption')>0);
  vReturnCode = ExecuteProcess('TCMB_dim_subset_create_MDX', 'pDim', vDim, 'pSub', vSub, 'pMDX', vMDX,'pAlias','Caption');
ENDIF;

vSub = vDim | s | 'All' | s | 'Alias';
IF(DIMIX('}ElementAttributes_' | vDim,'Alias')>0);
  vReturnCode = ExecuteProcess('TCMB_dim_subset_create_MDX', 'pDim', vDim, 'pSub', vSub, 'pMDX', vMDX,'pAlias','Alias');
ENDIF;

vSub = vDim | s | 'Level0';
vMDX  = '{TM1SORT( {TM1FILTERBYLEVEL( {TM1SUBSETALL( [' | vDim | '] )}, 0)}, ASC)}';
vReturnCode = ExecuteProcess('TCMB_dim_subset_create_MDX', 'pDim', vDim, 'pSub', vSub, 'pMDX', vMDX);

vSub = vDim | s | 'Level0' | s | 'Kodu-Adi';
IF(DIMIX('}ElementAttributes_' | vDim,'Kodu-Adi')>0);
  vReturnCode = ExecuteProcess('TCMB_dim_subset_create_MDX', 'pDim', vDim, 'pSub', vSub, 'pMDX', vMDX,'pAlias','Kodu-Adi');
ENDIF;

vSub = vDim | s | 'Level0' | s | 'Code-Name';
IF(DIMIX('}ElementAttributes_' | vDim,'Code-Name')>0);
  vReturnCode = ExecuteProcess('TCMB_dim_subset_create_MDX', 'pDim', vDim, 'pSub', vSub, 'pMDX', vMDX,'pAlias','Code-Name');
ENDIF;

vSub = vDim | s | 'Level0' | s | 'Caption';
IF(DIMIX('}ElementAttributes_' | vDim,'Caption')>0);
  vReturnCode = ExecuteProcess('TCMB_dim_subset_create_MDX', 'pDim', vDim, 'pSub', vSub, 'pMDX', vMDX,'pAlias','Caption');
ENDIF;


vSub = vDim | s | 'Level0' | s | 'Alias';
IF(DIMIX('}ElementAttributes_' | vDim,'Alias')>0);
  vReturnCode = ExecuteProcess('TCMB_dim_subset_create_MDX', 'pDim', vDim, 'pSub', vSub, 'pMDX', vMDX,'pAlias','Alias');
ENDIF;
# ===============================================

IF(pTimeDim@<>'');
   CellPutS(pTimeDim,'}CubeProperties',pCube,'TIME_DIMENSION');
   CellPutS(pMeasureDim,'}CubeProperties',pCube,'MEASURES_DIMENSION');
ENDIF;

RefreshMdxHierarchy(vDim);
576,CubeAction=1511DataAction=1503CubeLogChanges=0
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

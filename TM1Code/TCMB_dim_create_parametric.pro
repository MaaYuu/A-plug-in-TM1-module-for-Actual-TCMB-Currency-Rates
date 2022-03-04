601,100
602,"TCMB_dim_create_parametric"
562,"CHARACTERDELIMITED"
586,"D:\TM1\FRS\TM1MasterDataFiles\Case.csv"
585,"D:\TM1\FRS\TM1MasterDataFiles\Case.csv"
564,
565,"mfymO^MUxjmUtadVcdyL9qfRz58=HYkRSbG[FXePwDcbWs087mG>Q3yIS^?;fRv;SyFdyHUm`sZVxCPpRvZn=OT0D1`9BJUzaMmArl>aHUfjibm6\eyMe;BLa^Kq=aNKTQA=4oqveBK4Z4pvbhKZ^3UlzPa7jqJvTpTcXCt^l?HN_<XmGk?[SEkv`oV7ky@^fE\rlaUK"
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
560,6
pDim
pLoadElSecRule
pCleanFirst
pFolder
pElementOrderMethod
pFile
561,6
2
1
1
2
2
2
590,6
pDim,""
pLoadElSecRule,0
pCleanFirst,1
pFolder,"TM1Code"
pElementOrderMethod,""
pFile,""
637,6
pDim,""
pLoadElSecRule,""
pCleanFirst,""
pFolder,""
pElementOrderMethod,""
pFile,""
577,36
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
Security
SortOrder
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
Attr9
Attr9Name
Attr10
Attr10Name
Attr11
Attr11Name
Attr12
Attr12Name
578,36
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
2
2
2
2
2
579,36
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
32
33
34
35
36
580,36
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
0
0
0
0
0
581,36
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
0
0
0
0
0
582,36
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
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,80

#****Begin: Generated Statements***
#****End: Generated Statements****

#==================== Operators
Dash = '-';
x='''';
p= '|';
s= '_';
Bosluk = '';
Recordcount = 0;

# ==================================== Intialize logging
IF( CubeExists('SYS_ProcessLogs')=1);
cProcess = GetProcessName( );
cTimeStamp = TimSt( Now, '\Y\m\d\h\i\s' );
cProcessReference = cProcess |'_'| cTimeStamp;
cParameterValues = pDim | p | NumberToString(pLoadElSecRule) | p | NumberToString(pCleanFirst) | p | pFolder | p | pElementOrderMethod | p | pFile;
ExecuteProcess('SYS_Process_Logs_Start','ProcessName',cProcess,'ElementName',cProcessReference, 'ParameterValues', cParameterValues);

vMessage = 'Starting Process with parameters: ' | cParameterValues ;
vLogLevel = 'INFO';
ExecuteProcess('SYS_Process_Logs_Log_Message','ProcessNameWithTimeStamp',cProcessReference,'loglevel', vLogLevel,'message',vMessage);

Errorcount = 0;
ENDIF;
# ==================================== 

vDim = pDim;
vFistRecord = 1;

IF(DimensionExists(vDim)=0);
    DimensionCreate(vDim);
ENDIF;

IF(pCleanFirst = 1);
   DimensionDeleteAllElements(vDim);
ENDIF;

IF(pElementOrderMethod@='ByInput'); 
  DIMENSIONSORTORDER(vDim,'BYNAME','ASCENDING','BYINPUT','ASCENDING');
ELSEIF(pElementOrderMethod@='ByName'); 
  DIMENSIONSORTORDER(vDim,'BYNAME','ASCENDING','BYNAME','ASCENDING');
ELSEIF(pElementOrderMethod@='ByHierarchy'); 
   DIMENSIONSORTORDER(vDim,'BYINPUT','ASCENDING','BYHIERARCHY','ASCENDING');
ELSEIF(pElementOrderMethod@='ByHierarchyInput'); 
   DIMENSIONSORTORDER(vDim,'BYINPUT','ASCENDING','BYHIERARCHY','ASCENDING');
ELSEIF(pElementOrderMethod@='ByHierarchyName'); 
   DIMENSIONSORTORDER(vDim,'BYNAME','ASCENDING','BYHIERARCHY','ASCENDING');
ELSEIF(pElementOrderMethod@='ByLevel'); 
   DimensionSortOrder (vDim, 'ByName', 'Ascending','ByLevel', 'Ascending'); 
ENDIF;

# ========================================
# Kaynak Dosya Lokasyonunu Belirle.
# ========================================


vFile = IF(pFile@='',vDim | '.csv' ,pFile);
vFolder = IF(pFolder@='','TM1Code', pFolder);

vLogFilePath = GetProcessErrorFileDirectory;
vLogFileParentPath = DELET(vLogFilePath,SCAN('tm1logfiles\',vLogFilePath),13);
vFilePath = vLogFileParentPath | vFolder | '\' | vFile ;

# ========================= File Check Error Logging
IF( CubeExists('SYS_ProcessLogs')=1);
   IF( FileExists(vFilePath) = 0 );
      vMessage = 'There is no file: ' | vFile | ' Please check the dimension parameter';
      vLogLevel = 'ERROR';
      ExecuteProcess('SYS_Process_Logs_Log_Message','ProcessNameWithTimeStamp',cProcessReference,'loglevel', vLogLevel,'message',vMessage);
      ProcessError;
   ENDIF;
ENDIF;
# ========================= 

DatasourceNameForServer=vFilePath;
DatasourceNameForClient=vFilePath;
DatasourceASCIIDelimiter=';';
DatasourceASCIIHeaderRecords=1;
573,186

#****Begin: Generated Statements***
#****End: Generated Statements****

Recordcount = Recordcount + 1;

IF(vFistRecord = 1);
  vEleman_Pre = '';
  vType_Pre = '';
  vFistRecord = 0;
  AttrDelete(vDim, 'SortOrder');
ENDIF;

# ============= MasterData Error Logging
IF( CubeExists('SYS_ProcessLogs')=1);
   IF( Eleman @= Par1 % Eleman @= Par2 % Eleman @= Par3);
      vMessage = 'Element and parent cannot be same, Element: ' | Eleman;
      vLogLevel = 'ERROR';
      ExecuteProcess('SYS_Process_Logs_Log_Message','ProcessNameWithTimeStamp',cProcessReference,'loglevel', vLogLevel,'message',vMessage);
      Errorcount = Errorcount + 1;
      ItemReject(vMessage);
   ENDIF;

   IF( Type @<> 'N' & Type @<> 'S' & Type @<> 'C');
      vMessage = 'Undefined element type, Element: ' | Eleman;
      vLogLevel = 'ERROR';
      ExecuteProcess('SYS_Process_Logs_Log_Message','ProcessNameWithTimeStamp',cProcessReference,'loglevel', vLogLevel,'message',vMessage);
      Errorcount = Errorcount + 1;
      ItemReject(vMessage);
   ENDIF;
ENDIF;
# ============= 

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

IF(Format@<>'');
   AttrInsert(vDim,'', 'Format','S');
ENDIF;

SortOrder = IF(LONG(SortOrder)=1,'0','') | SortOrder;
IF(SortOrder@<>'');
   AttrInsert(vDim,'', 'SortOrder','S');
ENDIF;

IF(Security@<>'');
   AttrInsert(vDim,'', 'Security','S');
   vKupSec = '}ElementSecurity_' | vDim;
   IF(CubeExists(vKupSec)=0);
      CubeCreate(vKupSec, vDim, '}Groups');
   ENDIF;
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


IF(Attr9Name@<>'');
   vAttr9Name = SUBST(Attr9Name,3,LONG(Attr9Name)-2);
   vAttr9Type = SUBST(Attr9Name,1,1);
   AttrInsert(vDim,'', vAttr9Name,vAttr9Type);
ENDIF;

IF(Attr10Name@<>'');
   vAttr10Name = SUBST(Attr10Name,3,LONG(Attr10Name)-2);
   vAttr10Type = SUBST(Attr10Name,1,1);
   AttrInsert(vDim,'', vAttr10Name,vAttr10Type);
ENDIF;

IF(Attr11Name@<>'');
   vAttr11Name = SUBST(Attr11Name,3,LONG(Attr11Name)-2);
   vAttr11Type = SUBST(Attr11Name,1,1);
   AttrInsert(vDim,'', vAttr11Name,vAttr11Type);
ENDIF;

IF(Attr12Name@<>'');
   vAttr12Name = SUBST(Attr12Name,3,LONG(Attr12Name)-2);
   vAttr12Type = SUBST(Attr12Name,1,1);
   AttrInsert(vDim,'', vAttr12Name,vAttr12Type);
ENDIF;

574,187

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(Format@<>'');
   AttrPutS(Format,vDim,Eleman,'Format');
ENDIF;

IF(Security@<>'');
   AttrPutS(Security,vDim,Eleman,'Security');
ENDIF;

IF(Picklist@<>'');
   AttrPutS(Picklist,vDim,Eleman,'Picklist');
ENDIF;

SortOrder = IF(LONG(SortOrder)=1,'00',IF(LONG(SortOrder)=2,'0','')) | SortOrder;
IF(SortOrder@<>'');
   AttrPutS(SortOrder,vDim,Eleman,'SortOrder');
ENDIF;

# ============= Attribute Error Logging
IF( CubeExists('SYS_ProcessLogs')=1);
   i=1;
   WHILE(i<=12);
      vAttrName=Expand('%'|Expand( 'vAttr' | NumberToString(i) | 'Name' )|'%');
      vAttrValue=Expand('%'|Expand( 'Attr' | NumberToString(i) )|'%');
      IF( DTYPE('}ElementAttributes_' | vDim, vAttrName) @= 'AA' );
         IF( DIMIX(vDim, vAttrValue) > 0 & Eleman @<> DimensionElementPrincipalName( vDim, vAttrValue) );
            vMessage = 'Alias: ' | vAttrValue | ' for the element: ' | Eleman | ' is reserved for another element: ' | DimensionElementPrincipalName( vDim, vAttrValue);
            vLogLevel = 'ERROR';
            ExecuteProcess('SYS_Process_Logs_Log_Message','ProcessNameWithTimeStamp',cProcessReference,'loglevel', vLogLevel,'message',vMessage);
            Errorcount = Errorcount + 1;
            ItemReject(vMessage);
         ENDIF;
      ENDIF;
      i = i + 1;
   END;
ENDIF;
# ============= 

IF(Attr1@<>'');
   IF(vAttr1Type@='N');
      AttrPutN(NUMBR(Attr1),vDim,Eleman,vAttr1Name);
   ELSE;
     IF(vAttr1Name@='Adi' & Attr1@<>Eleman);
        vCodeName= IF(Eleman@='#root',Attr1,Eleman | '-' | Attr1);
        AttrPutS(vCodeName,vDim,Eleman,'Kodu-Adi');
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

IF(Attr2@<>'');
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
      AttrPutS(Attr5,vDim,Eleman,vAttr5Name);
    ENDIF;
ENDIF;


IF(vAttr6Name@<>'');
   IF(vAttr6Type@='N');
      AttrPutN(NUMBR(Attr6),vDim,Eleman,vAttr6Name);
   ELSE;
      AttrPutS(Attr6,vDim,Eleman,vAttr6Name);
    ENDIF;
ENDIF;


IF(vAttr7Name@<>'');
   IF(vAttr7Type@='N');
      AttrPutN(NUMBR(Attr7),vDim,Eleman,vAttr7Name);
   ELSE;
      AttrPutS(Attr7,vDim,Eleman,vAttr7Name);
    ENDIF;
ENDIF;


IF(vAttr8Name@<>'');
   IF(vAttr8Type@='N');
      AttrPutN(NUMBR(Attr8),vDim,Eleman,vAttr8Name);
   ELSE;
      AttrPutS(Attr8,vDim,Eleman,vAttr8Name);
    ENDIF;
ENDIF;


IF(vAttr9Name@<>'');
   IF(vAttr9Type@='N');
      AttrPutN(NUMBR(Attr9),vDim,Eleman,vAttr9Name);
   ELSE;
      AttrPutS(Attr9,vDim,Eleman,vAttr9Name);
    ENDIF;
ENDIF;


IF(vAttr10Name@<>'');
   IF(vAttr10Type@='N');
      AttrPutN(NUMBR(Attr10),vDim,Eleman,vAttr10Name);
   ELSE;
      AttrPutS(Attr10,vDim,Eleman,vAttr10Name);
    ENDIF;
ENDIF;

IF(vAttr11Name@<>'');
   IF(vAttr11Type@='N');
      AttrPutN(NUMBR(Attr11),vDim,Eleman,vAttr11Name);
   ELSE;
      AttrPutS(Attr11,vDim,Eleman,vAttr11Name);
    ENDIF;
ENDIF;

IF(vAttr12Name@<>'');
   IF(vAttr12Type@='N');
      AttrPutN(NUMBR(Attr12),vDim,Eleman,vAttr12Name);
   ELSE;
      AttrPutS(Attr12,vDim,Eleman,vAttr12Name);
    ENDIF;
ENDIF;
575,82

#****Begin: Generated Statements***
#****End: Generated Statements****

# ================Standart Görünümler Oluştur===============================

vSub = vDim | s | 'All';
IF(SortOrder@<>'');
    vMDX  = '{ORDER({TM1SUBSETALL( [' | vDim | '] )}, [' | vDim | '].[SortOrder], BASC) }';
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


# ======
# RULE KURALINI YÜKLE

vFilePath = vLogFileParentPath | 'TM1Code\}ElementAttributes_' | vDim | '.txt' ;
IF( FileExists(vFilePath) > 0 );
  RuleLoadFromFile('}ElementAttributes_' | vDim, vFilePath);  
ENDIF;
# ======

RefreshMdxHierarchy(vDim);

# ========= Finish Logging
IF( CubeExists('SYS_ProcessLogs')=1);
   vMessage = 'Finishing Process, record: ' | NumberToString(Recordcount) | ', error: ' | NumberToString(Errorcount);
   vLogLevel = 'INFO';
   ExecuteProcess('SYS_Process_Logs_Log_Message','ProcessNameWithTimeStamp',cProcessReference,'loglevel', vLogLevel,'message',vMessage);
ENDIF;
# =====================
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

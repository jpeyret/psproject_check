select RECNAME,  RECDESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSRECDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  0
AND M.RECNAME = PSPROJECTITEM.OBJECTVALUE1
)
;


/* Can't fetch changes for 1 [Index] - reason no LASTUPDOPRID or LASTUPDDTTM on record PSINDEXDEFN */

select FIELDNAME,   LASTUPDOPRID, LASTUPDDTTM 
from PSDBFIELD M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  2
AND M.FIELDNAME = PSPROJECTITEM.OBJECTVALUE1
)
;


/* Can't fetch changes for 3 [Field Format] - reason objecttype configuration - PeopleSoft tablename not specified */

select FIELDNAME, FIELDVALUE, EFFDT,  XLATLONGNAME, LASTUPDOPRID, LASTUPDDTTM 
from PSXLATITEM M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  4
AND M.FIELDNAME = PSPROJECTITEM.OBJECTVALUE1 AND M.FIELDVALUE = PSPROJECTITEM.OBJECTVALUE2 AND M.EFFDT = PSPROJECTITEM.OBJECTVALUE3
)
;
select PNLNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSPNLDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  5
AND M.PNLNAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select MENUNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSMENUDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  6
AND M.MENUNAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select PNLGRPNAME, MARKET,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSPNLGRPDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  7
AND M.PNLGRPNAME = PSPROJECTITEM.OBJECTVALUE1 AND M.MARKET = PSPROJECTITEM.OBJECTVALUE2
)
;
select OBJECTVALUE1, OBJECTVALUE2, OBJECTVALUE3,   LASTUPDOPRID, LASTUPDDTTM 
from PSPCMPROG M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  8
AND M.OBJECTVALUE1 = PSPROJECTITEM.OBJECTVALUE1 AND M.OBJECTVALUE2 = PSPROJECTITEM.OBJECTVALUE2 AND M.OBJECTVALUE3 = PSPROJECTITEM.OBJECTVALUE3
)
AND M.OBJECTID1 = 1;
select OBJECTVALUE1 as MENUNAME, OBJECTVALUE2 as BARNAME, OBJECTVALUE3 as ITEMNAME, OBJECTVALUE4 as EVENT_NAME,   LASTUPDOPRID, LASTUPDDTTM 
from PSPCMPROG M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  9
AND M.OBJECTID1    = PSPROJECTITEM.OBJECTID1
AND M.OBJECTVALUE1 = PSPROJECTITEM.OBJECTVALUE1
AND M.OBJECTVALUE2 = PSPROJECTITEM.OBJECTVALUE2  /* always MENUITEM1 */
and M.OBJECTVALUE3 = PSPROJECTITEM.OBJECTVALUE3
AND M.OBJECTVALUE4 = PSPROJECTITEM.OBJECTVALUE4  /* always ItemSelected */
)
AND M.OBJECTID1 = 3;
select OPRID, QRYNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSQRYDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  10
AND M.OPRID = PSPROJECTITEM.OBJECTVALUE1 AND M.QRYNAME = PSPROJECTITEM.OBJECTVALUE2
)
;
select TREE_STRCT_ID,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSTREESTRCT M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  11
AND M.TREE_STRCT_ID = PSPROJECTITEM.OBJECTVALUE1
)
;
select SETID, SETCNTRLVALUE, TREE_NAME, EFFDT,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSTREEDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  12
AND M.SETID = PSPROJECTITEM.OBJECTVALUE1 AND M.SETCNTRLVALUE = PSPROJECTITEM.OBJECTVALUE2 AND M.TREE_NAME = PSPROJECTITEM.OBJECTVALUE3 AND M.EFFDT = PSPROJECTITEM.OBJECTVALUE4
)
;
select OPRID, COLORNAME,   LASTUPDOPRID, LASTUPDDTTM 
from PSCOLORDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  14
AND M.OPRID = PSPROJECTITEM.OBJECTVALUE1 AND M.COLORNAME = PSPROJECTITEM.OBJECTVALUE2
)
;
select STYLENAME,   LASTUPDOPRID, LASTUPDDTTM 
from PSSTYLEDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  15
AND M.STYLENAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select BUSPROCNAME,  DESCR60, LASTUPDOPRID, LASTUPDDTTM 
from PSBUSPROCDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  17
AND M.BUSPROCNAME = PSPROJECTITEM.OBJECTVALUE1
)
;


/* Can't fetch changes for 18 [Activity] - reason no LASTUPDOPRID or LASTUPDDTTM on record PSEVENTDEFN */

select ROLENAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSROLEDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  19
AND M.ROLENAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select PRCSTYPE, PRCSNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PS_PRCSDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  20
AND M.PRCSTYPE = PSPROJECTITEM.OBJECTVALUE1 AND M.PRCSNAME = PSPROJECTITEM.OBJECTVALUE2
)
;
select PRCSJOBNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PS_PRCSJOBDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  23
AND M.PRCSJOBNAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select RECURNAME,   LASTUPDOPRID, LASTUPDDTTM 
from PS_PRCSRECUR M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  24
AND M.RECURNAME = PSPROJECTITEM.OBJECTVALUE1
)
;


/* Can't fetch changes for 25 [Message Catalog] - reason no LASTUPDOPRID or LASTUPDDTTM on record PSMSGCATDEFN */

select SQLID, SQLTYPE,   LASTUPDOPRID, LASTUPDDTTM 
from PSSQLDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  30
AND M.SQLID = PSPROJECTITEM.OBJECTVALUE1 AND M.SQLTYPE = PSPROJECTITEM.OBJECTVALUE2
)
;
select FLDDEFNNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSFLDDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  31
AND M.FLDDEFNNAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select BCNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSBCDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  32
AND M.BCNAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select AE_APPLID,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSAEAPPLDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  33
AND M.AE_APPLID = PSPROJECTITEM.OBJECTVALUE1
)
;
select AE_APPLID, AE_SECTION,   LASTUPDOPRID, LASTUPDDTTM 
from PSAESECTDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  34
AND M.AE_APPLID = PSPROJECTITEM.OBJECTVALUE1 AND M.AE_SECTION = PSPROJECTITEM.OBJECTVALUE2
)
;
select MSGNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSMSGDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  37
AND M.MSGNAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select OBJECTVALUE1 as AE_APPLID, OBJECTVALUE2 as AE_SECTION, OBJECTVALUE6 as AE_STEP, OBJECTVALUE4 as DBTYPE,   LASTUPDOPRID, LASTUPDDTTM 
from PSPCMPROG M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  43
AND M.OBJECTID1    = PSPROJECTITEM.OBJECTID1
AND M.OBJECTVALUE1 = PSPROJECTITEM.OBJECTVALUE1
AND M.OBJECTVALUE6 = PSPROJECTITEM.OBJECTVALUE3 /* AE_STEP */
/* AE_SECTION blank-padded to 8, MARKET on 3 chars, database name or default with padding , AE's EFFDT - typically (only?) 1900-01-01= */
AND PSPROJECTITEM.OBJECTVALUE2 like M.OBJECTVALUE2  ||  '%'  ||  M.OBJECTVALUE3  ||  M.OBJECTVALUE4  ||  '%'  ||  M.OBJECTVALUE5 
)
AND M.OBJECTID1 = 66;
select OBJECTVALUE1 as PNLNAME, OBJECTVALUE2 as EVENT_NAME,   LASTUPDOPRID, LASTUPDDTTM 
from PSPCMPROG M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  44
AND M.OBJECTID1    = PSPROJECTITEM.OBJECTID1
AND M.OBJECTVALUE1 = PSPROJECTITEM.OBJECTVALUE1
AND M.OBJECTID2    = PSPROJECTITEM.OBJECTID2
AND M.OBJECTVALUE2 = PSPROJECTITEM.OBJECTVALUE2
)
AND M.OBJECTID1 = 9;


/* Can't fetch changes for 45 [Page Field PeopleCode] - reason objecttype configuration is flagged as 'not done' */

select OBJECTVALUE1 as PNLGRPNAME, OBJECTVALUE2 as MARKET, OBJECTVALUE3 as EVENT_NAME,   LASTUPDOPRID, LASTUPDDTTM 
from PSPCMPROG M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  46
AND M.OBJECTID1    = PSPROJECTITEM.OBJECTID1
AND M.OBJECTVALUE1 = PSPROJECTITEM.OBJECTVALUE1
AND M.OBJECTID2    = PSPROJECTITEM.OBJECTID2
AND M.OBJECTVALUE2 = PSPROJECTITEM.OBJECTVALUE2
AND M.OBJECTID3    = PSPROJECTITEM.OBJECTID3
AND M.OBJECTVALUE3 = PSPROJECTITEM.OBJECTVALUE3
)
AND M.OBJECTID1 = 10 AND M.OBJECTID2 = 39 AND M.OBJECTID3 = 12;
select OBJECTVALUE1 as PNLGRPNAME, OBJECTVALUE2 as MARKET, OBJECTVALUE3 as RECNAME, OBJECTVALUE4 as EVENT_NAME,   LASTUPDOPRID, LASTUPDDTTM 
from PSPCMPROG M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  47
AND M.OBJECTID1    = PSPROJECTITEM.OBJECTID1
AND M.OBJECTVALUE1 = PSPROJECTITEM.OBJECTVALUE1
AND M.OBJECTID2    = PSPROJECTITEM.OBJECTID2
AND M.OBJECTVALUE2 = PSPROJECTITEM.OBJECTVALUE2
AND M.OBJECTID3    = PSPROJECTITEM.OBJECTID3
AND M.OBJECTVALUE3 = PSPROJECTITEM.OBJECTVALUE3
AND PSPROJECTITEM.OBJECTVALUE4 = M.OBJECTVALUE4
)
AND M.OBJECTID1 = 10 AND M.OBJECTID2 = 39 AND M.OBJECTID3 = 1  AND M.OBJECTID4 = 12;
select OBJECTVALUE1 as PNLGRPNAME, OBJECTVALUE2 as MARKET, OBJECTVALUE3 as RECNAME, OBJECTVALUE4 as FIELDNAME, OBJECTVALUE5 as EVENT_NAME,   LASTUPDOPRID, LASTUPDDTTM 
from PSPCMPROG M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  48
AND M.OBJECTID1    = PSPROJECTITEM.OBJECTID1
AND M.OBJECTVALUE1 = PSPROJECTITEM.OBJECTVALUE1
AND M.OBJECTID2    = PSPROJECTITEM.OBJECTID2
AND M.OBJECTVALUE2 = PSPROJECTITEM.OBJECTVALUE2
AND M.OBJECTID3    = PSPROJECTITEM.OBJECTID3
AND M.OBJECTVALUE3 = PSPROJECTITEM.OBJECTVALUE3
AND PSPROJECTITEM.OBJECTVALUE4 like M.OBJECTVALUE4  ||  '%'  ||  M.OBJECTVALUE5
)
AND M.OBJECTID1 = 10 AND M.OBJECTID2 = 39 AND M.OBJECTID3 = 1  AND M.OBJECTID4 = 2;
select STYLESHEETNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSSTYLSHEETDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  50
AND M.STYLESHEETNAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select CLASSID,  CLASSDEFNDESC, LASTUPDOPRID, LASTUPDDTTM 
from PSCLASSDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  53
AND M.CLASSID = PSPROJECTITEM.OBJECTVALUE1
)
;
select PORTAL_NAME, PORTAL_REFTYPE, PORTAL_OBJNAME,   LASTUPDOPRID, LASTUPDDTTM 
from PSPRSMDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  55
AND M.PORTAL_NAME = PSPROJECTITEM.OBJECTVALUE1 AND M.PORTAL_REFTYPE = PSPROJECTITEM.OBJECTVALUE2 AND M.PORTAL_OBJNAME = PSPROJECTITEM.OBJECTVALUE3
)
;
select URL_ID,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSURLDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  56
AND M.URL_ID = PSPROJECTITEM.OBJECTVALUE1
)
;
select PACKAGEID, PACKAGEROOT, QUALIFYPATH,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSPACKAGEDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  57
AND M.PACKAGEID = PSPROJECTITEM.OBJECTVALUE1 AND M.PACKAGEROOT = PSPROJECTITEM.OBJECTVALUE2 AND M.QUALIFYPATH = PSPROJECTITEM.OBJECTVALUE3
)
;
select OBJECTVALUE1, OBJECTVALUE2, OBJECTVALUE3, OBJECTVALUE4,   LASTUPDOPRID, LASTUPDDTTM 
from PSPCMPROG M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  58
/* need to account for 3 package levels and the last OBJECTVALUE in PCPCMPROG is OnExecute with id 12 but blank/0 in PSPROJECTITEM
appclass, the leaf is ID 107.
*/
AND M.OBJECTID1    = PSPROJECTITEM.OBJECTID1
AND M.OBJECTVALUE1 = PSPROJECTITEM.OBJECTVALUE1
and (
       (M.OBJECTID2 = 107 AND M.OBJECTID2 = PSPROJECTITEM.OBJECTID2 AND M.OBJECTVALUE2 = PSPROJECTITEM.OBJECTVALUE2
        AND M.OBJECTID3 = 12
        )
        or
       (M.OBJECTID2 = 105 AND M.OBJECTID2 = PSPROJECTITEM.OBJECTID2 AND M.OBJECTVALUE2 = PSPROJECTITEM.OBJECTVALUE2
        AND M.OBJECTID3 = 107 AND M.OBJECTID3 = PSPROJECTITEM.OBJECTID3 AND M.OBJECTVALUE3 = PSPROJECTITEM.OBJECTVALUE3
        AND M.OBJECTID4 = 12
        )
       or
       (
        M.OBJECTID2 = 105 AND M.OBJECTID2 = PSPROJECTITEM.OBJECTID2 AND M.OBJECTVALUE2 = PSPROJECTITEM.OBJECTVALUE2
        and M.OBJECTID3 = 106 AND M.OBJECTID3 = PSPROJECTITEM.OBJECTID3 AND M.OBJECTVALUE3 = PSPROJECTITEM.OBJECTVALUE3
        AND M.OBJECTID4 = 107 AND M.OBJECTID4 = PSPROJECTITEM.OBJECTID4 AND M.OBJECTVALUE4 = PSPROJECTITEM.OBJECTVALUE4
        AND M.OBJECTID5 = 12
        )
    )
)
AND M.OBJECTID1 = 104;
select IB_SERVICENAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSSERVICE M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  79
AND M.IB_SERVICENAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select IB_OPERATIONNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSOPERATION M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  80
AND M.IB_OPERATIONNAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select IB_OPERATIONNAME, HANDLERNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSOPRHDLR M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  81
AND M.IB_OPERATIONNAME = PSPROJECTITEM.OBJECTVALUE1 AND M.HANDLERNAME = PSPROJECTITEM.OBJECTVALUE2
)
;
select IB_OPERATIONNAME, VERSIONNAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSOPRVERDFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  82
AND M.IB_OPERATIONNAME = PSPROJECTITEM.OBJECTVALUE1 AND M.VERSIONNAME = PSPROJECTITEM.OBJECTVALUE2
)
;
select ROUTINGDEFNNAME, EFFDT,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSIBRTNGDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  83
AND M.ROUTINGDEFNNAME = PSPROJECTITEM.OBJECTVALUE1 AND M.EFFDT = PSPROJECTITEM.OBJECTVALUE2
)
;
select QUEUENAME,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSQUEUEDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  84
AND M.QUEUENAME = PSPROJECTITEM.OBJECTVALUE1
)
;
select TMPLDEFN_ID,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSXPTMPLDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  85
AND M.TMPLDEFN_ID = PSPROJECTITEM.OBJECTVALUE1
)
;
select REPORT_DEFN_ID,  DESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSXPRPTDEFN M
WHERE LASTUPDDTTM >= '15-Aug-16'
AND LASTUPDOPRID IN ('MY_OPRID')
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN  ('MY_DELIV','MY_IGNORE') 
AND   OBJECTTYPE  =  86
AND M.REPORT_DEFN_ID = PSPROJECTITEM.OBJECTVALUE1
)
;


/* Can't fetch changes for 87 [XMLP File Definition] - reason no LASTUPDOPRID or LASTUPDDTTM on record PSXPTMPLFILEDEF */


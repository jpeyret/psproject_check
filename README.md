# psproject_check
Checks that all your changed objects are included in your delivery PeopleSoft Project.

How to use it
-------------

Best explained directly via SQL, using the Oracle version in this case:


Note:  You will have to copy this sql and adjust the OPRID, LASTUPDTTM
and PROJECTNAMES criteria manually - a global replace with an editor should do the trick
those criteria are EXACTLY the same on each object type.

/* each type of object has its own query, there are about 50-60 of them at this point */

```sql
select RECNAME, RECDESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSRECDEFN M
```

/* Cut off date for checking Records that have been updated.  
  - The exact format is dependent on your Oracle configuration and may need to be adjusted.
  - The cutoff date is probably best set to the day at which you started development.
*/

```sql
WHERE LASTUPDDTTM >= '01-Sep-16'
```


/* and the OPRIDs whose changes you are interested in 
   Typically, this would be your user, not PS
*/
```sql
AND LASTUPDOPRID IN ('PS')
```


/*

Now, this is the important part.  You can specify as many projects as you want here.  
But a match for the object in any of the given projects means that the object is ignored, 
even if it was recently modified by the checked OPRID.  If you gradually add objects to
your delivery project and also to the ignore project, your objects are seen to be accounted
for and do not appear in the script's output anymore.

*/

```sql
AND NOT EXISTS
(select 1
FROM PSPROJECTITEM
WHERE PROJECTNAME IN ('MY_DELIV','MY_IGNORE') 
AND OBJECTTYPE = 0
AND M.RECNAME = PSPROJECTITEM.OBJECTVALUE1
)
;
```

Typical usage
-------------

The most common use follows:

- change the two delivered project name to:

	- The PROJECTNAME for the project you WANT to deliver.  Let's say `MY_DELIV`, this is the project you want to Upgrade/Copy to a new database, file.

	- A generic projectname, like `MY_IGNORE`, that tracks all the objects you don't care about, like Save As... backups, mistakenly saved objects, etc...

- change the OPRID to your PeopleSoft OPRID.

- When you first run the SQL, assuming that both projects start out empty, you should see all your recent changes in the SQL results.

- Open up **Application Designer** and start adding objects that you do care about to `MY_DELIV`.  You shouldn't have to insert related objects in most cases.  For example, don't automatically add all Fields for a Record you are delivering, let the script flag modified Fields and add those individually.

- And, as you encounter changes you **don't** want, just add those objects to `MY_IGNORE`.

Rinse and repeat.


What do you gain?
-----------------

By using this, you avoid getting errors in your downstream environment because you forgot something. And, because you can now
deliver only what has **really** changed, you will be able to track exactly what project first introduced changes to an object.

If you then tie projects to a formal change delivery tracking documentation, you should be able to tie those changes to the business requirements (or bug fixes) that motivated them.


Contributing
-----------------

This repo is a bit unusual - the SQL is generated, and the generator is part of a larger framework that is not on Github yet.  This means that forking it, editing the whole script by hand and then doing a pull request isn't going to work.

- If you want another database supported, say DB2, take a few audit queries, say Records and Application Engine Peoplecode (objecttype = 43) and make sure you can run it in your SQL utility.  Then, once that works, open and issue to let me know and I will add support for DB2 audit sql generation.

- If you find a problem with a given objecttype, or if you want one of the missing objecttypes covered, again, write the query for it, make it work and tell me about it.

- If you want some generic improvements, like for example better information than "0 rows found" in Oracle, same thing - get it working on one or two objecttypes.

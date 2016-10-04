# psproject_check
Checks that all your changed objects are included in your delivery PeopleSoft Project.

How to use it
-------------

Best explained directly via SQL, using the Oracle version in this case:


Note:  You will have to copy this sql and adjust the OPRID, LASTUPDTTM
and PROJECTNAMES criteria manually - a global replace with an editor should do the trick
those criteria are EXACTLY the same on each object type.

select RECNAME, RECDESCR, LASTUPDOPRID, LASTUPDDTTM 
from PSRECDEFN M

/* Cut off date for checking Records that have been updated.  
  - The exact format is dependent on your Oracle configuration and may need to be adjusted.
  - The cutoff date is probably best set to the day at which you started development.
*/
WHERE LASTUPDDTTM >= '01-Sep-16'


/* and the OPRIDs whose changes you are interested in 
   Typically, this would be your user, not PS
*/
AND LASTUPDOPRID IN ('PS')


AND NOT EXISTS
(select 1
FROM PSPROJECTITEM

/*

Now, this is the important part.  You can specify as many projects as you want here.  
But a match for the object in any of the given projects means that the object is ignored, 
even if it was recently modified by the checked OPRID.  If you gradually add objects to
your delivery project and also to the ignore project, your objects are seen to be accounted
for and do not appear in the script's output anymore.

*/

WHERE PROJECTNAME IN ('MY_DELIV','MY_IGNORE') 
AND OBJECTTYPE = 0
AND M.RECNAME = PSPROJECTITEM.OBJECTVALUE1
)
;


Typical usage
-------------

The most common use follows:

- change the two delivered project name to:

	- The PROJECTNAME for the project you WANT to deliver.  Let's say MY_DELIV, this is the project you want to Upgrade/Copy to a new database, file.

	- A generic projectname, like `MY_IGNORE`, that tracks all the objects you don't care about, like Save As... backups, mistakenly saved objects, etc...

- When you first run the SQL, assuming that both projects start out empty, you should see all your recent changes in the SQL results.

- Open up Application Designer and start adding objects that you do care about to MY_DELIV.  You shouldn't have to insert related objects in most cases.

- And, as you encounter changes you DON'T want, just add those objects
to MY_IGNORE.

Rinse and repeat.


What do you gain?
-----------------

By using this, you avoid getting errors in your downstream environment because you forgot something. And, because you can now
deliver only what has **really** changed, you will be able to track exactly what project first introduced changes to an object.

If you then tie projects to a formal change delivery tracking documentation, you should be able to tie those changes to the business requirements (or bug fixes) that motivated them.






/* abGetHierNetName.il

Author A.D.Beckett
Group Custom IC (UK), Cadence Design Systems Ltd.
Language SKILL
Date Dec 13, 2004
Modified
By

Simple functions to retrieve the hierarchical net name
of a net in a design.

The GUI interface is abShowHierNetName()

***************************************************

SCCS Info: @(#) abGetHierNetName.il 12/13/04.15:16:23 1.1

*/

/*****************************************************************
* *
* (abGetHierNetName net @optional (window (hiGetCurrentWindow))) *
* *
* Given a net object, return the adjusted hierarchical net name. *
* By adjusted, we mean that the path is adjusted to the net name *
* at the highest level. *
* *
*****************************************************************/

(procedure (abGetHierNetName net @optional (window (hiGetCurrentWindow)))
(let (netName)
(setq netName
(strcat
"/"
(buildString
(foreach mapcar i (geGetHierMemInst window)
(dbGetMemName (dbGetq (car i) name) (cadr i)))
"/"
)
))
(setq netName
(if (netName=="/")
(strcat netName (dbGetq net name))
(strcat netName "/" (dbGetq net name))
))
(geGetAdjustedPath window netName)
))

/*******************************************************************
* *
* (abShowHierNetName) *
* *
* Very simple GUI which expects you to have a single wire segment *
* selected - and pops up a dialog box showing the hierarchical net *
* name. *
* *
*******************************************************************/

(procedure (abShowHierNetName)
(let ((selSet (geGetSelSet)))
(cond
((or (null selSet)
(cdr selSet)
(null (dbGetq (car selSet) net)))
(hiDisplayAppDBox
?name 'abShowHierNetNameDBox
?dboxBanner "Show Hier Net Name Error"
?dboxText "You must have a single wire selected"
?dialogType hicErrorDialog
?dialogStyle 'modal
?buttonLayout 'Close
)
)
(t
(hiDisplayAppDBox
?name 'abShowHierNetNameDBox
?dboxBanner "Show Hier Net Name"
?dboxText (abGetHierNetName (dbGetq (car selSet) net))
?dialogType hicInformationDialog
?dialogStyle 'modal
?buttonLayout 'Close
)
)
) ; cond
) ; let
) ; procedure

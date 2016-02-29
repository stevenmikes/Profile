;; delete alias, speeds up deleting thousands of shapes
procedure( myDelete()
    objects = geGetSelSet()
    cond(
    (objects == nil leHiDelete())
    (t
        geDeselectAllFig()
        foreach(obj objects
            dbDeleteObject(obj)
        );foreach
    )
    );cond
)

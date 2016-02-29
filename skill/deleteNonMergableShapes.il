procedure(deleteNonMergableShapes()
cv = geGetEditCellView()
shapes = geGetSelSet()
delete_shapes = setof( s shapes cddr(dbGetOverlaps(cv s~>bBox s~>lpp))==nil )
mapcar('dbDeleteObject delete_shapes)
);procedure

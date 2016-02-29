procedure(mergeConnected(@optional (shapes geGetSelSet()) )

cv = geGetEditCellView()
foreach( shape shapes
    merge_shapes = dbGetOverlaps(cv shape~>bBox shape~>lpp)
    merged_shape = leMergeShapes(merge_shapes)
    mergeConnected(merged_shape)
);foreach

);procedure

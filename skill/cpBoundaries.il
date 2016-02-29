libFrom = "stdcell_test"
libTo = "ibm_csoi7rf_bc_1p5v_14t_rvt_v1602_cdslib"
foreach(cell ddGetObj(libFrom)~>cells
    printf("Copying boundaries from %s to %s for cell: %s\n", libFrom, libTo, cell~>name)
    cv_from = dbOpenCellViewByType(libFrom, cell~>name, "layout", nil, "r")
    prPoints = cv_from~>prBoundary~>points
    snapPoints = cv_from~>snapBoundary~>points
    cv_to = dbOpenCellViewByType(libTo, cell~>name, "layout", nil, "a")
    dbCreatePRBoundary(cv_to, prPoints)
    dbCreateSnapBoundary(cv_to, snapPoints)
    dbSave(cv_to)
    dbClose(cv_to)
    dbClose(cv_from)
);foreach

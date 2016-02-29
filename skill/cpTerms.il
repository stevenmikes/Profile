libFrom = "stdcell_test"
libTo = "ibm_csoi7rf_bc_1p5v_14t_rvt_v1602_cdslib"
foreach(cell ddGetObj(libFrom)~>cells
    printf("Copying terminals from %s to %s for cell: %s\n", libFrom, libTo, cell~>name)
    cv_from = dbOpenCellViewByType(libFrom, cell~>name, "layout", nil, "r")
    cv_to = dbOpenCellViewByType(libTo, cell~>name, "layout", nil, "a")

    foreach(term cv_from~>nets~>term
        printf("   processing net %s\n", term~>name)
        netID = dbMakeNet(cv_to, term~>name)
        termID = dbCreateTerm(netID, nil, term~>direction, 0, nil)
    );foreach

    dbSave(cv_to)
    dbClose(cv_to)
    dbClose(cv_from)
);foreach

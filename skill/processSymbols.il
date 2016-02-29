libName = "ibm_csoi7rf_bc_1p5v_14t_rvt_v1602_cdslib"
cellsList = ddGetObj(libName)~>cells
foreach(cell cellsList
    if(ddGetObj(libName, cell~>name, "symbol") then
        cv = dbOpenCellViewByType(libName, cell~>name, "symbol", nil, "a")
        texts = setof(x cv~>shapes x~>layerName == "text")
        foreach(text texts
            dbDeleteObject(text)
        )
        ddsServOpen(libName, cell~>name, "symbol", "edit", nil)
        schHiVICAndSave()
        leCloseWindow()
    );if
);foreach

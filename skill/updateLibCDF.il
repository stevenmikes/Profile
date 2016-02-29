procedure( updateLibCDF(libName)
cellsList = ddGetObj(libName)~>cells
foreach(cell cellsList
    if(ddGetObj(libName, cell~>name, "schematic") then
        cv = dbOpenCellViewByType(libName, cell~>name, "schematic", nil, "a")
        CCSinvokeCdfCallbacks(cv)
        schCheck(cv)
        dbSave(cv)
    );if
);foreach
);procedure

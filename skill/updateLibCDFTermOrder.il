procedure(updateLibCDFTermOrder(libName)
let((cellsList cv texts)
    cellsList = ddGetObj(libName)~>cells
    foreach(cell cellsList
        if( ddGetObj(libName, cell~>name, "symbol") && ddGetObj(libName, cell~>name, "schematic") then
            printf("Updating CDF Term Order for Cell: %s\n" cell~>name)
            cv = dbOpenCellViewByType(libName cell~>name "schematic" nil "r")
            artGenerateHierSymbolCDF(cv t)
        ); if
    );foreach
);let
);procedure

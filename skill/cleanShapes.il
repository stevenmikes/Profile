procedure(del_layer(libname layer)
    let((libId viewn cv )
    libId = ddGetObj(libname)
    viewn = "layout"
    ;;cv= geGetEditCellView()

    foreach(cell libId~>cells
        when(member(viewn cell~>views~>name)
            cv = dbOpenCellViewByType(libname cell~>name viewn nil "a")
            info(".. Processing %s\n" cv~>cellName)
            foreach(shape cv~>shapes
                when( (shape~>layerName == layer)
                    dbDeleteObject(shape)
                ) ;when
            );foreach
            dbSave(cv)
            dbReopen(cv "r")
        );when
    );foreach
    );let
);procedure

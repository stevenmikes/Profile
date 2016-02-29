procedure( resizeDots(size)
let( (cv ury urx llx lly bBox)
    cv = geGetEditCellView()
    schSetEnv("dotOverlap" size)
    foreach(dot setof(shape cv~>shapes shape~>objType=="ellipse" && shape~>layerName=="wire")
        bBox = dot~>bBox
        dbDeleteObject(dot)
        schSolder(cv centerBox(bBox))
    ); foreach
); let
); end procedure

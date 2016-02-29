procedure( copyLayer(cv lpp)
let( (shapeList newlpp)
    newlppList=list(
        '("POBLK" "dummy")
        '("DMEXCL" "dummy1")
        '("DMEXCL" "dummy2")
        '("DMEXCL" "dummy3")
        '("DMEXCL" "dummy4")
        '("DMEXCL" "dummy5")
        '("DMEXCL" "dummy6")
        '("DMEXCL" "dummy7")
        '("DMEXCL" "dummy8")
    )
    shapeList=setof(i cv~>shapes i~>lpp==lpp)
    foreach( newlpp newlppList
        dbLayerOr(cv newlpp shapeList nil)
    );foreach
);let
);procedure

procedure( CCSshowOnlyLayer(layername)
let(
    ((lpp list(layername "drawing")))
    leSetEntryLayer(lpp)
    leSetAllLayerVisible(nil)
    hiRedraw()
);let
);procedure

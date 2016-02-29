procedure( CCStoggleMetals(num @optional (allLayers nil) )
let(
    ((metlay list(sprintf(nil "M%d" num) "drawing")))
    if( num==11 then
        metlay=list("AP" "drawing")
    );if AP

    if( allLayers then
        leSetEntryLayer(metlay)
        leSetAllLayerVisible(nil)
    else
        if(leIsLayerVisible(metlay) then
            leSetLayerVisible(metlay nil)
        else
            leSetLayerVisible(metlay t)
        );ifelse
    );ifelse
    hiRedraw()
);let
);procedure


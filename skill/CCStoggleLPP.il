procedure( CCStoggleLPP(layer purpose)
let(
    ((lpp list(layer purpose)))
    if(leIsLayerVisible(lpp) then
        leSetLayerVisible(lpp nil)
    else
        leSetLayerVisible(lpp t)
    );ifelse
    hiRedraw()
);let
);procedure

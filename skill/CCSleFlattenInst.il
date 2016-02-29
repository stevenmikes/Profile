procedure( CCSleFlattenInst(libName cellName )
let( (cv topInstList )
if( ddGetObj( libName cellName "layout" ) then
    cv = dbOpenCellViewByType( libName cellName "layout" "maskLayout" "a")
    ;open the layout in non graphical mode
)
topInstList = cv~>instances 
;get a list of all instances in the cellview
foreach(inst topInstList
    leFlattenInst( inst 31 t nil nil )
    ;if(inst~>mosaicType  then
    ;    leFlattenInst( inst 1 t nil nil ) 
    ;    ;flatten the mosaic instance
    ;);if
    ;if it is not a  mosaic flatten with this code
);foreach
dbSave(cv)   ;optional save command
dbClose(cv)  ;optional close command
);let
);procedure

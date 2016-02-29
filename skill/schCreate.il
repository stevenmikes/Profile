procedure( rkSchConnectivityExample(libName cellName "tt")
let( (masterId x y cvId instTermBbox instTermBboxInCv
instTermLLX instTermLLY instTermURX instTermURY
wireOriginX wireOriginY wireSpace wireWidth wireLength
deltaX deltaY wireLabel wireOrientation wireJustification
wireEndX wireEndY termWire
)
x=1
y=1
wireSpace=0.0625
wireWidth=0
wireLength=0.6
; Open the CV to create
cvId=dbOpenCellViewByType(libName cellName "schematic"
"schematic" "w")
; Open the master cell to instatiate
masterId = dbOpenCellViewByType("analogLib" "nmos4"
"symbol" "schematicSymbol" "r")
; Create an instance of analogLib/nmos4 at point 1:1
schCreateInst(cvId masterId nil x:y "R0")
; Search all the instances in the CV
foreach( inst cvId~>instances
printf( "Instance : %s\n" inst~>name )
; Print all the Instance terminals for each instance found
; in the CV.
foreach( instTerm inst~>instTerms
    ; For each instance terminal, i.e D-S-B-G, get the bbox
    ; of the  terminal's little square then use dbTransformBBox
    ; to transform the pin bbox to the cellview
    instTermBbox=car(instTerm~>term~>pins~>fig~>bBox)
    instTermBboxInCv=dbTransformBBox(instTermBbox inst~>transform)
    printf( " Instance Terminal= %s : absBbox=%L : relBbox=%L\n" instTerm~>name instTermBbox instTermBboxInCv)
    ; get the X/Y coordinates from the BBOX
    instTermLLX=xCoord(lowerLeft(instTermBboxInCv))
    instTermLLY=yCoord(lowerLeft(instTermBboxInCv))
    instTermURX=xCoord(upperRight(instTermBboxInCv))
    instTermURY=yCoord(upperRight(instTermBboxInCv))
    wireOriginX=(instTermLLX+instTermURX)/2
    wireOriginY=(instTermLLY+instTermURY)/2
    ; A little bit of code to make a KOF nice schematic
    case(lowerCase(instTerm~>name)
        ("d"
        deltaX=0
        deltaY=wireLength
        wireLabel="Drain"
        wireOrientation="R90"
        wireJustification="lowerRight"
        )
        ("s"
        deltaX=0
        deltaY=-wireLength
        wireLabel="Source"
        wireOrientation="R90"
        wireJustification="lowerLeft"
        )
        ("b"
        deltaX=wireLength
        deltaY=0
        wireLabel="Bulk"
        wireOrientation="R0"
        wireJustification="lowerRight"
        )
        ("g"
        deltaX=-wireLength
        deltaY=0
        wireLabel="Gate"
        wireOrientation="R0"
        wireJustification="lowerLeft"
        )
        (t
        printf("Unknow terminal !!! \n")
        )
    )
    wireEndX=wireOriginX+deltaX
    wireEndY=wireOriginY+deltaY
    ; Create the wire
    termWire=schCreateWire(cvId "draw" "full" list(wireOriginX:wireOriginY wireEndX:wireEndY) wireSpace wireSpace wireWidth)
    ; createLabel
    schCreateWireLabel(cvId car(termWire) wireEndX:wireEndY wireLabel wireJustification wireOrientation "fixed"  wireSpace nil)

    ) ; foreach
) ; foreach

; Check and save, close the DB and then open the
; schematic in Read.
schCheck(cvId)
getWarn()
dbSave(cvId)
dbClose(cvId)
geOpen(?lib libName ?cell cellName ?view "schematic"
?viewType "schematic" ?mode "r")
)
)
; Skill Ends here

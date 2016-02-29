procedure( createRes(libName cellName "tt")
let( (masterId x y cvId R instTermBbox instTermBboxInCv
instTermLLX instTermLLY instTermURX instTermURY
wireOriginX wireOriginY wireSpace wireWidth wireLength
deltaX deltaY wireLabel wireOrientation wireJustification
wireEndX wireEndY termWire
)
R=365

x=0
y=1.0
wireSpace=0.0625
wireWidth=0
wireLength=0.625
; Open the CV to create
cvId=dbOpenCellViewByType(libName cellName "schematic" "schematic" "w")
; Open the master cell to instatiate
masterId = dbOpenCellViewByType("analogLib" "res" "symbol" "schematicSymbol" "r")

load("/projects/katahdin/tsmcN65_02p00/work/smikes/mdlsims/ratt/rlist.il")
i=0
foreach( R RLIST
    ; Create an instance of res at point x:y
    inst = schCreateInst(cvId masterId nil x:i*y "R0")
    ; Change the Resistance to R
    inst~>r=R
    printf( "Instance : %s\n" inst~>name )
    ; Print all the Instance name
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
        ; A little bit of code to make a nice schematic
        case(lowerCase(instTerm~>name)
            ("plus"
            wireLabel=strcat("VR<" sprintf(nil "%d" i) ">")
            deltaY=wireLength
            wireOrientation="R90"
            wireJustification="lowerCenter"
            wireEndX=wireOriginX
            wireEndY=wireOriginY+deltaY
            wireLabelX=wireOriginX-0.03125
            wireLabelY=wireOriginY+deltaY/2
            ; Create the wire
            termWire=schCreateWire(cvId "draw" "full" list(wireOriginX:wireOriginY wireEndX:wireEndY) wireSpace wireSpace wireWidth)
            ; createLabel
            schCreateWireLabel(cvId car(termWire) wireLabelX:wireLabelY wireLabel wireJustification wireOrientation "stick"  wireSpace nil)
            )
            ("minus"
            if( ( i==0 ) then
                wireLabel="VM"
                deltaY=-wireLength
                wireOrientation="R90"
                wireJustification="lowerCenter"
                wireEndX=wireOriginX
                wireEndY=wireOriginY+deltaY
                wireLabelX=wireOriginX-0.03125
                wireLabelY=wireOriginY+deltaY/2
                ; Create the wire
                termWire=schCreateWire(cvId "draw" "full" list(wireOriginX:wireOriginY wireEndX:wireEndY) wireSpace wireSpace wireWidth)
                ; createLabel
                schCreateWireLabel(cvId car(termWire) wireLabelX:wireLabelY wireLabel wireJustification wireOrientation "stick"  wireSpace nil)
                )
            ) ; if
            (t
            printf("Unknow terminal !!! \n")
            )
        )
    ) ; foreach term
    i=i+1
) ; foreach R

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

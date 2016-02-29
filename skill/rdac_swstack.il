defclass( Pin 
    () ; superclass
    (
    (x @initarg x) ; x coord
    (y @initarg y) ; y coord
    )
)

procedure( create_pin_from_term(instTerm)
let( (pin instTermLLX instTermLLY instTermURX instTermURY
      instTermBbox instTermBboxInCv wireOriginX wireOriginY)

    instTermBbox = car(instTerm~>term~>pins~>fig~>bBox)
    instTermBboxInCv = dbTransformBBox(instTermBbox inst~>transform)
    instTermLLX = xCoord(lowerLeft(instTermBboxInCv))
    instTermLLY = yCoord(lowerLeft(instTermBboxInCv))
    instTermURX = xCoord(upperRight(instTermBboxInCv))
    instTermURY = yCoord(upperRight(instTermBboxInCv))
    wireOriginX = (instTermLLX+instTermURX)/2
    wireOriginY = (instTermLLY+instTermURY)/2
    makeInstance( 'Pin ?x wireOriginX ?y wireOriginY )
);let
);procedure

procedure( draw_wire(start stop labelName labelLoc)
let( (wireSpace wireWidth wireOrientation wireJustification)
    wireSpace = 0.0625
    wireWidth = 0
    wireOrientation = "R0"
    wireJustification = "lowerCenter"
    termWire=schCreateWire(cvId "draw" "full" list(start stop) wireSpace wireSpace wireWidth)
    schCreateWireLabel(cvId car(termWire) labelLoc labelName wireJustification wireOrientation "stick"  wireSpace nil)
);let
);procedure

procedure( draw_wire_left(instTerm, label, lmultiplier)
let( (deltaX wireEndX wireEndY wireLabelX wireLabelY pin)
    pin = create_pin_from_term(instTerm)
    deltaX=lmultiplier*1.25
    wireEndX=pin~>x-deltaX
    wireEndY=pin~>y
    wireLabelX=pin~>x-deltaX/2
    wireLabelY=pin~>y+0.03125
    draw_wire(pin~>x:pin~>y wireEndX:wireEndY label wireLabelX:wireLabelY)
);let
);procedure

procedure( draw_wire_right(instTerm, label, lmultiplier)
let( (deltaX wireEndX wireEndY wireLabelX wireLabelY pin)
    pin = create_pin_from_term(instTerm)
    deltaX=lmultiplier*1.25
    wireEndX=pin~>x+deltaX
    wireEndY=pin~>y
    wireLabelX=pin~>x+deltaX/2
    wireLabelY=pin~>y+0.03125
    draw_wire(pin~>x:pin~>y wireEndX:wireEndY label wireLabelX:wireLabelY)
);let
);procedure

procedure( buildSelLabel(i)
let( (wireList torc)
wireList=nil
for(j 0 BITS-1
    ; <> is bit field syntax
    if(i<j>==0 then 
        torc="c"
    else
        torc="t"
    );if
    wireList=cons(sprintf(nil "sel_%s<%d>" torc j) wireList)
);for
buildString(wireList ",")
);let
);procedure

procedure( buildAntLabel(i)
let( (torc modi)
    modi = mod(i 1024)
    if(mod(modi 2*BITS) >= BITS then
        torc = "c"
    else
        torc = "t"
    );if
    ret = sprintf(nil "sel_%s<%d>" torc mod(modi BITS)) 
);let
);procedure

procedure( drawWiresOnInstPins(inst i)
let( (wireLabel)
foreach( instTerm inst~>instTerms
    case(instTerm~>name
        ("GND"
        wireLabel = "GND"
        draw_wire_right(instTerm, wireLabel, 1)
        )
       
        ("VDD"
        wireLabel = "VDD"
        draw_wire_left(instTerm, wireLabel, 1)
        )
        
        ("VO"
        wireLabel = "VO"
        draw_wire_right(instTerm, wireLabel, 1)
        )

        ("TAP"
        wireLabel=strcat("TAP<" sprintf(nil "%d>" i))
        draw_wire_left(instTerm, wireLabel, 1)
        )

        ("sel<12:0>"
        wireLabel = buildSelLabel(i)
        draw_wire_left(instTerm, wireLabel, ceiling(float(BITS)/2))
        )

        ("ANT"
        wireLabel = buildAntLabel(i)
        draw_wire_right(instTerm, wireLabel, 1)
        )

        (t
        printf("Unknow terminal !!! \n")
        )
    )
);foreach term
);let
);procedure

procedure( createPins(start stop)
let( (pinMaster)
tapPin = sprintf(nil "TAP<%d:%d>" start stop)
pinMaster = dbOpenCellViewByType("basic" "iopin" "symbolr")
schCreateSymbolPin(cvId pinMaster "VDD" "inputOutput" -1:-1 "R0")
schCreateSymbolPin(cvId pinMaster "GND" "inputOutput" -1:-1.125 "R0")
schCreateSymbolPin(cvId pinMaster tapPin "inputOutput" -1:-1.25 "R0")
schCreateSymbolPin(cvId pinMaster "sel_t<12:0>" "inputOutput" -1:-1.375 "R0")
schCreateSymbolPin(cvId pinMaster "sel_c<12:0>" "inputOutput" -1:-1.5 "R0")
schCreateSymbolPin(cvId pinMaster "VO" "inputOutput" -1:-1.625 "R0")
);let
);procedure


procedure( create_swstack(libName cellName "tt")
let( (masterId x y cvId inst BITS)

BITS = 13
x = 0
y = 1.0

masterId = dbOpenCellViewByType(libName "RDAC_DECODER" "symbol" "schematicSymbol" "r")
cvId = dbOpenCellViewByType(libName cellName "schematic" "schematic" "w")
for( i 0 2**BITS-1
    inst = schCreateInst(cvId masterId nil x:i*y "R0")
    printf( "Instance : %s\n" inst~>name )
    drawWiresOnInstPins(inst i)
)
createPins(0, 2**BITS-1)
;schCheck(cvId)
;getWarn()
dbSave(cvId)
dbClose(cvId)

;geOpen(?lib libName ?cell cellName ?view "schematic"
;       ?viewType "schematic" ?mode "r")
);let
);procedure

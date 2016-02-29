procedure( createPin(cv pinName lpp origin x_len y_len)
let((
    db_outNet db_pinFig db_pin
    xl xr yl yu
    );vars
    xl=car(origin)-x_len/2
    xr=car(origin)+x_len/2
    yl=cadr(origin)-y_len/2
    yu=cadr(origin)+y_len/2
    db_outNet=dbCreateNet(cv pinName)
    if(db_outNet==nil then
        db_outNet=dbFindNetByName(cv pinName)
    );if
    db_pinFig=dbCreateRect(cv lpp list(xl:yl xr:yu))
    db_pin=dbCreatePin(db_outNet db_pinFig pinName)
    db_pin~>term~>direction = "inputOutput"
    dbCreateLabel(cv lpp origin pinName "centerCenter" "R0" "stick" 0.07)
);let
);procedure

;create an array of pins
procedure( createPins(cv pinName pinStartStop lpp origin1 xlen ylen xdelta ydelta)
let((
    n n_origin n_pinName o_x o_y
    )
    n = car(pinStartStop)
    for( i 0 cadr(pinStartStop)-car(pinStartStop)
        o_x=car(origin1)
        o_y=cadr(origin1)
        n_origin=list(o_x+i*xdelta o_y+i*ydelta)
        n_pinName=strcat(pinName sprintf(nil "<%d>" n))
        createPin(cv n_pinName lpp n_origin xlen ylen)
        n=n+1
    );for
);let
);procedure

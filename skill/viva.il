procedure( vivaNextGraphWindow()
let( (wlist wthis wnext)
    wlist = awvGetWindowList()
    wthis = awvGetCurrentWindow()
    wnext = cadr(member(wthis, wlist)) || car(wlist)
    _vvSetCurrentWindow("unbound" sprintf(nil "%s" wnext))
); end let
); end procedure

procedure( vivaPrevGraphWindow()
let( (wlist wthis wprev i)
    wlist = awvGetWindowList()
    wthis = awvGetCurrentWindow()
    if( eq(wthis car(wlist)) then
        wprev = car(last(wlist))
    else
        wprev = car(wlist)
        while(not(eq(cadr(member(wprev wlist)) wthis))
            wprev = cadr(member(wprev wlist))
        ); end while
    ); end if
    _vvSetCurrentWindow("unbound" sprintf(nil "%s" wprev))
); end let
); end procedure

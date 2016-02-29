defun(_round2 ( fl_num)
   mult_num = fl_num*100
   new_num = round(mult_num)
   final_num = new_num/100.0
)

libname = "smikes"
cellname = "C4"

cv = dbOpenCellViewByType(libname, cellname, "layout", "maskLayout", "w")

layerList = list("UBM", "PM", "CBD", "AP")
purposeList = list("drawing" "drawing" "drawing" "drawing")
;dlist = list(88.9 33.3 66.7 93.3)   ;  80um
;dlist = list(94.4 37 72.2 98.9)     ;  85um
;dlist = list(100 40.7 77.8 104.4)   ;  90um
dlist = list(111.1 44.4 88.9 115.6) ; 100um
;dlist = list(122.2 50 100 126.7)    ; 110um

for( i 0 length(layerList)-1
    r = nth(i, dlist)/2.0
    s = _round2(r/(1+sqrt(2)))
    lpp = list(nth(i, layerList), nth(i, purposeList))
    points = list(-r:s, -s:r, s:r, r:s, r:-s, s:-r, -s:-r, -r:-s)
    dbCreatePolygon(cv, lpp, points)
);for
dbSave(cv)
dbClose(cv)

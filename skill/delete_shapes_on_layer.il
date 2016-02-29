;; open the cellview for edit, non-graphically for batch compatibility
cv = dbOpenCellViewByType("mylib" "mycell" "layout" "maskLayout" "a")

;; obtain the layer-purpose pair database object id for the
;; "poly" "drawing" layer/purpose combination
del_lpp = car(exists(lp cv~>lpps and(lp~>layerName=="poly" lp~>purpose=="drawing")))

;; iterate over shapes drawn on this layer-purpose pair
;; and delete each object found
foreach( shape del_lpp~>shapes
  dbDeleteObject(shape)
)

The second question was how to move the shapes to a different
layer-purpose pair. Using the first two steps of the above example,
modify the 'foreach' loop to move the shapes to the "metal1" layer:

foreach( shape del_lpp~>shapes
  shape~>lpp = list("metal1" "drawing")
)

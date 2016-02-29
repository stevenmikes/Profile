procedure( drawDiagWire()
    for(i 1 100
        leMoveCursor(0 legRpDelta)
        mouseAddPt()
        leMoveCursor(legRpDelta 0)
        mouseAddPt()
    )
    mouseAddPt()
)

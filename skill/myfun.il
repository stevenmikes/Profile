procedure(CleanupPG()
CCS_RemoveShapeOnLayer(?layerName "M1" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "M2" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "M3" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "M4" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "M5" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "B1" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "B2" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "E1" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "E2" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "E3" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "X1" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "X2" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "X3" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "RA" ?purpose "pin")
CCS_RemoveShapeOnLayer(?layerName "RB" ?purpose "pin")
CCS_MergeShapesOnLayer(?layerName "M1" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "M2" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "M3" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "M4" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "M5" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "B1" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "B2" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "E1" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "E2" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "E3" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "X1" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "X2" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "X3" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "RA" ?purpose "drawing")
CCS_MergeShapesOnLayer(?layerName "RB" ?purpose "drawing")
)


procedure(schGridFine()
schDisplayOptionsForm->snapSpacing->value=0.03125
_hiFormApplyCB(schDisplayOptionsForm)
)

procedure(schGridCourse()
schDisplayOptionsForm->snapSpacing->value=0.0625
_hiFormApplyCB(schDisplayOptionsForm)
)

procedure(gridfine()
leDisplayOptionsForm->ySnap->value=0.001
leDisplayOptionsForm->xSnap->value=0.001
_hiFormApplyCB(leDisplayOptionsForm)
)

procedure(gridcourse()
leDisplayOptionsForm->ySnap->value=0.01
leDisplayOptionsForm->xSnap->value=0.01
_hiFormApplyCB(leDisplayOptionsForm)
)

procedure(orthomove()
leDisplayOptionsForm->snapMode->value="orthogonal"
leDisplayOptionsForm->segSnapMode->value="orthogonal"
_hiFormApplyCB(leDisplayOptionsForm)
)

procedure(anymove()
leDisplayOptionsForm->snapMode->value="anyAngle"
leDisplayOptionsForm->segSnapMode->value="anyAngle"
_hiFormApplyCB(leDisplayOptionsForm)
)

procedure(gridoff()
leDisplayOptionsForm->type->value= "dots"
_hiFormApplyCB(leDisplayOptionsForm)
)

procedure(gridon()
leDisplayOptionsForm->type->value= "lines"
_hiFormApplyCB(leDisplayOptionsForm)
)

procedure(tensgrid()
leDisplayOptionsForm->spacing->value=0.01
leDisplayOptionsForm->majorSpacing->value=0.1
_hiFormApplyCB(leDisplayOptionsForm)
)

procedure(twosgrid()
leDisplayOptionsForm->spacing->value=0.02
leDisplayOptionsForm->majorSpacing->value=0.08
_hiFormApplyCB(leDisplayOptionsForm)
)

procedure(rmmark()
geHiDeleteAllMarker()
hiiSetCurrentForm('geDeleteAllMarkerForm)
hiFormDone(geDeleteAllMarkerForm)
)

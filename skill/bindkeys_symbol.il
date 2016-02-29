;                  Bind Key Aliases
; Symbol XL, Verilog-XL-Netlist

hiSetBindKeys( "Symbol" list(

;    Key            [;alternate encodings used for same key]
;                Normal Action
;                [Enter Function Action    ;EF]

list("<Ctrl>W" "CCScloseWindow()")
list("<DrawThru1>"        "schDirectEdit(1)"
                "geSingleSelectBox()")    ;EF
list("<DrawThru3>"        "hiZoomIn()"
                "hiZoomIn()")    ;EF
list("<Key>9"            "geEnterAddNetProbe()")
list("<Key>="            "schHiOpenSymbolOrSchematicView(geGetEditCellView() hiGetCurrentWindow())")
list("<Key>BackSpace"        "schHiDelete()"
                "deletePoint()")    ;EF
list("<Key>Delete"        "schHiDelete()")
list("<Key>Down"        "geScroll(nil \"s\" nil)")
list("<Key>Escape"        nil
                "cancelEnterFun()")    ;EF
list("<Key>`"           "hiZoomRelativeScale(getCurrentWindow() 0.5)"
                "hiZoomRelativeScale(getCurrentWindow() 0.5)")  ;EF
list("<Key>F1"            "hiHelp('window deGetAppInfo(deGetEditViewType(hiGetCurrentWindow()))->appName)")
list("<Key>F11"            "deToggleAssistants()")
list("<Key>F3"            nil
                "hiToggleEnterForm()")    ;EF
list("<Key>F4"            "geTogglePartialSelect()")
list("<Key>F6"            "hiRedraw()")
list("<Key>Left"        "geScroll(nil \"w\" nil)")
list("<Key>Right"        "geScroll(nil \"e\" nil)")
list("<Key>Up"            "geScroll(nil \"n\" nil)")
list("<Key>["            "hiZoomRelativeScale(getCurrentWindow() 0.8)")
list("<Key>]"            "hiZoomRelativeScale(getCurrentWindow() 1.25)")
list("<Key>a"            "geSingleSelectPoint()")
list("<Key>c"            "schHiCopy()")
list("<Key>d"            "geSubSelectPoint()")
list("<Key>f"            "schZoomFit(1.0 0.9)")
list("<Key>g"            "schHiFindMarker()")
list("<Key>l"            "schHiCreateSymbolLabel()")
list("<Key>m"            "schHiMove()")
list("<Key>n"            "schHiCreateNoteShape()")
list("<Key>o"            "schHiDisplayOptions()")
list("<Key>p"            "schHiCreateSymbolPin()")
list("<Key>q"            "schHiObjectProperty()"
                "schHiObjectProperty()")    ;EF
list("<Key>r"            "schHiRotate(t)"
                "schSetEnv(\"rotate\" t)")    ;EF
list("<Key>s"            "schHiSymStretch()")
list("<Key>t"            "schHiEditText()")
list("<Key>u"            "hiUndo()")
list("<Key>v"            "hiVectorPan()")
list("<Key>x"            "schHiVIC()")
list("<Key>z"            "hiZoomIn()")
list("Ctrl Shift<Key>z"        "hiNextWinView(hiGetCurrentWindow())")
list("Ctrl<Btn1Down>"        "mouseSubSelectPt()"
                "mouseSubSelectPt()")    ;EF
list("Ctrl<Btn4Down>"        "hiZoomInAtMouse()")
list("Ctrl<Btn5Down>"        "hiZoomOutAtMouse()")
list("Ctrl<DrawThru1>"        "schDirectEdit(3)"
                "geSubSelectBox()")    ;EF
list("Ctrl<Key>Tab"        "hiLowerWindow(hiGetCurrentWindow())")
list("Ctrl<Key>a"        "schSelectAllFig()")
list("Ctrl<Key>d"        "schDeselectAllFig()")
list("Ctrl<Key>e"        "schHiReturn()")
list("Ctrl<Key>f"        "schSetSelectOptions()")
list("Ctrl<Key>g"        "geHiDeleteMarker()")
list("Ctrl<Key>r"        nil
                "schSetEnv(\"upsideDown\" t)")    ;EF
list("Ctrl<Key>s"        "_schHiSaveAs()")
list("Ctrl<Key>t"        "schHiZoomToSelSet()")
list("Ctrl<Key>v"        "hiFocusToCIW(hiGetCurrentWindow())")
list("Ctrl<Key>z"        "hiZoomOut()")
list("None<Btn1Down>"        "mouseSingleSelectPt()"
                "mouseAddPt(t)")    ;EF
list("None<Btn1Down>(2)"    "schHiDefaultAction()"
                "schMouseApplyOrFinish()")    ;EF
list("None<Btn2Down>"        "hiRepeat()"
                "schCmdOption()")    ;EF
list("None<Btn3Down>"        "schHiMousePopUp()"
                "schHiMousePopUp()")    ;EF
list("None<Btn3Down>(2)"    nil
                "hiToggleEnterForm()")    ;EF
list("None<Btn4Down>"        "geScroll(nil \"n\" nil)")
list("None<Btn5Down>"        "geScroll(nil \"s\" nil)")
list("Shift<Btn1Down>"        "mouseAddSelectPt()"
                "mouseAddSelectPt()")    ;EF
list("Shift<Btn2Down>"        ""
                "schShiftCmdOption()")    ;EF
list("Shift<Btn4Down>"        "geScroll(nil \"w\" nil)")
list("Shift<Btn5Down>"        "geScroll(nil \"e\" nil)")
list("Shift<DrawThru1>"        "schDirectEdit(2)"
                "geAddSelectBox()")    ;EF
list("Shift<DrawThru3>"        "hiZoomOut()"
                "hiZoomOut()")    ;EF
list("Shift<Key>F4"        "geToggleAreaSelectOption()")
list("Shift<Key>a"        "schSingleSelectBox()")
list("Shift<Key>d"        "schSubSelectBox()")
list("Shift<Key>f"        "hiZoomAbsoluteScale(getCurrentWindow() 0.9)")
list("Shift<Key>g"        "schHiFindMarker()")
list("Shift<Key>l"        "schHiCreateNoteLabel()")
list("Shift<Key>n"        "schHiCreateNoteLabel()")
list("Shift<Key>o"        "schHiEditorOptions()")
list("Shift<Key>q"        "schHiCellViewProperty()"
                "schHiCellViewProperty()")    ;EF
list("Shift<Key>r"        nil
                "schSetEnv(\"sideways\" t)")    ;EF
list("Shift<Key>s"        "_schHiSave()")
list("Shift<Key>u"        "hiRedo()")
list("Shift<Key>v"        "_deToggleAssistant(\"World View\")")
list("Shift<Key>x"        "schHiVICAndSave()")
list("Shift<Key>z"        "hiPrevWinView(hiGetCurrentWindow())")
list("<Key>,"	""	"schSetEnv(\"sideways\" t)")
list("<Key>."	""	"schSetEnv(\"upsideDown\" t)")
))
